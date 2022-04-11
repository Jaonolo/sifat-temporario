import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/usuario_requester.dart';
import 'package:requester/requester/waycard_requester.dart';
import 'package:utils/utils/masks.dart';
import 'package:utils/utils/responsive_utils.dart';
import 'package:utils/utils/string_utils.dart';
import 'package:utils/widgets/confirmation_dialog.dart';
import 'package:waycard/config/app_config.dart';
import 'package:waycard/pages/atulizar_senha/atualizar_senha_page.dart';
import 'package:waycard/utils/waycard_utils.dart';
import 'package:waycard/widgets/codigo_confirmacao_dialog.dart';
import 'package:waycard/widgets/waycard_text_field.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerfilPageComponent {
//-------------------------------------------------- VARIAVEIS ------------------------------------------------------------

  Usuario _user = AppConfig.application.user!;
  late BuildContext _context;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _celularController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  late Size _appSize;

//-------------------------------------------------- WIDGETS --------------------------------------------------------------
  PreferredSizeWidget appBar() {
    return AppBar(
      title: Text("Perfil"),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _inputCPF(),
              _inputNome(),
              _inputCelular(),
              _inputEmail(),
              _btnAtualizarDados(),
              (_user.uid != null) ? const SizedBox() : _btnAtualizarSenha(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _inputCPF() {
    return Padding(
      padding: EdgeInsets.all(
          ResponsiveUtils.responsiveSize(appSize: _appSize, baseValue: 8)),
      child: WaycardTextField(
        appSize: _appSize,
        label: "CPF",
        enabled: false,
        icon: Icons.perm_identity,
        color: AppConfig.theme.colorScheme.secondary,
        initialValue: CPFValidator.format(_user.cpf!),
      ),
    );
  }

  Widget _inputNome() {
    return Padding(
      padding: EdgeInsets.all(
          ResponsiveUtils.responsiveSize(appSize: _appSize, baseValue: 8)),
      child: WaycardTextField(
        appSize: _appSize,
        label: "Nome completo",
        icon: Icons.perm_identity,
        color: AppConfig.theme.colorScheme.secondary,
        controller: _nomeController,
        textInputAction: TextInputAction.next,
      ),
    );
  }

  Widget _inputCelular() {
    return Padding(
      padding: EdgeInsets.all(
          ResponsiveUtils.responsiveSize(appSize: _appSize, baseValue: 8)),
      child: WaycardTextField(
        appSize: _appSize,
        label: "Celular",
        icon: Icons.phone_iphone,
        color: AppConfig.theme.colorScheme.secondary,
        controller: _celularController,
        textInputAction: TextInputAction.next,
        textInputType: TextInputType.phone,
        inputFormatters: [MaskTextInputFormatter(mask: Masks.cel())],
      ),
    );
  }

  Widget _inputEmail() {
    return Padding(
      padding: EdgeInsets.all(
          ResponsiveUtils.responsiveSize(appSize: _appSize, baseValue: 8)),
      child: WaycardTextField(
        appSize: _appSize,
        enabled: (_user.uid != null) ? false : true,
        label: "E-mail",
        icon: Icons.email,
        controller: _emailController,
        textInputAction: TextInputAction.next,
        textInputType: TextInputType.text,
        color: AppConfig.theme.colorScheme.secondary,
      ),
    );
  }

  Widget _btnAtualizarDados() {
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
              style: ButtonStyle(shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100)))
              ),
              child: Text(
                "Atualizar dados",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: ResponsiveUtils.responsiveSize(
                        appSize: _appSize, baseValue: 18)),
              ),
              onPressed: _verificaAtualizar,
            ),
          ),
        ));
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
                "Alterar Senha",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: ResponsiveUtils.responsiveSize(
                        appSize: _appSize, baseValue: 18)),
              ),
              onPressed: () {
                _onAtualizarSenha();
              },
            ),
          ),
        ));
  }

//-------------------------------------------------- FUNCOES --------------------------------------------------------------

  setSize(Size size) {
    _appSize = size;
  }

  void initialize({required BuildContext context}) {
    _context = context;
    carregarDados();
  }

  void _onAtualizarSenha() {
    Navigator.pop(_context);
    Navigator.push(_context,
        MaterialPageRoute(builder: (context) => AtualizarSenhaPage()));
  }

  void carregarDados() {
    _nomeController.text = _user.nome!;
    _celularController.text = _user.telefone!;
    _emailController.text = _user.email!;
  }

  _verificaAtualizar() {
    //verifica se algum dado mudou
    if (_user.nome != _nomeController.text ||
        _user.telefone !=
            StringUtils.removeMascaraTelefone(_celularController.text.trim()) ||
        _user.email != _emailController.text) {
      _user.nome = _nomeController.text.trim();
      _user.telefone =
          StringUtils.removeMascaraTelefone(_celularController.text.trim());

      validacao();
    } else {
      showDialog(
          context: _context,
          builder: (context) =>
              ConfirmationDialog(
                title: "Atualizar",
                message: "Nenhum dado para ser atualizado",
                txtConfirmar: "OK",
              ));
    }
  }

  validacao() async {
    WayCardUtils.showProgress();
    //se tiver mudança no email sera enviado email de confirmação
    if (_user.email != _emailController.text) {
      WaycardRequester.reenviarCodigo(AppConfig.application.pwsConfig, _user)
          .then((response) async {
        WayCardUtils.closeProgress();
        if (response.status == 204) {
          var result = await showDialog(
              context: _context,
              barrierDismissible: false,
              builder: (context) =>
                  CodigoConfirmacaoDialog(
                    user: _user,
                    mensagem: true,
                  ));
          _user.email = _emailController.text.trim();
          atualiza();
          if (result != null) {
            Navigator.pop(_context);
          }
        } else {
          throw PwsException(response.content);
        }
      }).catchError((e, s) {
        WayCardUtils.catchError(e, s, closeable: true);
      });
    } else {
      atualiza();
    }
  }

  atualiza() {
    UsuarioRequester.atualizarDados(AppConfig.application.pwsConfig, _user)
        .then((response) async {
      WayCardUtils.closeProgress();
      if (response.isSuccess) {
        AppConfig.application.user = _user;
        var prefs = await SharedPreferences.getInstance();
        if (prefs.getBool("manter_logado")!) {
          prefs.setString("email", _emailController.text.trim());
        }
        showDialog(
            context: _context,
            builder: (context) =>
                ConfirmationDialog(
                  title: "Dados",
                  message: "Atualização realizada com sucesso!",
                  txtConfirmar: "OK",
                )).then((_) => Navigator.pop(_context));
      } else {
        throw PwsException(response.content);
      }
    }).catchError((error, s) {
      WayCardUtils.catchError(error, s, closeable: true);
    });
  }
}
