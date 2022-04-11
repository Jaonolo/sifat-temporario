import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';

class CriarContaPageBloc extends BlocBase {
  StreamController<bool> _loadController = StreamController.broadcast();

  StreamController<bool> _senhaController = StreamController.broadcast();

  StreamController<bool> _confirmacaoSenhaController = StreamController
      .broadcast();

  get loadStream => _loadController.stream;

  get senhaStream => _senhaController.stream;

  get confirmacaoSenhaStream => _confirmacaoSenhaController.stream;

  void changeLoadState(bool value) => _loadController.sink.add(value);

  void changeExibirSenha(bool value) => _senhaController.sink.add(value);

  void changeConfirmacaoSenha(bool value) =>
      _confirmacaoSenhaController.sink.add(value);

  @override
  void dispose() {
    _loadController.close();
    _senhaController.close();
    _confirmacaoSenhaController.close();
    super.dispose();
  }
}
