import 'package:erp/app/modules/sessao/sessao_controller.dart';
import 'package:flutter/material.dart';
import 'package:models/model/enum/clients.dart';
import 'package:models/model/models.dart';

class SessaoPageCompoment {
  //-------------------------------------------------- VARIAVEIS ------------------------------------------------------------
  SessaoController controller = SessaoController();


  //-------------------------------------------------- WIDGETS --------------------------------------------------------------
  Widget body() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<List<DadosSessaoDTO>>(
        future: controller.buscarSessoes(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());

            default:
              if (snapshot.hasError) return _createDataTable([]);

              return ListView(
                children: [
                  _createDataTable(snapshot.data!)
                ],
              );
          }
        },
      ),
    );
  }

  DataTable _createDataTable(List<DadosSessaoDTO> dados) {
    return DataTable(columns: _createColumns(), rows: _createRows(dados));
  }

  List<DataColumn> _createColumns() {
    return [
      DataColumn(label: Text('Usuário')),
      DataColumn(label: Text('Aplicativo')),
      DataColumn(label: Text('Abertura')),
      DataColumn(label: Text('Ultima comunicação')),
      DataColumn(label: Center(child: Text('Encerrar sessão'))),
    ];
  }
  List<DataRow> _createRows(List<DadosSessaoDTO> dados) {
    return dados
        .map((d) => DataRow(cells: [
      DataCell(Text(d.nomeUsuario ?? "")),
      DataCell(Text(d.client!.descricao)),
      DataCell(Text(d.dataAbertura.toString())),
      DataCell(Text(d.dataUltimaAtualizacao.toString())),
      DataCell(IconButton(onPressed: (){}, icon: Icon(Icons.close), tooltip: "Encerrar está sessao",))
    ]))
        .toList();
  }
}
