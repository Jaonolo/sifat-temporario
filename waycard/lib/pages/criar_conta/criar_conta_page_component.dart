import 'package:cpf_cnpj_validator/cpf_validator.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/waycard_requester.dart';
import 'package:utils/utils/masks.dart';
import 'package:utils/utils/patterns.dart';
import 'package:utils/utils/responsive_utils.dart';
import 'package:utils/utils/string_utils.dart';
import 'package:waycard/config/app_config.dart';
import 'package:waycard/pages/criar_conta/criar_conta_page_bloc.dart';
import 'package:waycard/pages/login_app/metodo_login/metodo_login.dart';
import 'package:waycard/utils/waycard_utils.dart';
import 'package:waycard/widgets/animations/wave_decoration/wave_decoration.dart';
import 'package:waycard/widgets/codigo_confirmacao_dialog.dart';
import 'package:waycard/widgets/waycard_text_field.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

class CriarContaPageComponent {
  //-------------------------------------------------- VARIAVEIS ------------------------------------------------------------
  bool _isLoading = false;
  bool _exibirSenha = false;
  FocusNode _nomeNode = FocusNode();
  FocusNode _emailNode = FocusNode();
  FocusNode _senhaNode = FocusNode();
  late BuildContext _context;
  late Size _appSize;
  FocusNode _celularNode = FocusNode();
  CriarContaPageBloc _bloc = BlocProvider.getBloc<CriarContaPageBloc>();
  bool _exibirConfirmacaoSenha = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode _confirmacaosenhaNode = FocusNode();
  TextEditingController _cpfController = TextEditingController();
  TextEditingController _nomeController = TextEditingController();
  TextEditingController _senhaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _celularController = TextEditingController();
  TextEditingController _confirmacaoSenhaController = TextEditingController();
  Usuario? _userLoginFaceGoogle;

  //-------------------------------------------------- WIDGETS --------------------------------------------------------------

