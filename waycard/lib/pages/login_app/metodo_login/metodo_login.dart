import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/waycard_requester.dart';
import 'package:waycard/config/app_config.dart';
import 'package:waycard/utils/waycard_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waycard/pages/criar_conta/criar_conta_page.dart';
import 'package:waycard/pages/home/home_page.dart';

class MetodoLogin {
  late SharedPreferences _prefs;

  Future login(Usuario user, BuildContext _context) async {
    await WaycardRequester.login(AppConfig.application.pwsConfigWaychef, user)
        .then((response) {
      Usuario usuario = user;
      if (response.isSuccess) {
        usuario = response.content;
        AppConfig.application.user = usuario;
        AppConfig.application.token = response.headers['token'];
        _goToHome(_context);
      } else {
        var pws = response.content as PwsAlert;
        if (pws.code == "USE_3") {
          _goToCriarConta(usuario, _context);
        } else {
          throw PwsException(response.content);
        }
      }
    }).catchError((error, s) {
      WayCardUtils.catchError(error, s);
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

  void _goToCriarConta(Usuario user, BuildContext _context) {
    Navigator.push(
        _context,
        MaterialPageRoute(builder: (context) => CriarContaPage(user: user)));
  }

  void _goToHome(BuildContext _context) {
    Navigator.pushReplacement(
        _context, MaterialPageRoute(builder: (context) => HomePage()));
  }

}