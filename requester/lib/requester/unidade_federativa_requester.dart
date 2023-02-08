import 'package:http/http.dart';
import 'package:models/model/enum/clients.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class UnidadeFederativaRequester {
  static Future<ResponsePws> listar(PWSConfig config) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getUnidadesFederativas(),
        headerParams: {"clientKey": config.client.clientKey},
        converter: (json) => UnidadeFederativa.listFromJson(json));
  }
}
