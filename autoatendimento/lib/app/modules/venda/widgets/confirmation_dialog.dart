import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final Function onConfirm;
  final Function onCancel;
  final bool showCancelButton;
  final bool autoCloseable;
  final String txtConfirmar;
  final String txtCancelar;

  ConfirmationDialog(
      {required this.title,
      required this.message,
      required this.onConfirm,
      required this.onCancel,
      this.showCancelButton = false,
      this.autoCloseable = true,
      this.txtConfirmar = "Confirmar",
      this.txtCancelar = "Cancelar"});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      title: title != null ? Text(title) : null,
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text(message),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (showCancelButton) ...[
                  Expanded(child: _btnCancel(context)),
                ],
                Expanded(child: _btnconfirmation(context)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _btnCancel(BuildContext context) {
    return InkWell(
      onTap: () {
        if (autoCloseable) close(context);
        if (onCancel != null) onCancel();
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Icon(
                Icons.cancel,
                color: Colors.red,
              ),
            ),
            SizedBox(
              width: 3,
            ),
            Flexible(
              child: FittedBox(
                child: Text(
                  txtCancelar,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _btnconfirmation(BuildContext context) {
    return InkWell(
      onTap: () {
        if (autoCloseable) close(context);
        if (onConfirm != null) onConfirm();
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
            ),
            SizedBox(
              width: 3,
            ),
            Flexible(
              child: FittedBox(
                child: Text(
                  txtConfirmar,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void close(BuildContext context) => Navigator.pop(context);
}
