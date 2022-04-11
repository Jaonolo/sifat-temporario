import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:http/http.dart';

class ClassificacaoRequester {
  static Future<ResponsePws> carregar(PWSConfig config, String token,
      String tipoClassificacao) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getClassificacao(),
      headerParams: {
        'token': token,
      },
      queryParams: {
        'tipo': tipoClassificacao,
      },
      debug: true,
    );
    return ResponsePws(response: response,
        converter: (json) => Classificacao.listFromJson(json));
  }
}
