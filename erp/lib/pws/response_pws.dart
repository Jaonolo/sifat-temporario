import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:xml/xml.dart' as xml;

import 'media_type.dart';
import 'pws_alert.dart';
import 'exception/pws_exception.dart';


class ResponsePws {
  int status = 600;
  String body = '';
  bool isSuccess = false;
  bool hasContent = false;
  dynamic content;
  Map<String, dynamic>? headers;

  ResponsePws({
    required Response? response,
    Function(dynamic json)? converter,
    MediaType mediaType = MediaType.JSON,
  }) {
    // print('##################');
    // print(response);
        if(response == null){
      PwsAlert pwsAlert = PwsAlert();
      pwsAlert.message = "Falha na conexão. \nPor favor, reinicie o aplicativo.";
      throw PwsException(pwsAlert);
    }
    status = response.statusCode!;
    headers = response.headers.map;

    body = json.encode(response.data);

    isSuccess = status < 400;
    hasContent = isSuccess && status != 204;
    switch (status) {
      case 200:
      case 201:
      case 202:
        if (converter != null) {
          switch (mediaType) {
            case MediaType.JSON:
              content = converter(jsonDecode(body));
              break;

            case MediaType.XML:
              content = converter(xml.XmlDocument.parse(body));
              break;
          }
        }
        break;
      case 204:
        break;
      default:
        if (body.isNotEmpty) {
          content = PwsAlert.fromJson(jsonDecode(body));
        }
    }
  }

  @override
  String toString() {
    return 'ResponsePws{status: $status, _body: $body, isSuccess: $isSuccess, hasContent: $hasContent, content: $content, headers: $headers}';
  }


}
