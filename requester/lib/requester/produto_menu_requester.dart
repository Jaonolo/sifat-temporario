import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class ProdutoMenuRequester {
  static Future<ResponsePws> buscar(
      PWSConfig config, String token, int offset) async {
    Map<String, dynamic> query = {};
    if (offset != "") query["offset"] = offset;

    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getProdutoMenus(),
        headerParams: {
          'token': token,
        },
        queryParams: query,
        converter: (json) => ProdutoMenu.listFromJson(json));
  }

  static Future<ResponsePws> buscarPaginado(
    PWSConfig config,
    String token,
  ) async {
    int totalMenus = 0;
    ResponsePws responsePws;
    List<ProdutoMenu> menus = [];

    do {
      responsePws = await buscar(config, token, menus.length);
      if (responsePws.status == 200) {
        String contentRange = responsePws.headers["content-range"];
        totalMenus = int.parse(contentRange.split("/")[1]);
        menus.addAll(responsePws.content);
      } else {
        throw PwsException(responsePws.content);
      }
    } while (totalMenus > menus.length);

    responsePws.content = menus;
    return responsePws;
  }
}
