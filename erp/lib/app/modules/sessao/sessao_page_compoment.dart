import 'package:erp/app/modules/sessao/sessao_controller.dart';
import 'package:erp/app/widgets/confirmation_dialog.dart';
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

      return ListView(
        children: [_createDataTable()],
      );
    });
  }

  DataTable _createDataTable() {
    return DataTable(
      columns: _createColumns(),
      rows: _createRows(),
    );
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('Usuário')),
      DataColumn(label: Text('Estação')),
      DataColumn(label: Text('Aplicativo')),
      DataColumn(label: Text('Servico')),
      DataColumn(label: Text('Abertura')),
      DataColumn(label: Text('Ultima comunicação')),
      DataColumn(label: Center(child: Text('Encerrar sessão'))),
    ];
  }

  List<DataRow> _createRows() {
      return controller.dadosSessoes
          .map((d) => DataRow(cells: [
                DataCell(Text(d.nomeUsuario ?? "-----")),
                DataCell(Text(d.nomeEstacao ?? "-----")),
                DataCell(Text(d.client!.descricao)),
                DataCell(
                    Text(d.servico != null ? d.servico!.descricao : "-----")),
                DataCell(Text(d.dataAbertura.toString())),
                DataCell(Text(d.dataUltimaAtualizacao.toString())),
                DataCell(IconButton(
                  onPressed: () => onEncerrarSessao(d),
                  icon: Icon(Icons.close),
                  tooltip: "Encerrar está sessao",
                ))
              ]))
          .toList();
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
