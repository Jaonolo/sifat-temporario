
import 'package:http/http.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/response/response_pws.dart';

import '../../../url_pws/url_pws.dart';
import '../../requester_pws.dart';


class SessaoUsuarioRequester {

  static Future<ResponsePws> realizaLoginCriaSessao(PWSConfig clientSessao, String token, LoginUsuarioDTO loginUsuarioDTO) async {
    return await RequesterPws(config: clientSessao).consome(
        urlPws: UrlPws.postNovaSessaoUsuario(),
        headerParams: {"Authorization": "Bearer "+token,},
        body: loginUsuarioDTO,
        converter: (json) => TokenDTO.fromJson(json)
    );
  }

  static Future<ResponsePws> encerrarSessao(PWSConfig clientSessao, String token) async {
    return await RequesterPws(config: clientSessao).consome(
        urlPws: UrlPws.postEncerrarSessaoUsuario(),
        headerParams: {"Authorization": "Bearer " + token,}
    );
  }

  static Future<ResponsePws> atualizarSessao(PWSConfig clientSessao, String token) async {
    return await RequesterPws(config: clientSessao).consome(
        urlPws: UrlPws.postAtualizarSessaoUsuario(),
        headerParams: {"Authorization": "Bearer " + token,},
        converter: (json) => TokenDTO.fromJson(json)
    );
  }
}
