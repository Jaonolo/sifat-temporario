import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:models/model/enum/request_type.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class RequesterPws {
  PWSConfig config;

  RequesterPws({required this.config});

  Future<ResponsePws> consome({
    required UrlPws urlPws,
    Map<String, String>? headerParams,
    Map<String, String>? pathParams,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? formParams,
    dynamic body,
    bool debug = true,
    Function(dynamic json)? converter,
  }) async {
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

    http.StreamedResponse? response;
    try {
      switch (urlPws.type) {
        case RequestType.GET:
          var request = http.Request('GET', Uri.parse(url));
          request.body = json.encode({});
          request.headers.addAll(headerParams!);
          response = await request.send();

          // response = await http.get(Uri.parse(url), headers: headerParams);
          break;
        case RequestType.PUT:
          var request = http.Request('PUT', Uri.parse(url));
          request.body = json.encode(data);
          request.headers.addAll(headerParams!);
          response = await request.send();

          // response =
          // await http.put(Uri.parse(url), headers: headerParams, body: data);
          break;
        case RequestType.POST:
          var request = http.Request('POST', Uri.parse(url));
          request.body = json.encode(data);
          request.headers.addAll(headerParams!);
          response = await request.send();

          // response =
          // await http.post(Uri.parse(url), headers: headerParams, body: data);
          break;
        case RequestType.DELETE:
          var request = http.Request('DELETE', Uri.parse(url));
          request.body = json.encode({});
          request.headers.addAll(headerParams!);
          response = await request.send();

          // response = await http.delete(Uri.parse(url), headers: headerParams);
          break;
        default:
          PwsAlert pws = PwsAlert();
          pws.message = "Erro ao montar o requester";
          throw PwsException(pws);
      }
      if (debug) {
        print('Retorno status: ${response.statusCode}');
        print('Retorno Headers: ${response.headers}');
        if (response.statusCode > 300)
          print('Retorno body: ${await response.stream.bytesToString()}');
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

    return await toResponserPWS(response, converter);
  }

  Future<ResponsePws> toResponserPWS(
      http.StreamedResponse response, Function(dynamic json)? converter) async {
    return ResponsePws(
        response: response,
        body: await response.stream.bytesToString(),
        converter: (json) =>
            ItemConfiguracaoIntegradorWaychef.listFromJson(json));
  }
}
