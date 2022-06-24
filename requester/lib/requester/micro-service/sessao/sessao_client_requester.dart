
import 'package:models/model/models.dart';
import 'package:requester/requester/requester_pws.dart';
import '../../../config/pws_config.dart';
import '../../../response/response_pws.dart';
import 'package:http/http.dart' as http;

import '../../../url_pws/url_pws.dart';


class SessaoClientRequest {
  static Future<ResponsePws> criarSessao(PWSConfig pwsConfig,
      LoginClientDTO loginClientDTO) async {
    http.Response response = await RequesterPws(config: pwsConfig).consome(
      urlPws: UrlPws.criarSessao(),
      body: loginClientDTO,
    );
    return ResponsePws(response: response, converter: (json) => TokenDTO.fromJson(json));
  }

  static Future<ResponsePws> atualizarSessao(PWSConfig pwsConfig,
      String token) async {
    http.Response response = await RequesterPws(config: pwsConfig).consome(
      urlPws: UrlPws.atualizarSessao(),
        headerParams: {
          "Authorization": "Bearer $token",
        },
    );
    return ResponsePws(response: response, converter: (json) => TokenDTO.fromJson(json));
  }
}