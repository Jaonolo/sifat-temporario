import 'package:flutter/material.dart';
import 'package:erp/theme/app_theme.dart';

class DropDownPersonalizado extends StatelessWidget {

  final String titulo;
  final List<String> itensLista;
  final String valorSelecionado;
  final String? Function(String?)? onChanged;
  final bool ativo;
  final double textSize;
  final int flex;
  final Color? corFundo;
  final Color? corTitulo;

  const DropDownPersonalizado({
    this.titulo = '',
    this.ativo = true,
    this.textSize = 16.0,
    this.flex = 1,
    required this.itensLista,
    required this.valorSelecionado,
    required this.onChanged,
    this.corFundo,
    this.corTitulo
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Material(
        color: corFundo ?? AppTheme.corBranco,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: titulo.isNotEmpty,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  titulo,
                  style: TextStyle(
                      fontSize: textSize,
                      color: corTitulo ?? AppTheme.blackSubtitulo
                  ),
                ),
              ),
            ),
            FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(12.0),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 2.0),
                      ),

                      // InputBorder(
                      //   borderSide: BorderSide(color: Colors.black, width: 2.0),
                      //   // bottom: BorderSide(color: Colors.black, width: 2.0)
                      // ),

                      // Border(bottom: BorderSide(color: Colors.black, width: 2.0),
                    // border:
                    // OutlineInputBorder(
                    //   borderRadius: BorderRadius.only(bottomRight: Radius.zero),
                    // ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: corFundo ?? AppTheme.corBranco,
                      value: valorSelecionado,
                      isDense: true,
                      onChanged: onChanged,
                      items: itensLista.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}