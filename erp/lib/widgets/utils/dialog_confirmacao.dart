import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_theme.dart';


class DialogoConfirmacao extends StatelessWidget {
  final String titulo;
  final String mensagem;
  final Widget? corpo;
  final Function? onConfirm;
  final Function? onCancel;
  final bool mostrarCancelar;
  final bool autoCloseable;
  final String txtConfirmar;
  final String txtCancelar;

  const DialogoConfirmacao(
      {this.titulo = '',
        this.mensagem = '',
        this.corpo,
        this.onConfirm,
        this.onCancel,
        this.mostrarCancelar = false,
        this.autoCloseable = true,
        this.txtConfirmar = "Confirmar",
        this.txtCancelar = "Cancelar"});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      title: Text(titulo),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text(mensagem),
            const SizedBox(height: 20),
            corpo ?? Container(),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: _btnConfirmar()),
                if (mostrarCancelar) ...[
                  const SizedBox(width: 8),
                  Expanded(child: _btnCancelar()),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _btnCancelar() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: AppTheme.cancel,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: const EdgeInsets.fromLTRB(10, 16, 10, 16),
      ),
      icon: const Icon(
        Icons.close,
        color: Colors.white,
        size: 18,
      ),
      onPressed: () {
        if (autoCloseable) Get.back();
        if (onCancel != null) onCancel!();
      },
      label: Text(
        txtCancelar,
        softWrap: false,
        style: TextStyle(
          fontSize: AppTheme.h2,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _btnConfirmar() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: AppTheme.confirm,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: const EdgeInsets.fromLTRB(10, 16, 10, 16),
      ),
      icon: const Icon(
        Icons.check,
        color: Colors.white,
        size: 18,
      ),
      onPressed: () {
        if (autoCloseable) Get.back();
        if (onConfirm != null) onConfirm!();
      },
      label: Text(
        txtConfirmar,
        softWrap: false,
        style: TextStyle(
          fontSize: AppTheme.h2,
          color: Colors.white,
        ),
      ),
    );
  }
}
