import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/waycard_requester.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utils/utils/hex_color.dart';
import 'package:utils/utils/responsive_utils.dart';
import 'package:utils/utils/string_utils.dart';
import 'package:utils/widgets/animated_loading_button.dart';
import 'package:waycard/config/app_config.dart';
import 'package:waycard/pages/criar_conta/criar_conta_page.dart';
import 'package:waycard/pages/home/home_page.dart';
import 'package:waycard/pages/login/login_page_bloc.dart';
import 'package:waycard/pages/login_app/sign_in_google.dart';
import 'package:waycard/pages/login_app/sing_in_facebook.dart';
import 'package:waycard/pages/redefinir_senha/redefinir_senha_page.dart';
import 'package:waycard/utils/waycard_utils.dart';
import 'package:waycard/widgets/animations/wave_decoration/wave_decoration.dart';
import 'package:waycard/widgets/waycard_text_field.dart';

class LoginPageComponent {
//-------------------------------------------------- VARIAVEIS ------------------------------------------------------------
  bool _isLogging = false;
  bool _exibirSenha = false;
  bool _manterLogado = false;
  LoginPageBloc _bloc = BlocProvider.getBloc<LoginPageBloc>();
  FocusNode _senhaNode = FocusNode();
  late BuildContext _context;
  late Size _appSize;
  late SharedPreferences _prefs;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  FocusNode _emailNode = FocusNode();

//-------------------------------------------------- WIDGETS --------------------------------------------------------------

