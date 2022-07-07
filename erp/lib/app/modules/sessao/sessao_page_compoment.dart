import 'package:erp/app/modules/sessao/sessao_controller.dart';
import 'package:erp/app/widgets/confirmation_dialog.dart';
import 'package:erp/app/widgets/data_table/data_table_custom.dart';
import 'package:erp/app/widgets/data_table/models/row_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:models/model/enum/clients.dart';
import 'package:models/model/models.dart';

class SessaoPageCompoment {
  //-------------------------------------------------- VARIAVEIS ------------------------------------------------------------
  SessaoController controller = SessaoController();
  late BuildContext context;

  //-------------------------------------------------- WIDGETS --------------------------------------------------------------
  Widget body() {
    return Observer(builder: (_) {
      if (controller.carregando)
        return Center(child: CircularProgressIndicator());

      if (controller.dadosSessoes.isEmpty)
        return Center(
          child: Text("Nenhuma sessão encontrada"),
        );

      return _createDataTable();
    });
  }

  Widget _createDataTable() {
    return DataTableCustom<DadosSessaoDTO>(
        cabecalho: Text("Sessões"),
        multiSelecao: true,
        columns: [
          DataColumn(label: Text('Usuário')),
          DataColumn(label: Text('Estação')),
          DataColumn(label: Text('Aplicativo')),
          DataColumn(label: Text('Servico')),
          DataColumn(label: Text('Abertura')),
          DataColumn(label: Text('Ultima comunicação')),
          DataColumn(label: Center(child: Text('Encerrar sessão'))),
        ],
        rows: controller.dadosSessoes
            .map((d) => [
                  RowCustom(child: Text(d.nomeUsuario ?? "-----"), object: d),
                  RowCustom(child: Text(d.nomeEstacao ?? "-----"), object: d),
                  RowCustom(child: Text(d.client!.descricao), object: d),
                  RowCustom(
                      child: Text(
                          d.servico != null ? d.servico!.descricao : "-----"),
                      object: d),
                  RowCustom(child: Text(d.dataAbertura.toString()), object: d),
                  RowCustom(
                      child: Text(d.dataUltimaAtualizacao.toString()),
                      object: d),
                  RowCustom(
                      child: IconButton(
                        onPressed: () => onEncerrarSessao(d),
                        icon: Icon(Icons.close),
                        tooltip: "Encerrar está sessao",
                      ),
                      object: d),
                ])
            .toList());
  }

//-------------------------------------------------- FUNÇÕES ------------------------------------------------------------
  void initialize({required BuildContext context}) {
    this.context = context;
    controller.buscarSessoes();
  }

  Future<void> onEncerrarSessao(DadosSessaoDTO dto) {
    return showDialog(
        context: context,
        builder: (_) => ConfirmationDialog(
            title: "Atenção!",
            message: "Deseja realemente encerrar esta sessão?",
            showCancelButton: true,
            onConfirm: () => controller.encerrarSessao(dto)));
  }
}
