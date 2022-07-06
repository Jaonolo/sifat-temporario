import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/string_utils.dart';
import 'package:waycard/pages/login_app/metodo_login/metodo_login.dart';

class SingInFacebook {
  final facebookLogin = FacebookLogin();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // deslogar
  logout() {
    facebookLogin.logOut();
  }

  //login com o facebook
  Future<bool> getFacebookLogin(BuildContext context) async {
    FacebookLoginResult result = await facebookLogin.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email
    ]);
    switch (result.status) {
      case FacebookLoginStatus.success:
        final FacebookAccessToken fbToken = result.accessToken!;
        final AuthCredential credential = FacebookAuthProvider.credential(
            fbToken.token);
        final UserCredential authResult = await _auth.signInWithCredential(
            credential);
        final User user = authResult.user!;

        //para guardar nas preferencias
        var userPreferencias = Usuario();
        userPreferencias.email = user.email;
        userPreferencias.uid = user.uid;
        //para carregar as preferencias email e senha
        MetodoLogin().carregarPreferences(userPreferencias);

        // colocando o email, senha e uid do usuario que é fornecido pelo firebase
        var _user = Usuario();
        _user.email = user.email;
        _user.uid = user.uid;
        _user.password = StringUtils.stringToMd5(user.uid);
        //verifica se a conta ja existe no banco de dados ou nao
        // se ja for cadastrado manda pra tela inicial se nao for pra tela de cadastro
        MetodoLogin.login(_user,false, user.uid, context);

        break;
      case FacebookLoginStatus.cancel:
        print('Login cancelled by the user.');
        break;
      case FacebookLoginStatus.error:
        print('Something went wrong with the login process.\n'
            'Here\'s the error Facebook gave us: ${result.error}');
        facebookLogin.logOut();
        break;
    }

    return true;
  }
}
