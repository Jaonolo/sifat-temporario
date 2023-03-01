import 'package:http/http.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class GerenciamentoSessoesRequester {
  static Future<ResponsePws> buscarSessoes(
      PWSConfig pwsConfigGateway, String token) async {
    return await RequesterPws(config: pwsConfigGateway).consome(
        urlPws: UrlPws.getBuscarSessoes(),
        headerParams: {
          'Authorization': "Bearer $token",
        },
        converter: (json) => DadosSessaoDTO.listFromJson(json));
  }
}
