import 'package:autoatendimento/app/modules/home/widgets/botao_primario.dart';
import 'package:autoatendimento/app/modules/home/widgets/botao_secundario.dart';
import 'package:flutter/material.dart';

import 'font_utils.dart';

class DialogAuto extends StatelessWidget {
  final String? title;
  final String message;
  final Function onConfirm;
  final Function? onCancel;
  final bool showCancelButton;
  final bool autoCloseable;
  final String txtConfirmar;
  final String txtCancelar;
  final Color colorBtnPositivo;
  final Color colorBtnNegativo;
  final Color colorTextPositivo;
  final Color colorTextNegativo;

  const DialogAuto({
    required this.title,
    required this.message,
    required this.onConfirm,
    this.onCancel,
    this.showCancelButton = true,
    this.autoCloseable = true,
    this.txtConfirmar = "Confirmar",
    this.txtCancelar = "Cancelar",
    this.colorBtnPositivo = Colors.white,
    this.colorBtnNegativo = Colors.white,
    this.colorTextPositivo = Colors.black,
    this.colorTextNegativo = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    return AlertDialog(
      shape: const RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      title: title != null
          ? Center(
              child: Text(
                title!,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: orientation == Orientation.landscape
                        ? FontUtils.h2(context)
                        : FontUtils.h3(context) * 1.1),
              ),
            )
          : null,
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text(message,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: orientation == Orientation.landscape
                        ? FontUtils.h2(context)
                        : FontUtils.h3(context))),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showCancelButton) ...[
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: SizedBox(
                  width: FontUtils.h1(context) * 4.5,
                  child: BotaoSecundario(
                    context: context,
                    descricao: txtConfirmar,
                    function: () {
                      if (autoCloseable) close(context);
                      onConfirm();
                    },
                  ),
                ),
              ),
            ],
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: SizedBox(
                  width: FontUtils.h1(context) * 4.5,
                  child: BotaoPrimario(
                    descricao: txtCancelar,
                    function: () {
                      if (autoCloseable) close(context);
                      if (onCancel != null) onCancel!();
                    },
                  )),
            )
          ],
        ),
      ],
    );
  }

  void close(BuildContext context) => Navigator.pop(context);
}