  Widget body() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: StreamBuilder(
              stream: _bloc.loadStream,
              builder: (context, snapshot) {
                return Column(
                  children: <Widget>[
                    _wave(),
                    _txtCadastre(),
                    _inputCPF(),
                    _inputNome(),
                    _inputCelular(),
                    _inputEmail(),
                    _inputSenha(),
                    _inputConfirmacaoSenha(),
                    SizedBox(
                      height: ResponsiveUtils.responsiveSize(
                          appSize: _appSize, baseValue: 100),
                    )
                  ],
                );
              }),
        ),
      ),
    );
  }

  setSize(Size size) {
    _appSize = size;
  }

  Widget _wave() {
    return WaveDecoration(
      appSize: _appSize,
      waveHeight: 250,
      title: _txtBoasVindas(),
      colorOneWaveOne: AppConfig.theme.colorScheme.secondary,
      colorTwoWaveOne: AppConfig.theme.primaryColorLight,
      colorOneWaveTwo: AppConfig.theme.primaryColor,
      colorTwoWaveTwo: AppConfig.theme.colorScheme.secondary,
    );
  }

  Widget _txtBoasVindas() {
    return ListTile(
      title: Center(
        child: Text(
          "Seja bem-vindo ao WayWallet",
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: ResponsiveUtils.responsiveSize(
                appSize: _appSize, baseValue: 22),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _txtCadastre() {
    return Padding(
      padding: EdgeInsets.only(
          bottom:
          ResponsiveUtils.responsiveSize(appSize: _appSize, baseValue: 8)),
      child: Text(
        "Cadastre-se",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize:
          ResponsiveUtils.responsiveSize(appSize: _appSize, baseValue: 26),
          fontWeight: FontWeight.bold,
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
        icon: Icons.perm_identity,
        controller: _cpfController,
        enabled: !_isLoading,
        color: AppConfig.theme.colorScheme.secondary,
        textInputType: TextInputType.number,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) => _nomeNode.requestFocus(),
        inputFormatters: [MaskTextInputFormatter(mask: Masks.cpf(char: "#"))],
        validator: (value) {
          if (value == null || value.isEmpty) return "Informe o CPF";

          value = StringUtils.removeMascaraInscricaoFederal(value);

          if (value.length <= 11 && !CPFValidator.isValid(value, true))
            return "Informe um CPF válido";
          return null;
        },
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
        focusNode: _nomeNode,
        enabled: !_isLoading,
        icon: Icons.perm_identity,
        controller: _nomeController,
        color: AppConfig.theme.colorScheme.secondary,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) => _celularNode.requestFocus(),
        validator: (value) {
          if (value != null && value.isEmpty)
            return "Por favor, informe o seu nome";
          return null;
        },
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
        enabled: !_isLoading,
        focusNode: _celularNode,
        icon: Icons.phone_iphone,
        controller: _celularController,
        textInputType: TextInputType.phone,
        color: AppConfig.theme.colorScheme.secondary,
        textInputAction: TextInputAction.next,
        onFieldSubmitted: (_) => _emailNode.requestFocus(),
        inputFormatters: [MaskTextInputFormatter(mask: Masks.cel())],
        validator: (value) {
          if (value != null && value.isEmpty)
            return "Por favor, informe o número de contato";
          return null;
        },
      ),
    );
  }

  Widget _inputEmail() {
    if (_userLoginFaceGoogle != null && _userLoginFaceGoogle!.email != null)
      _emailController.text = _userLoginFaceGoogle!.email!;
    return Padding(
      padding: EdgeInsets.all(
          ResponsiveUtils.responsiveSize(appSize: _appSize, baseValue: 8)),
      child: WaycardTextField(
        appSize: _appSize,
        label: "E-mail",
        icon: Icons.email,
        enabled: _userLoginFaceGoogle != null ? false : true,
        focusNode: _emailNode,
        controller: _emailController,
        color: AppConfig.theme.colorScheme.secondary,
        textInputAction: TextInputAction.next,
        textInputType: TextInputType.emailAddress,
        onFieldSubmitted: (_) => _senhaNode.requestFocus(),
        validator: (value) {
          if (value != null && value.isEmpty)
            return "Por favor, informe o e-mail";
          if (!StringUtils.validatePattern(Patterns.email(), value!))
            return "Por favor, insira um e-mail válido";
          return null;
        },
      ),
    );
  }

  Widget _inputSenha() {
    if (_userLoginFaceGoogle != null &&
        _userLoginFaceGoogle!.password != null) {
      _senhaController.text = _userLoginFaceGoogle!.password!;
      return const SizedBox();
    } else {
      return Padding(
        padding: EdgeInsets.all(
            ResponsiveUtils.responsiveSize(appSize: _appSize, baseValue: 8)),
        child: StreamBuilder(
            stream: _bloc.senhaStream,
            builder: (context, snapshot) {
              return WaycardTextField(
                appSize: _appSize,
                label: "Senha",
                icon: Icons.lock,
                enabled: !_isLoading,
                focusNode: _senhaNode,
                obscure: !_exibirSenha,
                controller: _senhaController,
                color: AppConfig.theme.colorScheme.secondary,
                textInputAction: TextInputAction.next,
                onFieldSubmitted: (_) => _confirmacaosenhaNode.requestFocus(),
                validator: (value) {
                  if (value != null && value.isEmpty)
                    return "Por favor, informe a senha";

                  String pattern =
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
                  RegExp regExp = new RegExp(pattern);
                  if (!regExp.hasMatch(value!))
                    return 'A senha deve conter ao menos: \n8 caracteres 1 letra minúscula, \n1 letra maiuscula e 1 número.';
                  return null;
                },
                suffixIcon: IconButton(
                  icon: Icon(
                    _exibirSenha
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    size: ResponsiveUtils.responsiveSize(
                        appSize: _appSize, baseValue: 22),
                  ),
                  onPressed: () {
                    _exibirSenha = !_exibirSenha;
                    _bloc.changeExibirSenha(_exibirSenha);
                  },
                ),
              );
            }),
      );
    }
  }

  Widget _inputConfirmacaoSenha() {
    if (_userLoginFaceGoogle != null &&
        _userLoginFaceGoogle!.password != null) {
      _senhaController.text = _userLoginFaceGoogle!.password!;
      return const SizedBox();
    } else {
      return Padding(
        padding: EdgeInsets.all(
            ResponsiveUtils.responsiveSize(appSize: _appSize, baseValue: 8)),
        child: StreamBuilder(
            stream: _bloc.confirmacaoSenhaStream,
            builder: (context, snapshot) {
              return WaycardTextField(
                appSize: _appSize,
                label: "Confirmação da senha",
                icon: Icons.lock,
                enabled: !_isLoading,
                focusNode: _confirmacaosenhaNode,
                obscure: !_exibirConfirmacaoSenha,
                controller: _confirmacaoSenhaController,
                color: AppConfig.theme.colorScheme.secondary,
                validator: (value) {
                  if (value != null && value.isEmpty)
                    return "Por favor, confirme a senha";

                  String pattern =
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
                  RegExp regExp = new RegExp(pattern);
                  if (!regExp.hasMatch(value!))
                    return 'A senha deve conter ao menos: \n8 caracteres 1 letra minúscula, \n1 letra maiuscula e 1 número.';

                  if (_senhaController.text != value)
                    return "As senhas não conferem";
                  return null;
                },
                suffixIcon: IconButton(
                  icon: Icon(
                    _exibirConfirmacaoSenha ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                    size: ResponsiveUtils.responsiveSize(
                        appSize: _appSize, baseValue: 22),
                  ),
                  onPressed: () {
                    _exibirConfirmacaoSenha = !_exibirConfirmacaoSenha;
                    _bloc.changeConfirmacaoSenha(_exibirConfirmacaoSenha);
                  },
                ),
              );
            }),
      );
    }
  }

  Widget fab() {
    return StreamBuilder<bool>(
        stream: _bloc.loadStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) _isLoading = snapshot.data!;
          return FloatingActionButton(
            child: _isLoading
                ? CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            )
                : Icon(Icons.check),
            onPressed: _onCadastrar,
          );
        });
  }

  //-------------------------------------------------- FUNCOES --------------------------------------------------------------
  void initialize({required BuildContext context, Usuario? user}) {
    _context = context;
    _userLoginFaceGoogle = user;
  }

  void _onCadastrar() {
    if (_formKey.currentState!.validate()) {
      _bloc.changeLoadState(true);

      var user = Usuario();
      //se for login com google ou face ele coloca o uid e a confirmacao do cadastro
      if (_userLoginFaceGoogle != null) {
        user.uid = _userLoginFaceGoogle!.uid!;
        user.email = _userLoginFaceGoogle!.email;
        user.confirmado = true;
        user.password = _userLoginFaceGoogle!.password;
      } else {
        user.password = StringUtils.stringToMd5(_senhaController.text.trim());
      }
      user.cpf =
          StringUtils.removeMascaraInscricaoFederal(_cpfController.text.trim());
      user.nome = _nomeController.text.trim();
      user.telefone =
          StringUtils.removeMascaraTelefone(_celularController.text.trim());
      user.email = _emailController.text.trim();

      WaycardRequester.inserirUsuario(AppConfig.application.pwsConfigWaychef, user)
          .then((response) async {
        if (response.isSuccess) {
          _bloc.changeLoadState(false);
          user = response.content;
          //se for login google ou face ja fica confirmado
          if (user.uid != null) {
            //para logar direto quando esta pelo google ou face
            //faz o login e manda pra tela inicial
            MetodoLogin().login(user, _context);

            //para carregar as preferencias email e senha
            MetodoLogin().carregarPreferences(user);
          } else {
            var result = await showDialog(
                context: _context,
                barrierDismissible: false,
                builder: (context) =>
                    CodigoConfirmacaoDialog(
                      user: user,
                    ));
            if (result != null) Navigator.pop(_context);
          }
        } else {
          throw PwsException(response.content);
        }
      }).catchError((error, s) {
        _bloc.changeLoadState(false);
        WayCardUtils.catchError(error, s);
      });
    }
  }
}
