import 'package:flutter/material.dart';

class DialogInfo extends StatelessWidget {
  final String title;
  final String message;
  final Function? onCancel;
  final bool showCancelButton;
  final bool autoCloseable;
  final String txtCancelar;

  const DialogInfo({Key? key,
    this.title = "",
    this.message = "",
    this.onCancel,
    this.showCancelButton = false,
    this.autoCloseable = true,
    this.txtCancelar = "Cancelar"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      title: Center(
        child: Text(
          title,
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          children: [
            Text(message),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(),
            ),
            SizedBox(
              child: ElevatedButton(
                child: Text(txtCancelar),
                onPressed: () {
                  if (autoCloseable) close(context);
                  if (onCancel != null) onCancel!.call();
                },
              ),
            ),
          ],
        )
      ],
    );
  }

  void close(BuildContext context) => Navigator.pop(context);
}
