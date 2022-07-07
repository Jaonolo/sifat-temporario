import 'package:erp/app/widgets/data_table/models/row_custom.dart';
import 'package:flutter/material.dart';

class DataTableCustom<T> extends StatelessWidget {
  List<DataColumn> columns;
  List<List<RowCustom<T>>> rows;
  Widget cabecalho;
  int rowsPage;
  bool multiSelecao;
  Function(T)? onTapRow;

  DataTableCustom({
    super.key,
    required this.cabecalho,
    required this.columns,
    required this.rows,
    this.onTapRow,
    this.multiSelecao = true,
    this.rowsPage = PaginatedDataTable.defaultRowsPerPage,
  }) {
    if (columns.length != rows.first.length) {
      throw Exception(
          "Quantidade de colunas: ${columns.length} != ${rows.first.length}");
    }
    rowsPage = rows.length < 10 ? rows.length :  10 ;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.all(16),
        children: [
          PaginatedDataTable(
            header: cabecalho,
            rowsPerPage: rowsPage,
            columns: columns,
            source: _DataSource<T>(rows, multiSelecao, onTapRow),
          ),
        ],
    );
  }

  List<T> objectSelecionados(){
    return rows.first.where((e) => e.selected).map((e) => e.object).toList();
  }
}

class _DataSource<T> extends DataTableSource {
  List<List<RowCustom<T>>> rows;
  Function(T)? onTapRow;
  bool multiSelecao;
  int _selectedCount = 0;

  _DataSource(this.rows, this.multiSelecao, this.onTapRow);

  @override
  DataRow getRow(int index) {

    var linha = rows[index];

    return DataRow.byIndex(
      index: index,
      selected: linha.first.selected,
      onSelectChanged: multiSelecao ? (value) {
        if (linha.first.selected != value) {
          _selectedCount += value! ? 1 : -1;
          assert(_selectedCount >= 0);
          linha.first.selected = value;
          notifyListeners();
        }
      } : null,
      onLongPress: onTapRow != null ? () => onTapRow!(linha.first.object) : null,
      cells: linha.map((r) => DataCell(r.child)).toList(),
    );
  }

  @override
  int get rowCount => rows.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;
}