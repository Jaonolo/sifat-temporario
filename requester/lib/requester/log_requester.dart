import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:http/http.dart';

class LogRequester {
  static Future<ResponsePws> gravarLog(PWSConfig config, String token,
      String msg) async {
    Log log = Log();
    log.data = DateTime.now();
    log.descricao = "Debug Waychef Mobile";
    log.tipoLog = "ERRO";
    log.entidade = "LOG";
    log.origemLog = "WAYCHEF_MOBILE";
    log.idExterno = DateTime.now().toString();
    log.stackTrace = msg;

    Response response = await RequesterPws(config: config).consome(
        urlPws: UrlPws.postLog(),
        headerParams: {
          'token': token,
        },
        body: [
          log.toJson()
        ]
    );
    return ResponsePws(
        response: response, converter: (json) => ServicoSitef.fromJson(json));
  }
}
