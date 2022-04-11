import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:http/http.dart' as http;

class ProdutoEmpresaRequester {
  static Future<ResponsePws> buscar(PWSConfig config, String token,
      String offset) async {
    Map<String, dynamic> query = {};
    query["offset"] = offset;

    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getProdutos(),
      headerParams: {
        'token': token,
      },
      queryParams: query,
    );
    return ResponsePws(response: response,
        converter: (json) => ProdutoEmpresa.listFromJson(json));
  }

  static Future<ResponsePws> buscarPaginado(PWSConfig config,
      String token) async {
    int totalProdutos = 0;
    ResponsePws responsePws;
    List<ProdutoEmpresa> produtos = [];

    do {
      responsePws = await buscar(config, token, produtos.length.toString());
      if (responsePws.status == 200) {
        String contentRange = responsePws.headers["content-range"];
        totalProdutos = int.parse(contentRange.split("/")[1]);
        produtos.addAll(responsePws.content);
      } else {
        throw PwsException(responsePws.content);
      }
    } while (totalProdutos > produtos.length);

    responsePws.content = produtos;
    return responsePws;
  }
}
