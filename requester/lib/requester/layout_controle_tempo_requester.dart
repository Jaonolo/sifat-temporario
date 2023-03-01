import 'package:http/http.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class LayoutControleTempoRequester {
  static Future<ResponsePws> atualizarlayoutTempo(
      PWSConfig config, String token, List<LayoutControleTempo> tempos) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.putAtualizarLayoutTempo(),
        headerParams: {"token": token},
        body: tempos,
        converter: (json) => LayoutControleTempo.listFromJson(json));

  }
}
