import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:models/model/enum/request_type.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/url_pws/url_pws.dart';

class RequesterPws {
  PWSConfig config;

  RequesterPws({required this.config});

  Future<http.Response> consome({required UrlPws urlPws,
    Map<String, String>? headerParams,
    Map<String, String>? pathParams,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? formParams,
    dynamic body,
    bool debug = true}) async {
    String url = "${config.getUrlBase()}${urlPws.url}";

    if (pathParams != null && pathParams.isNotEmpty) {
      pathParams.forEach((key, value) {
        url = url.replaceAll(key, value);
      });
    }
    if (queryParams != null && queryParams.isNotEmpty) {
      url += "?";
      String params = "";
      queryParams.forEach((key, value) {
        if (params.isNotEmpty) params += "&";

        if (value is List) {
          String listParams = "";
          value.forEach((i) {
            if (listParams.isNotEmpty) listParams += "&";
            listParams += "$key=$i";
          });
          params += listParams;
        } else {
          params += "$key=$value";
        }
      });

      url += params;
    }

    dynamic data;
    if (formParams != null && formParams.isNotEmpty) {
      data = "";
      formParams.forEach((key, value) {
        if (data.isNotEmpty) data += "&";
        data += "$key=$value";
      });

      if (headerParams == null) {
        headerParams = {};
      }
      headerParams['Content-Type'] = 'application/json';
    }

    if (body != null) {
      data = jsonEncode(body);
      if (headerParams == null) {
        headerParams = {};
      }
      headerParams['Content-Type'] = 'application/json';
    }

    if (debug) {
      print('URL: $url');
    }

    http.Response? response;
    try {
      switch (urlPws.type) {
        case RequestType.GET:
          response = await http.get(Uri.parse(url), headers: headerParams);
          break;
        case RequestType.PUT:
          response =
          await http.put(Uri.parse(url), headers: headerParams, body: data);
          break;
        case RequestType.POST:
          response =
          await http.post(Uri.parse(url), headers: headerParams, body: data);
          break;
        case RequestType.DELETE:
          response = await http.delete(Uri.parse(url), headers: headerParams);
          break;
        default:
          PwsAlert pws = PwsAlert();
          pws.message = "Erro ao montar o requester";
          throw PwsException(pws);
      }
      if (debug) {
        print('Retorno status: ${response.statusCode}');
        print('Retorno Headers: ${response.headers}');
        if (response.statusCode > 300) print('Retorno body: ${response.body}');
      }
    } catch (e) {
      print('##############################');
      print('[ERRO NA REQUISIÇÃO HTTP]');
      print(e);
      print('##############################');
      config.ativaUrlSecundaria();
      throw e;
    }

    switch (response.statusCode) {
      case 405:
        config.ativaUrlSecundaria();
        break;

      case 401:
        if (config.redirect != null) {
          config.redirect!.call();
        }
        break;
    }

    return response;
  }
}
