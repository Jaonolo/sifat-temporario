import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:models/model/models.dart' as u;
import 'package:utils/utils/string_utils.dart';
import 'package:waycard/pages/login_app/metodo_login/metodo_login.dart';

/* autenticação google*/
class SingInGoogle {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  var user = FirebaseAuth.instance.currentUser;


  // deslogar
  logout() {
    _googleSignIn.disconnect();
  }

  //login com o google
  Future<User> getGoogleLogin(BuildContext context) async {
    final GoogleSignInAccount? account = await _googleSignIn.signIn();
    final GoogleSignInAuthentication authentication = await account!
        .authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);

    final UserCredential authResult = await _auth.signInWithCredential(
        credential);
    final User user = authResult.user!;

    //para guardar nas preferencias
    var userPreferencias = u.Usuario();
    userPreferencias.email = user.email;
    userPreferencias.uid = user.uid;
    //para carregar as preferencias email e senha
    MetodoLogin().carregarPreferences(userPreferencias);

    // colocando o email, senha e uid do usuario que é fornecido pelo firebase
    var _user = u.Usuario();
    _user.email = user.email;
    _user.uid = user.uid;
    _user.password = StringUtils.stringToMd5(user.uid);
    //verifica se a conta ja existe no banco de dados ou nao
    // se ja for cadastrado manda pra tela inicial se nao for pra tela de cadastro
    MetodoLogin.login(_user, false, user.uid, context);
    return user;
  }
}




