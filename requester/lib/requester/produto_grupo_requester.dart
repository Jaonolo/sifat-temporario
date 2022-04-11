import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:http/http.dart';

class ProdutoGrupoRequester {
  static Future<ResponsePws> listar(PWSConfig config, String token,
      bool ignorarVazios) async {
    Response response = await RequesterPws(config: config).consome(
        urlPws: UrlPws.getProdutoGrupos(),
        headerParams: {
          'token': token,
        },
        queryParams: {
          "ignorarVazios": ignorarVazios,
        }
    );
    return ResponsePws(response: response,
        converter: (json) => ProdutoGrupo.listFromJson(json));
  }
}
