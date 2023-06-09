import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:models/model/enum/media_type.dart';
import 'package:models/model/models.dart';
import 'package:xml/xml.dart';

class ResponsePws {
  int? status;
  String? body;
  late bool isSuccess;
  bool hasContent = false;
  dynamic content;
  late Map<String, dynamic> headers;


  ResponsePws({
    required http.StreamedResponse? response,
    Function(dynamic json)? converter,
    MediaType mediaType = MediaType.JSON,
    String? body
  }) {
    if (response == null) {
      PwsAlert pwsAlert = PwsAlert();
      pwsAlert.message =
      "Falha na conexão. \nPor favor, reinicie o aplicativo.";
      throw PwsException(pwsAlert);
    }
    this.status = response.statusCode;
    this.headers = response.headers;
    this.body = body;

    isSuccess = status! < 400;

    hasContent = isSuccess && status != 204 && body != null && body!.isNotEmpty;

    switch (status) {
      case 200:
      case 201:
      case 202:
        if (converter != null) {
          switch (mediaType) {
            case MediaType.JSON:
              this.content = converter.call(jsonDecode(body!));
              break;

            case MediaType.XML:
              this.content = converter.call(XmlDocument.parse(body!));
              break;
          }
        }
        break;

      default:
        if (body != null && body!.isNotEmpty) {
          Map<String, dynamic> json = jsonDecode(body!);
          PwsAlert pws = PwsAlert();
          pws.code = json['code'] != null ? json['code'].toString() : null;
          pws.description = json['description'] ?? null;
          pws.message = json['message'] ?? null;
          this.content = pws;
        };
    }
  }

  @override
  String toString() {
    return 'ResponsePws{status: $status, _body: $body, isSuccess: $isSuccess, hasContent: $hasContent, content: $content, headers: $headers}';
  }


}
