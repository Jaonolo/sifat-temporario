import 'package:http/http.dart' as http;
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class SessaoClientRequest {
  static Future<ResponsePws> criarSessao(
      PWSConfig pwsConfig, LoginClientDTO loginClientDTO) async {
    return await RequesterPws(config: pwsConfig).consome(
        urlPws: UrlPws.criarSessaoClient(),
        body: loginClientDTO,
        converter: (json) => TokenDTO.fromJson(json));
  }

  static Future<ResponsePws> atualizarSessao(
      PWSConfig pwsConfig, String token) async {
    return await RequesterPws(config: pwsConfig).consome(
        urlPws: UrlPws.atualizarSessaoClient(),
        headerParams: {
          "Authorization": "Bearer $token",
        },
        converter: (json) => TokenDTO.fromJson(json));
  }
}
