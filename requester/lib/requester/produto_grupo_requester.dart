import 'package:http/http.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class ProdutoGrupoRequester {
  static Future<ResponsePws> listar(
      PWSConfig config, String token, bool ignorarVazios) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getProdutoGrupos(),
        headerParams: {
          'token': token,
        },
        queryParams: {
          "ignorarVazios": ignorarVazios,
        },
        converter: (json) => ProdutoGrupo.listFromJson(json));
  }
}
