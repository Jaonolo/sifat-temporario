import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/tef/transacao_tef/transacao_tef_controller.dart';
import 'package:autoatendimento/app/modules/venda/pos/sitef_pos.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';

part "pagamentos_controller.g.dart";

class PagamentosController = PagamentosBase with _$PagamentosController;

abstract class PagamentosBase with Store {
  VendaController vendaController = Modular.get();
  HomeController homeController = Modular.get();
  TransacaoTefController transacaoTefController = Modular.get();
  AppController appController = Modular.get();

  Function acaoFormaPagamento(
      FinalizadoraEmpresa finalizadoraEmpresa, BuildContext context) {
    return () {
      vendaController.addNotaFinalizadora(
          finalizadoraEmpresa, vendaController.nota.valorTotal!);

      switch (finalizadoraEmpresa.finalizadora!.finalizadoraRFB) {
        case "DINHEIRO":
          avancar(context);
          break;
        case "CARTAO_CREDITO":
          _transacaoTEF("CREDITO", context, finalizadoraEmpresa);
          break;
        case "CARTAO_DEBITO":
        case "VALE_REFEICAO":
        case "VALE_ALIMENTACAO":
          _transacaoTEF("DEBITO", context, finalizadoraEmpresa);
          break;
      }
    };
  }

  Future<void> _transacaoTEF(String tipoPagamentoTEF, BuildContext context,
      FinalizadoraEmpresa finalizadoraEmpresa) async {
    Modular.to.pushNamed("/transacao");
    if (defaultTargetPlatform == TargetPlatform.windows) {
      transacaoTefController.comunicaWebSocket(context);
      transacaoTefController.transacionar(vendaController.nota.valorTotal!,
          tipoPagamentoTEF, vendaController.nota.id!);
    } else {
      await SitefPOS.transacionar(context, vendaController.nota,
          vendaController.nota.valorTotal!, finalizadoraEmpresa);
    }
  }

  Future<void> avancar(BuildContext context) async {
    //Insere os itens
    await vendaController.insereItensAPI();

    //Receber venda
    await vendaController.receberVendaAPI(context);

    Modular.to.pushNamed("/finalizado");
  }

  void voltarCardapio() {
    Modular.to.popUntil(ModalRoute.withName('/home'));
  }

  void cancelar() {
    homeController.recomecar();
  }
}
