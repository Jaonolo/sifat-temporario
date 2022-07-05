import 'package:erp/app/config/application.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/micro-service/sessao/gerenciamento_sessoes_requester.dart';
import 'package:requester/response/response_pws.dart';
import 'package:utils/extensions/stack_trace_extension.dart';

part "sessao_controller.g.dart";

class SessaoController = SessaoBase with _$SessaoController;

abstract class SessaoBase with Store {

  Future<List<DadosSessaoDTO>> buscarSessoes() async {
    try {

      ResponsePws retorno = await GerenciamentoSessoesRequester.buscarSessoes(
          Application.pwsConfigGateway,
          Application.tokenClient);



      print(retorno);

      return retorno.content;
    } catch (e, s) {
      s.printStackTrace();
      return [];
    }
  }
}