import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

class LoginPageBloc extends BlocBase {
  StreamController<bool> _loginController = StreamController.broadcast();

  StreamController<bool> _exibirSenhaController = StreamController.broadcast();

  StreamController<bool> _manterLogadoController = StreamController.broadcast();

  get loginStream => _loginController.stream;

  get exibirSenhaStream => _exibirSenhaController.stream;

  get manterLogadoStream => _manterLogadoController.stream;

  void changeLoginState(bool value) => _loginController.sink.add(value);

  void changeExibirSenha(bool value) => _exibirSenhaController.sink.add(value);

  void changeManterLogado(bool value) =>
      _manterLogadoController.sink.add(value);

  @override
  void dispose() {
    _loginController.close();
    _exibirSenhaController.close();
    _manterLogadoController.close();
    super.dispose();
  }
}
