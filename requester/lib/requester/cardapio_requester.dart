import 'package:http/http.dart' as http;
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class CardapioRequester {
  static Future<ResponsePws> buscar(
      PWSConfig config, String token, String idCardapio) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getMenusCardapio(),
        headerParams: {
          "token": token,
        },
        pathParams: {
          "{idCardapio}": idCardapio,
        },
        converter: (json) => CardapioMenu.listFromJson(json));
  }
}
