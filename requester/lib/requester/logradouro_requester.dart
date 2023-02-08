import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:models/model/enum/clients.dart';
import 'package:http/http.dart';

class LogradouroRequester {
  static Future<ResponsePws> buscar(PWSConfig config, String cep) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.getLogradouro(),
      headerParams: {
        "clientKey": config.client.clientKey,
      },
      queryParams: {
        "cep": cep,
      },
        converter: (json) => Logradouro.fromJson(json)
    );
  }
}
