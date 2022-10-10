import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/usuario_requester.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utils/utils/responsive_utils.dart';
import 'package:utils/utils/string_utils.dart';
import 'package:utils/widgets/confirmation_dialog.dart';
import 'package:waycard/config/app_config.dart';
import 'package:waycard/pages/atulizar_senha/atualizar_senha_bloc.dart';
import 'package:waycard/utils/waycard_utils.dart';
import 'package:waycard/widgets/waycard_text_field.dart';

class AtualizarSenhaPageComponent {
//-------------------------------------------------- VARIAVEIS ------------------------------------------------------------
  late BuildContext _context;
  late Size _appSize;
  TextEditingController _novaSenhaController = TextEditingController();
  TextEditingController _senhaAtualController = TextEditingController();
  TextEditingController _confirmacaoNovaSenhaController = TextEditingController();
  AtualizarSenhaBloc _bloc = BlocProvider.getBloc<AtualizarSenhaBloc>();
  FocusNode _novaSenhaNode = FocusNode();
  FocusNode _confirmacaoNovaSenhaNode = FocusNode();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _exibirConfirmacaoNovaSenha = false;
  bool _exibirNovaSenha = false;
  bool _exibirSenhaAtual = false;

//-------------------------------------------------- WIDGETS --------------------------------------------------------------

