import 'package:autoatendimento/app/app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/transacao_cartao_requester.dart';
import 'package:web_socket_channel/html.dart';

part 'cancelamento_tef_controller.g.dart';

class CancelamentoTefController = CancelamentoTefBase
    with _$CancelamentoTefController;

abstract class CancelamentoTefBase with Store {
  static AppController appController = Modular.get();
  late HtmlWebSocketChannel channel;

  void cancelamentoTef() {
    Modular.to.pushNamed("/cancelamento_tef");
  }

  @action
  Future<List<TransacaoCartao>> carregaTransacoes() async {
    return await TransacaoCartaoRequester.buscarTransacoes(
            appController.pwsConfig, appController.token, false, 15, "SITEF")
        .then((response) {
      if (response.status == 200) {
        return response.content;
      } else if (response.status == 204) {
        return [];
      } else {
        throw PwsException(response.content);
      }
    });
  }
}