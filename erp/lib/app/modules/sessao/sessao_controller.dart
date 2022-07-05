import 'package:erp/app/config/application.dart';
import 'package:erp/app/utils/erro_utils.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/micro-service/sessao/gerenciamento_sessoes_requester.dart';

part 'sessao_controller.g.dart';

class SessaoController = SessaoBase with _$SessaoController;

abstract class SessaoBase with Store {
  Future<List<DadosSessaoDTO>> buscarSessoes() async {
    return await GerenciamentoSessoesRequester.buscarSessoes(
            Application.pwsConfigGateway, Application.tokenUsuario)
        .then((response) {
      if (response.status == 200 || response.status == 204)
        return response.content;
      else
        throw PwsException(response.content);
    }).catchError((e, s) {
      ErroUtils.catchError(e, s);
    });
  }

  Future<void> encerrarSessao(String token) async {

  }
}
