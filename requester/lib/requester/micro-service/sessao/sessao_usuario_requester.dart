
import 'package:http/http.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/response/response_pws.dart';

import '../../../url_pws/url_pws.dart';
import '../../requester_pws.dart';


class SessaoUsuarioRequester {

  static Future<ResponsePws> realizaLoginCriaSessao(PWSConfig clientSessao, String token, LoginUsuarioDTO loginUsuarioDTO) async {
    Response response = await RequesterPws(config: clientSessao).consome(
        urlPws: UrlPws.postNovaSessaoUsuario(),
        headerParams: {"Authorization": "Bearer "+token,},
        body: loginUsuarioDTO
    );
    return ResponsePws(
        response: response, converter: (json) => TokenDTO.fromJson(json));
  }

  static Future<ResponsePws> encerrarSessao(PWSConfig clientSessao, String token) async {
    Response response = await RequesterPws(config: clientSessao).consome(
        urlPws: UrlPws.postEncerrarSessao(),
        headerParams: {"Authorization": "Bearer " + token,}
    );
    return ResponsePws(response: response);
  }

  static Future<ResponsePws> atualizarSessao(PWSConfig clientSessao, String token) async {
    Response response = await RequesterPws(config: clientSessao).consome(
        urlPws: UrlPws.postAtualizarSessaoUsuario(),
        headerParams: {"Authorization": "Bearer " + token,}
    );
    return ResponsePws(
        response: response, converter: (json) => TokenDTO.fromJson(json));
  }
}
