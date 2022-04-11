import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/usuario_requester.dart';
import 'package:utils/utils/patterns.dart';
import 'package:utils/utils/responsive_utils.dart';
import 'package:utils/widgets/confirmation_dialog.dart';
import 'package:waycard/config/app_config.dart';
import 'package:waycard/utils/waycard_utils.dart';
import 'package:waycard/widgets/animations/wave_decoration/wave_decoration.dart';

class RedefinirSenhaPageComponent {
//-------------------------------------------------- VARIAVEIS ------------------------------------------------------------

  late BuildContext _context;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  late Size _appSize;

//-------------------------------------------------- WIDGETS --------------------------------------------------------------
  Widget body() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _wave(),
            _txtInfo(),
            _inputEmail(),
          ],
        ),
      ),
    );
  }

  Widget _wave() {
    return WaveDecoration(
      appSize: _appSize,
      waveHeight: 250,
      title: _txtTitle(),
      colorOneWaveOne: AppConfig.theme.colorScheme.secondary,
      colorTwoWaveOne: AppConfig.theme.primaryColorLight,
      colorOneWaveTwo: AppConfig.theme.primaryColor,
      colorTwoWaveTwo: AppConfig.theme.colorScheme.secondary,
    );
  }

  Widget _txtTitle() {
    return ListTile(
      title: Center(
        child: Text(
          "Redefinição de senha",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: ResponsiveUtils.responsiveSize(
                appSize: _appSize, baseValue: 25),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _txtInfo() {
    return Padding(
      padding: EdgeInsets.all(
          ResponsiveUtils.responsiveSize(appSize: _appSize, baseValue: 16)),
      child: Text(
        "Enviaremos um e-mail com mais informações sobre como redefinir sua senha.",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: ResponsiveUtils.responsiveSize(
              appSize: _appSize, baseValue: 18),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _inputEmail() {
    return Padding(
      padding: EdgeInsets.all(
          ResponsiveUtils.responsiveSize(appSize: _appSize, baseValue: 16)),
      child: Form(
        key: _formKey,
        child: TextFormField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          textInputAction: TextInputAction.go,
          onFieldSubmitted: (_) => _enviarRedefinicao(),
          decoration: InputDecoration(
            labelText: "Email",
            hintText: "ex@exemplo.com",
            prefixIcon: Icon(Icons.email),
            suffixIcon: _btnEnviar(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) return "Digite um email";
            RegExp regex = new RegExp(Patterns.email().toString());
            if (!regex.hasMatch(value)) return 'Email inválido';
            return null;
          },
        ),
      ),
    );
  }

  Widget _btnEnviar() {
    return IconButton(
      iconSize: ResponsiveUtils.responsiveSize(
          appSize: _appSize, baseValue: 35),
      icon: Icon(Icons.send),
      onPressed: _enviarRedefinicao,
    );
  }

//-------------------------------------------------- FUNCOES --------------------------------------------------------------
  setSize(Size size) {
    _appSize = size;
  }

  void initialize({required BuildContext context}) {
    _context = context;
  }

  void _enviarRedefinicao() {
    if (_formKey.currentState!.validate()) {
      WayCardUtils.showProgress();
      UsuarioRequester.esqueciSenha(
          AppConfig.application.pwsConfig, _emailController.text).then((
          response) {
        if (response.status == 202) {
          WayCardUtils.closeProgress();
          showDialog(
              context: _context,
              builder: (context) =>
                  ConfirmationDialog(
                    title: "Senha",
                    message: "E-mail de recuperação enviado com sucesso",
                  )).then((_) => Navigator.pop(_context));
        } else if (response.status == 204) {
          showDialog(
              context: _context,
              builder: (context) =>
                  ConfirmationDialog(
                    message: "Não há nenhuma conta com o e-mail fornecido",
                    txtConfirmar: "OK",
                    onConfirm: () => Navigator.pop(_context),
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
