import 'package:flutter/material.dart';
import 'package:utils/widgets/select_option_dialog/select_option.dart';

class SelectOptionDialog extends StatefulWidget {
  final String? title;
  final String? message;
  final List<SelectOption> selectOptions;
  final Function(dynamic)? onConfirm;
  final String txtConfirmar;
  final String txtCancelar;

  const SelectOptionDialog({this.title,
    required this.onConfirm,
    required this.selectOptions,
    this.txtConfirmar = "Confirmar",
    this.txtCancelar = "Cancelar",
    this.message});

  @override
  _SelectOptionDialogState createState() => _SelectOptionDialogState();
}

class _SelectOptionDialogState extends State<SelectOptionDialog> {
  SelectOption? selected;

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      title: Center(child: Text(widget.title!)),
      children: _children(context),
    );
  }

  List<Widget> _children(BuildContext context) {
    List<Widget> children = [];
    if (widget.message != null)
      children.add(Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Center(
            child: Text(
              widget.message!,
              style: TextStyle(fontSize: 16),
            )),
      ));

    children.addAll(widget.selectOptions.map((op) => _tile(op)).toList());

    children.add(Row(
      children: _buildActions(context),
    ));
    return children;
  }

  Widget _tile(SelectOption option) {
    return ListTile(
      title: Text(
        option.text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      selected: option == selected,
      onTap: () {
        setState(() {
          selected = option;
        });
      },
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    List<Widget> actions = [];
    actions.add(Container(
      width: width * 0.70 / 2,
      child: TextButton.icon(
        icon: Icon(
          Icons.cancel,
          color: Colors.red,
        ),
        label: Expanded(
          child: FittedBox(
            child: Text(
              widget.txtCancelar,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        onPressed: () {
          close();
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
        label: Expanded(
          child: FittedBox(
            child: Text(
              widget.txtConfirmar,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
        onPressed: () {
          close();
          if (widget.onConfirm != null)
            widget.onConfirm!(selected == null ? null : selected!.value);
        },
      ),
    ));

    return actions;
  }

  void close() => Navigator.pop(context);
}
