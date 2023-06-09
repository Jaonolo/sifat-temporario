import 'package:models/model/enum/clients.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class CidadeRequester {
  static Future<ResponsePws> listarUF(
      PWSConfig config, UnidadeFederativa uf) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getCidadesUF(),
        headerParams: {
          "clientKey": config.client.clientKey,
        },
        pathParams: {
          "{uf}": uf.uf!,
        },
        converter: (json) => Cidade.listFromJson(json));
  }
}
