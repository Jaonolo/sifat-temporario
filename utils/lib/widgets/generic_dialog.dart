import 'package:flutter/material.dart';

class GenericDialog extends StatelessWidget {
  final Widget? title;
  final Widget? body;
  final Function? onConfirm;
  final Function? onCancel;
  final bool showCancelButton;
  final bool autoCloseable;

  GenericDialog({this.title,
    this.body,
    this.onConfirm,
    this.onCancel,
    this.showCancelButton = false,
    this.autoCloseable = true});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      title: title != null ? title : null,
      content: body,
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    List<Widget> actions = [];

    if (showCancelButton)
      actions.add(Container(
        width: width * 0.70 / 2,
        child: TextButton.icon(
          icon: Icon(
            Icons.cancel,
            color: Colors.red,
          ),
          label: Text(
            "Cancelar",
            style: TextStyle(fontSize: width * 0.04),
          ),
          onPressed: () {
            if (autoCloseable) close(context);
            if (onCancel != null) onCancel!();
          },
        ),
      ));

    actions.add(Container(
      width: width * 0.70 / 2,
      child: TextButton.icon(
        icon: Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
        label: Text(
          "Confirmar",
          style: TextStyle(fontSize: width * 0.04),
        ),
        onPressed: () {
          if (autoCloseable) close(context);
          if (onConfirm != null) onConfirm!();
        },
      ),
    ));

    return actions;
  }

  void close(BuildContext context) => Navigator.pop(context);
}
