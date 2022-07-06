import 'package:erp/app/modules/sessao/sessao_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:models/model/enum/clients.dart';

class SessaoPageCompoment {
  //-------------------------------------------------- VARIAVEIS ------------------------------------------------------------
  SessaoController controller = SessaoController();

  //-------------------------------------------------- WIDGETS --------------------------------------------------------------
  Widget body() {
    return Observer(builder: (_) {
      print('AQUI!!! ${controller.carregando}');

      if (controller.carregando) return Center(child: CircularProgressIndicator());

      return ListView(
        children: [_createDataTable()],
      );
    });
  }

  DataTable _createDataTable() {
    return DataTable(columns: _createColumns(), rows: _createRows());
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
                onPressed: () => controller.encerrarSessao(d),
                icon: Icon(Icons.close),
                tooltip: "Encerrar está sessao",
              ))
            ]))
        .toList();
  }

//-------------------------------------------------- FUNÇÕES ------------------------------------------------------------
  void initialize() {
    controller.buscarSessoes();
  }
}
