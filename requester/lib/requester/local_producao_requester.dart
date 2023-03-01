import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class LocalProducaoRequester {
  static Future<ResponsePws> buscar(PWSConfig config, String token) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getLocaisProducao(),
        headerParams: {
          "token": token,
        },
        converter: (json) => LocalProducao.listFromJson(json));
  }
}