  PreferredSizeWidget appBar() {
    return AppBar(
      title: Text("Perfil"),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _inputSenhaAtual(),
            _inputNovaSenha(),
            _inputConfirmacaoNovaSenha(),
            _btnAtualizarSenha(),
          ],
        ),
      ),
    );
  }

  Widget _inputSenhaAtual() {
    return Padding(
      padding: EdgeInsets.all(
          ResponsiveUtils.responsiveSize(appSize: _appSize, baseValue: 5)),
      child: StreamBuilder(
          stream: _bloc.senhaAtualStream,
          builder: (context, snapshot) {
            return WaycardTextField(
              appSize: _appSize,
              label: "Senha atual",
              icon: Icons.lock,
              obscure: !_exibirSenhaAtual,
              controller: _senhaAtualController,
              color: AppConfig.theme.colorScheme.secondary,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => _novaSenhaNode.requestFocus(),
              validator: (value) {
                if (value != null && value.isEmpty)
                  return "Por favor, informe a senha atual";
                if (StringUtils.stringToMd5(value!) !=
                    AppConfig.application.user!.password)
                  return "Senha incorreta";
                return null;
              },
              suffixIcon: IconButton(
                icon: Icon(
                  _exibirSenhaAtual
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: ResponsiveUtils.responsiveSize(
                      appSize: _appSize, baseValue: 22),
                ),
                onPressed: () {
                  _exibirSenhaAtual = !_exibirSenhaAtual;
                  _bloc.changeSenhaAtual(_exibirSenhaAtual);
                },
              ),
            );
          }),
    );
  }

  Widget _inputNovaSenha() {
    return Padding(
      padding: EdgeInsets.all(
          ResponsiveUtils.responsiveSize(appSize: _appSize, baseValue: 8)),
      child: StreamBuilder(
          stream: _bloc.novaSenhaStream,
          builder: (context, snapshot) {
            return WaycardTextField(
              appSize: _appSize,
              label: "Nova senha",
              icon: Icons.lock,
              obscure: !_exibirNovaSenha,
              focusNode: _novaSenhaNode,
              controller: _novaSenhaController,
              color: AppConfig.theme.colorScheme.secondary,
              textInputAction: TextInputAction.next,
              onFieldSubmitted: (_) => _confirmacaoNovaSenhaNode.requestFocus(),
              validator: (value) {
                if (value != null && value.isEmpty)
                  return "Por favor, informe a nova senha";

                String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
                RegExp regExp = new RegExp(pattern);
                if (!regExp.hasMatch(value!))
                  return 'A senha deve conter ao menos: \n8 caracteres 1 letra minúscula, \n1 letra maiuscula e 1 número.';

                return null;
              },
              suffixIcon: IconButton(
                icon: Icon(
                  _exibirNovaSenha
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: ResponsiveUtils.responsiveSize(
                      appSize: _appSize, baseValue: 22),
                ),
                onPressed: () {
                  _exibirNovaSenha = !_exibirNovaSenha;
                  _bloc.changeNovaSenha(_exibirNovaSenha);
                },
              ),
            );
          }),
    );
  }

  Widget _inputConfirmacaoNovaSenha() {
    return Padding(
      padding: EdgeInsets.all(
          ResponsiveUtils.responsiveSize(appSize: _appSize, baseValue: 8)),
      child: StreamBuilder(
          stream: _bloc.confirmacaoNovaSenhaStream,
          builder: (context, snapshot) {
            return WaycardTextField(
              appSize: _appSize,
              label: "Confirmação de senha",
              icon: Icons.lock,
              focusNode: _confirmacaoNovaSenhaNode,
              obscure: !_exibirConfirmacaoNovaSenha,
              controller: _confirmacaoNovaSenhaController,
              color: AppConfig.theme.colorScheme.secondary,
              validator: (value) {
                if (value != null && value.isEmpty)
                  return "Por favor, confirme a nova senha";

                String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
                RegExp regExp = new RegExp(pattern);
                if (!regExp.hasMatch(value!))
                  return 'A senha deve conter ao menos: \n8 caracteres 1 letra minúscula, \n1 letra maiuscula e 1 número.';

                if (_novaSenhaController.text != value)
                  return "As novas senhas não conferem";
                return null;
              },
              suffixIcon: IconButton(
                icon: Icon(
                  _exibirConfirmacaoNovaSenha
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  size: ResponsiveUtils.responsiveSize(
                      appSize: _appSize, baseValue: 22),
                ),
                onPressed: () {
                  _exibirConfirmacaoNovaSenha = !_exibirConfirmacaoNovaSenha;
                  _bloc.changeConfirmacaoNovaSenha(_exibirConfirmacaoNovaSenha);
                },
              ),
            );
          }),
    );
  }

  Widget _btnAtualizarSenha() {
    return Padding(
        padding: EdgeInsets.all(
            ResponsiveUtils.responsiveSize(appSize: _appSize, baseValue: 8)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ResponsiveUtils.responsiveSize(
                  appSize: _appSize, baseValue: 32)),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(100)),
                color: AppConfig.theme.colorScheme.secondary),
            child: TextButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)))
              ),
              child: Text(
                "Alterar",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: ResponsiveUtils.responsiveSize(
                        appSize: _appSize, baseValue: 18)),
              ),
              onPressed: () {
                _onAlterarSenha();
              },
            ),
          ),
        ));
  }

  //-------------------------------------------------- FUNCOES --------------------------------------------------------------

  setSize(Size size) {
    _appSize = size;
  }

  Future initialize({required BuildContext context}) async {
    _context = context;
  }

  void _onAlterarSenha() {
    if (_formKey.currentState!.validate()) {
      var user = AppConfig.application.user;
      user!.password =
          StringUtils.stringToMd5(_novaSenhaController.text.trim());

      WayCardUtils.showProgress();
      UsuarioRequester.atualizarDados(AppConfig.application.pwsConfigWaychef, user)
          .then((response) async {
        if (response.isSuccess) {
          WayCardUtils.closeProgress();

          var prefs = await SharedPreferences.getInstance();
          if (prefs.getBool("manter_logado")!)
            prefs.setString("password", _novaSenhaController.text.trim());

          showDialog(
              context: _context,
              builder: (context) =>
                  ConfirmationDialog(
                    title: "Dados",
                    message: "Atualização da senha realizada com sucesso!",
                  )).then((_) => Navigator.pop(_context));
        } else {
          throw PwsException(response.content);
        }
      }).catchError((error, s) {
        WayCardUtils.catchError(error, s, closeable: true);
      });
    }
  }
}
