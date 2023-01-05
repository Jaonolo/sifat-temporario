import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DropDownButtonPadrao extends StatelessWidget {

  // final String? titulo;
  final List<String> itensLista;
  final String valorSelecionado;
  final Function? onChanged;
  final bool ativo;
  final double textSize;
  final int flex;

  const DropDownButtonPadrao({
    // this.titulo = '',
    this.ativo = true,
    this.textSize = 16.0,
    this.flex = 1,
    required this.itensLista,
    required this.valorSelecionado,
    this.onChanged,
});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      child: Material(
        color: Theme.of(context).backgroundColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   titulo!,
            //   style: TextStyle(
            //     fontSize: textSize,
            //   ),
            // ),
            // const SizedBox(height: 12.0),
            FormField<String>(
              builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(12.0),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      iconEnabledColor: Color.fromRGBO(133, 133, 133, 1),
                         style: GoogleFonts.openSans(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      letterSpacing: 0.25,
                    ),
                        value: valorSelecionado,
                        isDense: true,
                        onChanged: (newValue) {
                          onChanged!(newValue);
                        },
                        items: itensLista.map((String value) {
                          return DropdownMenuItem<String>(
                            value: 'Plano',
                            child: Text('Plano'),
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
    );;
  }
}
