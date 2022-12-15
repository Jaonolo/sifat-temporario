// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:erp/requester/url_pws.dart';

import 'request_type.dart';

class RequesterPws {
  RequesterPws();

  Future<Response?> consome(
      {required UrlPws urlPws,
      Map<String, String>? headerParams,
      Map<String, String>? pathParams,
      Map<String, dynamic>? queryParams,
      Map<String, dynamic>? formParams,
      dynamic body,
      bool debug = true}) async {
    String url = urlPws.url;

    if (pathParams != null && pathParams.isNotEmpty) {
      pathParams.forEach((key, value) {
        url = url.replaceAll(key, value);
      });
    }

    // if (queryParams != null && queryParams.isNotEmpty) {
    //   url += "?";
    //   String params = "";
    //   queryParams.forEach((key, value) {
    //     if (params.isNotEmpty) params += "&";
    //
    //     if (value is List) {
    //       String listParams = "";
    //       value.forEach((i) {
    //         if (listParams.isNotEmpty) listParams += "&";
    //         listParams += "$key=$i";
    //       });
    //       params += listParams;
    //     } else {
    //       params += "$key=$value";
    //     }
    //   });
    //
    //   url += params;
    // }

    dynamic data;
    if (formParams != null && formParams.isNotEmpty) {
      data = "";
      formParams.forEach((key, value) {
        if (data.isNotEmpty) data += "&";
        data += "$key=$value";
      });

      headerParams ??= {};
      headerParams['Content-Type'] = 'application/x-www-form-urlencoded';
    }

    if (body != null) {
      if (body is List) {
        List lista = [];
        body.forEach((element) {
          lista.add(element.toMap());
        });

        data = jsonEncode(lista);
      } else {
        data = jsonEncode(body);
      }
      headerParams ??= {};
      headerParams['Content-Type'] = 'application/json';
    }

    if (debug) {
      print('URL: $url');
      print('Header: $headerParams');
      print('Tamanho Body: ${jsonEncode(body).length}');
//      StringUtils.printWrapped('Body: $body');
    }
    var dio = Dio();
    Response? response;
    try {
      switch (urlPws.type) {
        case RequestType.GET:
          response = await dio.get(
            url,
            options: Options(headers: headerParams),
            queryParameters: queryParams,
          );
          break;
        case RequestType.PUT:
          response = await dio.put(
            url,
            options: Options(headers: headerParams),
            queryParameters: queryParams,
            data: data,
          );
          break;
        case RequestType.POST:
          response = await dio.post(
            url,
            options: Options(headers: headerParams),
            queryParameters: queryParams,
            data: data,
          );
          break;
        case RequestType.DELETE:
          response = await dio.delete(
            url,
            options: Options(headers: headerParams),
            queryParameters: queryParams,
          );
          break;
        default:
          return null;
      }

      if (debug) {
        print('Retorno status: ${response.statusCode}');
        print('Retorno Headers: ${response.headers}');
        if (response.statusCode! > 300) print('Retorno body: ${response.data}');
      }
    } catch (e) {
      print('##############################');
      print('[ERRO NA REQUISIÇÃO HTTP]');
      DioError error = e as DioError;
      print(error.message);
      print('##############################');
      return error.response;
    }

    return response;
  }
}
