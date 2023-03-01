import 'dart:async';

import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/usuario_requester.dart';
import 'package:utils/utils/string_utils.dart';
import 'package:utils/utils/token_utils.dart';
import 'package:waycard/config/app_config.dart';
import 'package:waycard/sessao/sessao_service.dart';
import 'package:waycard/utils/waycard_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waycard/pages/criar_conta/criar_conta_page.dart';
import 'package:waycard/pages/home/home_page.dart';
import 'package:models/model/enum/clients.dart' as enumClient;
import 'package:requester/requester/micro-service/sessao/sessao_usuario_requester.dart';

class MetodoLogin {
  static late SharedPreferences _prefs;

  static Future<bool> login(Usuario user, bool manterLogado, String? password, BuildContext _context) async {

    LoginUsuarioDTO loginUsuarioDTO = new LoginUsuarioDTO();
    loginUsuarioDTO.client = enumClient.Clients.WAYCARD;
    loginUsuarioDTO.clientKey = enumClient.Clients.WAYCARD.clientKey;
    loginUsuarioDTO.versao = enumClient.Clients.WAYCARD.versao;
    loginUsuarioDTO.nomeEstacao = null;

    loginUsuarioDTO.username = user.email;
    loginUsuarioDTO.password = StringUtils.stringToMd5(password!).toUpperCase();

    String idUsuario = "";

    try {
      await SessaoUsuarioRequester.realizaLoginCriaSessao(
              AppConfig.application.pwsConfigGateway,
              AppConfig.application.tokenClient,
              loginUsuarioDTO)
          .then((response) async {
        Usuario usuario = user;

        if (response.status == 200) {
          AppConfig.application.tokenUsuario = response.content.token;
          JwtTokenDecodeDTO jwtTokenDecodeDTO =  TokenUtils.decodeToken(AppConfig.application.tokenUsuario);
          print(jwtTokenDecodeDTO);
          idUsuario = response.headers["idusuario"];

          if (manterLogado) {
            _prefs = await SharedPreferences.getInstance();
            _prefs.setBool("manter_logado", true);
            _prefs.setString("email", user.email!);
            _prefs.setString("password", password);
          }
        } else {
          var pws = response.content as PwsAlert;
          if (pws.code == "USE_3") {
            _goToCriarConta(user, _context);
          } else {
            throw PwsException(response.content);
          }
        }
      });
    } catch (error, s) {
      WayCardUtils.catchError(error, s);
      return false;
    }

    await _carregarUsuario(idUsuario);

    _goToHome(_context);

    return true;
  }

   static  _carregarUsuario(String idUsuario) async {

    await UsuarioRequester.buscarUsuarioById(AppConfig.application.tokenUsuario, AppConfig.application.pwsConfigWaychef, int.parse(idUsuario))
        .then((response) {
      if (response.status == 200) {
        Usuario user =  response.content;

        AppConfig.application.user = user;

      } else {
        if (response.status == 404) {
          throw Exception("Serviço indisponível");
        } else {
          PwsAlert alert = response.content;
            throw "${alert.message}";
        }
      }
    });
  }

  //deixa salvo o email e senha e manter logado
  Future<void> carregarPreferences(Usuario user) async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setBool("manter_logado", true);
    _prefs.setString("email", user.email!);
    _prefs.setString("password", user.uid!);
  }

  //tira o manter logado e esqueci email e senha
  Future<void> deslogar() async {
    _prefs = await SharedPreferences.getInstance();
    _prefs.setBool("manter_logado", false);
    _prefs.setString("email", "");
    _prefs.setString("password", "");
  }

  static void _goToCriarConta(Usuario user, BuildContext _context) {
    Navigator.push(
        _context,
        MaterialPageRoute(builder: (context) => CriarContaPage(user: user)));
  }

  static void _goToHome(BuildContext _context) {
    //Rotina de atualiza sessao
   SessaoService.startAtualizaSessaoUsuario();

    Navigator.pushReplacement(
        _context, MaterialPageRoute(builder: (context) => HomePage()));
  }

}