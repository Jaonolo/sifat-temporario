import 'package:http/http.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class SessaoServicoRequest {
  static Future<ResponsePws> encerrarSessao(PWSConfig pwsConfig, String token) async {
    Response response = await RequesterPws(config: pwsConfig).consome(
        urlPws: UrlPws.postEncerrarSessaoServico(),
        headerParams: {"Authorization": "Bearer " + token,}
    );
    return ResponsePws(response: response);
  }
}