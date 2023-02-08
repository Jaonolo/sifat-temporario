import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class CanalVendaRequester {
  static Future<ResponsePws> buscarTodos(PWSConfig config, String token) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getBuscarTodosCanalVenda(),
        headerParams: {
          "token": token,
        },
        converter: (json) => CanalVenda.listFromJson(json));
  }

  static Future<ResponsePws> buscarPorId(
      PWSConfig config, String token, String id) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getBuscarPorIdCanalVenda(),
        headerParams: {
          "token": token,
        },
        pathParams: {
          "{idCanal}": id,
        },
        converter: (json) => CanalVenda.fromJson(json));
  }
}