  Widget body() {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    _wave(),
                    _inputUsuario(),
                    SizedBox(
                      height: ResponsiveUtils.responsiveSize(
                          appSize: _appSize, baseValue: 10),
                    ),
                    _inputSenha(),
                    SizedBox(
                      height: ResponsiveUtils.responsiveSize(
                          appSize: _appSize, baseValue: 1),
                    ),
                    _rowActionsLogin(),
                    SizedBox(
                      height: ResponsiveUtils.responsiveSize(
                          appSize: _appSize, baseValue: 1),
                    ),
                    _btnLogar(),
                    SizedBox(
                      height: ResponsiveUtils.responsiveSize(
                          appSize: _appSize, baseValue: 20),
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        _btnFacebook(),
                        SizedBox(
                            width: MediaQuery
                                .of(_context)
                                .size
                                .width * 0.15),
                        _btnGoogle(),
                        SizedBox(height: 55),
//                        _btnIcloud()
                      ],
                    ),
                    _btnCadastrar(),
                  ],
                ),
              ),
            ),
            _logoWaybe(),
          ],
        ),
      ),
    );
  }

  Widget _wave() {
    return WaveDecoration(
      title: _logo(),
      colorOneWaveOne: AppConfig.theme.colorScheme.secondary,
      colorTwoWaveOne: AppConfig.theme.primaryColorLight,
      colorOneWaveTwo: AppConfig.theme.primaryColor,
      colorTwoWaveTwo: AppConfig.theme.colorScheme.secondary,
      appSize: _appSize,
    );
  }

  Widget _logo() {
    return Padding(
      padding: EdgeInsets.all(
          ResponsiveUtils.responsiveSize(appSize: _appSize, baseValue: 20)),
      child: Image.asset(
        "assets/logomarca_waywallet.png",
        width:
        ResponsiveUtils.responsiveSize(appSize: _appSize, baseValue: 260),
        color: Colors.grey[300],
      ),
    );
  }

  Widget _inputUsuario() {
    return WaycardTextField(
      appSize: _appSize,
      label: "E-mail",
      icon: Icons.email,
      controller: _emailController,
      color: AppConfig.theme.colorScheme.secondary,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (_) => _senhaNode.requestFocus(),
      focusNode: _emailNode,
      validator: (value) {
        if (value != null && value.isEmpty)
          return "Por favor, informe o e-mail";
        return null;
      },
    );
  }

  Widget _inputSenha() {
    return StreamBuilder(
        stream: _bloc.exibirSenhaStream,
        builder: (context, snapshot) {
          return WaycardTextField(
            appSize: _appSize,
            label: "Senha",
            icon: Icons.lock,
            focusNode: _senhaNode,
            obscure: !_exibirSenha,
            controller: _senhaController,
            color: AppConfig.theme.colorScheme.secondary,
            textInputAction: TextInputAction.go,
            onFieldSubmitted: (_) => _logar(),
            suffixIcon: IconButton(
              iconSize: ResponsiveUtils.responsiveSize(
                  appSize: _appSize, baseValue: 25),
              icon: Icon(_exibirSenha
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined),
              onPressed: () {
                _exibirSenha = !_exibirSenha;
                _bloc.changeExibirSenha(_exibirSenha);
              },
            ),
          );
        });
  }

  Widget _rowActionsLogin() {
    return Center(
      child: Column(
        children: <Widget>[
          _chkManterLogado(),
          _btnEsqueciSenha(),
        ],
      ),
    );
  }

  Widget _chkManterLogado() {
    return InkWell(
      onTap: () {
        _bloc.changeManterLogado(!_manterLogado);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder<bool>(
              stream: _bloc.manterLogadoStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) _manterLogado = snapshot.data!;
                return Checkbox(
                  value: _manterLogado,
                  onChanged: (value) {
                    _bloc.changeManterLogado(value!);
                  },
                );
              }),
          Text(
            "Manter-me conectado",
            style: TextStyle(
                fontSize: ResponsiveUtils.responsiveSize(
                    appSize: _appSize, baseValue: 18)),
          ),
        ],
      ),
    );
  }

  Widget _btnEsqueciSenha() {
    return Center(
      child: InkWell(
        onTap: _goToRedefinicaoSenha,
        child: Padding(
          padding: EdgeInsets.all(
              ResponsiveUtils.responsiveSize(appSize: _appSize, baseValue: 8)),
          child: Text(
            "Esqueceu a senha ?",
            style: TextStyle(
                fontSize: ResponsiveUtils.responsiveSize(
                    appSize: _appSize, baseValue: 18)),
          ),
        ),
      ),
    );
  }

  Widget _btnLogar() {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: ResponsiveUtils.responsiveSize(
                appSize: _appSize, baseValue: 32)),
        child: StreamBuilder(
            initialData: _isLogging,
            stream: _bloc.loginStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) _isLogging = snapshot.data as bool;
              return AnimatedLoadingButton(
                onTap: _logar,
                text: "ENTRAR",
                color: AppConfig.theme.colorScheme.secondary,
                elevation: 7,
                isLoading: _isLogging,
                borderRadius: 30,
              );
            }));
  }

  Widget _btnGoogle() {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.all(Radius.circular(4)),
      color: HexColor('#DB4437'),
      child: InkWell(
        onTap: () => SingInGoogle().getGoogleLogin(_context),
        child: Container(
          width: MediaQuery
              .of(_context)
              .size
              .width * 0.36,
          height: 40,
          child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Image.asset(
              'assets/google_logo.png',
              width: 26,
              color: Colors.white,
            ),
            Text(
              "GOOGLE",
              style: TextStyle(color: Colors.white),
            )
          ]),
        ),
      ),
    );
  }

  Widget _btnFacebook() {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.all(Radius.circular(4)),
      color: Colors.blue,
      child: InkWell(
        onTap: () =>
        {
          SingInFacebook().getFacebookLogin(_context),
          _isLogging = true
        },
        child: Container(
          width: MediaQuery
              .of(_context)
              .size
              .width * 0.36,
          height: 40,
          child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Image.asset("assets/logo_do_facebook.png",
                width: 25, color: Colors.white),
            Text("FACEBOOK")
          ]),
        ),
      ),
    );
  }

  Widget _btnCadastrar() {
    return Padding(
      padding: EdgeInsets.all(
          ResponsiveUtils.responsiveSize(appSize: _appSize, baseValue: 8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Não tem conta ?",
            style: TextStyle(
              fontSize: ResponsiveUtils.responsiveSize(
                  appSize: _appSize, baseValue: 14),
              fontWeight: FontWeight.normal,
            ),
          ),
          InkWell(
            onTap: _goToCriarConta,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Cadastre-se",
                  style: TextStyle(
                      color: AppConfig.theme.primaryColorLight,
                      fontWeight: FontWeight.w500,
                      fontSize: ResponsiveUtils.responsiveSize(
                          appSize: _appSize, baseValue: 16),
                      decoration: TextDecoration.underline)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _logoWaybe() {
    return Padding(
      padding: EdgeInsets.all(
          ResponsiveUtils.responsiveSize(appSize: _appSize, baseValue: 12)),
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Image.asset(
          "assets/by-sifat.png",
          width:
          ResponsiveUtils.responsiveSize(appSize: _appSize, baseValue: 80),
          color: Colors.grey,
        ),
      ),
    );
  }

//-------------------------------------------------- FUNCOES --------------------------------------------------------------

  Future initialize({required BuildContext context}) async {
    _context = context;
    _carregarPreferences();
  }

  void setSize(Size size) {
    _appSize = size;
  }

  Future<void> _carregarPreferences() async {
    _prefs = await SharedPreferences.getInstance();

    if (_prefs.containsKey("manter_logado")) {
      if (_prefs.getBool("manter_logado")!) {
        _manterLogado = true;
        _senhaController.text = _prefs.getString("password")!;
        _emailController.text = _prefs.getString("email")!;
        _logar();
      }
    } else {
      _prefs.setBool("manter_logado", false);
      _prefs.setString("email", "");
      _prefs.setString("password", "");
    }
  }

  void _goToCriarConta() {
    Navigator.push(
        _context, MaterialPageRoute(builder: (context) => CriarContaPage()));
  }

  void _goToHome() {
    Navigator.pushReplacement(
        _context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  void _goToRedefinicaoSenha() {
    Navigator.push(_context,
        MaterialPageRoute(builder: (context) => RedefinirSenhaPage()));
  }

  Future _logar() async {
    if (_emailController.text.isEmpty) {
      _emailNode.requestFocus();
      return;
    }

    if (_senhaController.text.isEmpty) {
      _senhaNode.requestFocus();
      return;
    }

    if (_formKey.currentState!.validate() && !this._isLogging) {
      _bloc.changeLoginState(true);

      var user = Usuario();
      user.email = _emailController.text.trim();
      user.password = StringUtils.stringToMd5(_senhaController.text.trim());

      WaycardRequester.login(AppConfig.application.pwsConfigWaychef, user)
          .then((response) {
        if (response.isSuccess) {
          _bloc.changeLoginState(false);
          user = response.content;
          AppConfig.application.user = user;
          AppConfig.application.token = response.headers['token'];

          if (_manterLogado) {
            _prefs.setBool("manter_logado", true);
            _prefs.setString("email", _emailController.text);
            _prefs.setString("password", _senhaController.text);
          }
          _goToHome();
        } else {
          throw PwsException(response.content);
        }
      }).catchError((error, s) {
        _bloc.changeLoginState(false);
        WayCardUtils.catchError(error, s);
      });
    }
  }
}
