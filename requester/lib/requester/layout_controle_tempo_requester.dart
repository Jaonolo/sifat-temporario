import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:http/http.dart';

class LayoutControleTempoRequester {
  static Future<ResponsePws> atualizarlayoutTempo(PWSConfig config,
      String token, List<LayoutControleTempo> tempos) async {
    Response response = await RequesterPws(config: config).consome(
        urlPws: UrlPws.putAtualizarLayoutTempo(),
        headerParams: {"token": token},
        body: tempos);

    return ResponsePws(
        response: response,
        converter: (json) => LayoutControleTempo.listFromJson(json));
  }
}
