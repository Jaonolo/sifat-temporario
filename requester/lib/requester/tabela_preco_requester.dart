import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:http/http.dart' as http;

class TabelaPrecoRequester {

  static Future<ResponsePws> buscarTodos(PWSConfig config, String token) async {
    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getBuscarTodosTabelaPreco(),
      headerParams: {
        "token": token,
      },
    );
    return ResponsePws(response: response,
        converter: (json) => TabelaPreco.listFromJson(json));
  }

  static Future<ResponsePws> buscarPorId(PWSConfig config, String token,
      String id) async {
    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getBuscarPorIdTabelaPreco(),
      headerParams: {
        "token": token,
      },
      pathParams: {
        "{idTabela}": id,
      },
    );
    return ResponsePws(
        response: response, converter: (json) => TabelaPreco.fromJson(json));
  }

}