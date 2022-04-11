import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utils/widgets/select_option_dialog/select_option.dart';

class SitefDialog extends StatefulWidget {
  static late _SitefDialogState instance;

  final Function? onCancelar;

  SitefDialog({this.onCancelar});

  @override
  _SitefDialogState createState() => instance = _SitefDialogState();
}

class _SitefDialogState extends State<SitefDialog> {
  String? _title;
  Widget? _dialog;
  Widget? _content;
  String? _message;
  List<Widget>? _actions;
  SelectOption? _selected;
  List<Widget>? _contentList;
  Function(dynamic)? _onConfirm;
  TextEditingController? _inputController;

  dynamic shape = RoundedRectangleBorder(
    side: BorderSide(),
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  _SitefDialogState() {
    _inputController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    if (_dialog == null) _dialog = _defaultDialog();
    return _dialog!;
  }

  Widget _defaultDialog() {
    return AlertDialog(
      shape: shape,
      title: _title != null ? Text(_title!) : null,
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: _content,
      ),
      actions: _actions,
    );
  }

  Widget _optionsDialog() {
    return SimpleDialog(
      shape: shape,
      title: Text(_title!),
      children: _contentList,
    );
  }

  Widget _statusWidget(String status) {
    return Text(
      status,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }

  Widget _inputWidget(TextInputType? keyboardType,
      List<TextInputFormatter>? inputFormatters) {
    return TextField(
      autofocus: true,
      controller: _inputController,
      keyboardType: keyboardType != null ? keyboardType : TextInputType.text,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
      inputFormatters: inputFormatters,
    );
  }

  List<Widget> _optionsWidget(String options) {
    List<Widget> content = [];
    List<SelectOption> selectOptions = [];

    var optionsList = options.split(";");
    optionsList.forEach((option) {
      if (option.isNotEmpty) {
        var split = option.split(":");
        selectOptions.add(SelectOption(value: split[0], text: split[1]));
      }
    });

    content.addAll(selectOptions
        .map((option) =>
        ListTile(
          title: Text(
            option.text,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          selected: _selected != null && option.value == _selected!.value,
          onTap: () {
            _selected = option;
            setOptions(_title, _message, _onConfirm);
          },
        ))
        .toList());

    content.add(Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: _actions!,
    ));

    return content;
  }

  void setStatus(String status) {
    setState(() {
      _title = null;
      _content = _statusWidget(status);
      _actions = status.toUpperCase() == "RETIRE O CARTAO DA LEITORA"
          ? []
          : [_btnCancelar()];
      _dialog = _defaultDialog();
    });
  }

  void setOptions(String? title,
      String? content,
      Function(dynamic)? onConfirm,) {
    setState(() {
      _title = title;
      _message = content;
      _onConfirm = onConfirm;
      _actions = [_btnCancelar(), _btnConfirmar(onConfirm, fromOptions: true)];
      _contentList = _optionsWidget(content!);
      _dialog = _optionsDialog();
    });
  }

  void setError(error) {
    setState(() {
      _title = null;
      _content = _statusWidget(error.toString());
      _actions = [
        _btnCancelar(
            onPressed: () {
              Navigator.pop(context);
            },
            txt: "OK")
      ];
      _dialog = _defaultDialog();
    });
  }

  void setInput({String? message,
    TextInputType? keyboardType,
    Function(dynamic)? onConfirm,
    List<TextInputFormatter>? inputFormatters}) {
    setState(() {
      _title = message;
      _content = _inputWidget(keyboardType, inputFormatters);
      _actions = [_btnCancelar(), _btnConfirmar(onConfirm, fromInput: true)];
      _dialog = _defaultDialog();
    });
  }

  void setInformation({String? information, Function(dynamic)? onConfirm}) {
    setState(() {
      _title = null;
      _content = _statusWidget(information!);
      _actions = [_btnConfirmar(onConfirm, txt: "OK")];
      _dialog = _defaultDialog();
    });
  }

  Widget _btnCancelar({Function? onPressed, String txt = "Cancelar"}) {
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return Container(
      width: width * 0.70 / 2,
      child: TextButton.icon(
        icon: Icon(
          Icons.cancel,
          color: Colors.red,
        ),
        label: Flexible(
          child: FittedBox(
            child: Text(
              txt,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ),
        onPressed: onPressed != null ? onPressed as void Function()? : widget
            .onCancelar as void Function()?,
      ),
    );
  }

  Widget _btnConfirmar(Function(dynamic)? onConfirm,
      {bool fromInput = false,
        bool fromOptions = false,
        String txt = "Confirmar"}) {
    var width = MediaQuery
        .of(context)
        .size
        .width;

    return Container(
      width: width * 0.70 / 2,
      child: TextButton.icon(
        icon: Icon(
          Icons.check_circle,
          color: Colors.green,
        ),
        label: FittedBox(
          child: Text(
            txt,
            style: TextStyle(fontSize: 20),
          ),
        ),
        onPressed: () {
          if (fromInput) {
            onConfirm!(_inputController!.text);
            _inputController!.text = "";
          } else if (fromOptions) {
            onConfirm!(_selected!.value);
            _selected = null;
          } else {
            onConfirm!(null);
          }
        },
      ),
    );
  }
}
