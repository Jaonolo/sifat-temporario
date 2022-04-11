import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SimpleCustomDialog extends StatelessWidget {
  String? title;
  String? message;
  List<String>? buttons = [];
  List<Function>? actions = [];
  Color? colorButtons;
  bool autoCloseable;

  SimpleCustomDialog(
      {this.title, this.message, this.buttons, this.actions, this.colorButtons, this.autoCloseable = true});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      title: Text(title!),
      content: Text(message!),
      actions: buildActions(context),
    );
  }

  List<TextButton> buildActions(BuildContext context) {
    List<TextButton> list = [];
    if (buttons != null && buttons!.isNotEmpty) {
      for (var i = 0; i < buttons!.length; i++) {
        list.add(TextButton(
          child: Text(
            buttons![i],
            style: TextStyle(color: colorButtons),
          ),
          onPressed: () {
            if (actions != null) actions![i]();
            if (autoCloseable) close(context);
          },
        ));
      }
    }
    return list;
  }

  void close(BuildContext context) {
    Navigator.pop(context);
  }
}
