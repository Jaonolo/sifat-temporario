import 'package:http/http.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';


class BandeiraCartaoRequester {
  static Future<ResponsePws> carregar(PWSConfig config, String token) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getBandeirasCartao(),
      headerParams: {
        'token': token,
      },
    );
    return ResponsePws(response: response,
        converter: (json) => BandeiraCartao.listFromJson(json));
  }
}
