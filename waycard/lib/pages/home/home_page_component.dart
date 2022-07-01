import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/micro-service/sessao/sessao_usuario_requester.dart';
import 'package:requester/requester/waycard_requester.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utils/widgets/confirmation_dialog.dart';
import 'package:waycard/config/app_config.dart';
import 'package:waycard/pages/home/home_page_bloc.dart';
import 'package:waycard/pages/login/login_page.dart';
import 'package:waycard/pages/login_app/metodo_login/metodo_login.dart';
import 'package:waycard/pages/login_app/sign_in_google.dart';
import 'package:waycard/pages/login_app/sing_in_facebook.dart';
import 'package:waycard/pages/perfil/perfil_page.dart';
import 'package:waycard/pages/sobre/sobre_page.dart';
import 'package:waycard/sessao/sessao_service.dart';
import 'package:waycard/utils/waycard_utils.dart';
import 'package:waycard/widgets/cartoes/list_view_cartoes.dart';

class HomePageComponent {
//-------------------------------------------------- VARIAVEIS ------------------------------------------------------------
  HomePageBloc _bloc = BlocProvider.getBloc<HomePageBloc>();
  late BuildContext _context;
  List<ClienteCartao> _cartoes = [];

//-------------------------------------------------- WIDGETS --------------------------------------------------------------
  PreferredSizeWidget appBar() {
    return AppBar(
      title: Text("Carteiras"),
      actions: <Widget>[
        _refreshAction(),
      ],
    );
  }

  Widget _refreshAction() {
    return IconButton(
      icon: Icon(Icons.refresh),
      onPressed: () {
        _bloc.reload();
      },
    );
  }

  Widget body() {
    return StreamBuilder(
        stream: _bloc.reloadStream,
        builder: (context, snapshot) {
          return FutureBuilder(
            future: _carregarCartoes(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());

                default:
                  if (_cartoes.isEmpty) return _txtNenhumCartao();
                  return _listViewCartoes();
              }
            },
          );
        });
  }

  Widget _txtNenhumCartao() {
    return Center(
      child: Text(
        "Você não possui nenhuma carteira cadastrada",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _listViewCartoes() {
    return ListViewCartoes(
      _cartoes,
    );
  }

  Widget drawer() {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: <Widget>[
                  _perfilTile(),
                ],
              ),
            ),
            Divider(),
            _sobreTile(),
            _logoutTile(),
          ],
        ),
      ),
    );
  }

  Widget _perfilTile() {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text("Perfil"),
      onTap: _goToPerfil,
    );
  }

  Widget _sobreTile() {
    return ListTile(
      leading: Icon(Icons.info),
      title: Text("Sobre"),
      onTap: _goToSobre,
    );
  }

  Widget _logoutTile() {
    return ListTile(
      leading: Icon(Icons.exit_to_app),
      title: Text("Sair"),
      onTap: _onLogout,
    );
  }

//-------------------------------------------------- FUNCOES --------------------------------------------------------------
  void initialize({required BuildContext context}) {
    _context = context;
  }

  Future _carregarCartoes() async {
    _cartoes = [];
    await WaycardRequester.listarCartoes(
        AppConfig.application.pwsConfigWaychef, AppConfig.application.tokenUsuario)
        .then((response) async {
      if (response.isSuccess) {
        if (response.hasContent) _cartoes = response.content;
      } else if (response.status == 401) {
        await WaycardRequester.login(
            AppConfig.application.pwsConfigWaychef, AppConfig.application.user!)
            .then((response) async {
          if (response.isSuccess) {
            AppConfig.application.tokenUsuario = response.headers['token'];
            _cartoes = await _carregarCartoes();
          } else {
            throw PwsException(response.content);
          }
        }).catchError((error, s) {
          WayCardUtils.catchError(error, s);
        });
      } else {
        throw PwsException(response.content);
      }
    }).catchError((error, s) {
      WayCardUtils.catchError(error, s);
    });
    return _cartoes;
  }

  void _goToPerfil() {
    Navigator.pop(_context);
    Navigator.push(
        _context, MaterialPageRoute(builder: (context) => PerfilPage()));
  }

  void _goToSobre() {
    Navigator.pop(_context);
    Navigator.push(
        _context, MaterialPageRoute(builder: (context) => SobrePage()));
  }

  Future<void> _onLogout() async {
    if (AppConfig.application.user!.uid != null) {
      SingInGoogle().logout();
      SingInFacebook().logout();
      MetodoLogin().deslogar();
    }
    await SessaoUsuarioRequester.encerrarSessao(AppConfig.application.pwsConfigGateway, AppConfig.application.tokenUsuario);

    SessaoService.stopTimer();

    Navigator.pop(_context);
    showDialog(
        context: _context,
        builder: (context) =>
            ConfirmationDialog(
              title: "Sair",
              showCancelButton: true,
              message: "Tem certeza que deseja sair ?",
              onConfirm: () async {
                var prefs = await SharedPreferences.getInstance();
                prefs.setBool("manter_logado", false);
                Navigator.pushReplacement(_context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            ));
  }
}
