import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:utils/utils/break_points.dart';

class CustomInputDialog extends StatefulWidget {
  final String? text;
  final String? title;
  final bool obscure;
  final bool closeable;
  final String? message;
  final String txtCancelar;
  final String txtConfirmar;
  final TextInputType? keyboardType;
  final Function(String value)? onConfirm;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String value)? validator;

  const CustomInputDialog({
    this.title,
    this.message,
    this.onConfirm,
    this.text,
    this.closeable = true,
    this.keyboardType,
    this.obscure = false,
    this.inputFormatters,
    this.validator,
    this.txtCancelar = "Cancelar",
    this.txtConfirmar = "Confirmar",
  });

  @override
  _CustomInputDialogState createState() => _CustomInputDialogState();
}

class _CustomInputDialogState extends State<CustomInputDialog> {
  TextEditingController _controller = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (widget.text != null &&
        widget.text!.isNotEmpty &&
        _controller.text.isEmpty)
      _controller = TextEditingController(text: widget.text);

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > mobileBreakPointer)
        return layoutTablet();
      else
        return layoutMobile();
    });
  }

  // ******************************** MOBILE ******************************
  Widget layoutMobile() {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      title: _title(),
      content: _content(true),
    );
  }

  // ******************************** TABLET ******************************
  Widget layoutTablet() {
    return Scaffold(
      appBar: AppBar(
        title: _title(),
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
        child: _content(false),
      ),
      floatingActionButton: fab(),
    );
  }

  Widget fab() {
    return FloatingActionButton(
      onPressed: () => onConfirmar(),
      child: Icon(Icons.check),
    );
  }

  // ******************************** COMPONENTS ******************************

  Widget? _title() {
    return widget.title != null ? Text(widget.title!) : null;
  }

  Widget _content(bool isMobile) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(widget.message!),
            TextFormField(
              autofocus: true,
              controller: _controller,
              obscureText: widget.obscure,
              keyboardType: widget.keyboardType != null
                  ? widget.keyboardType
                  : TextInputType.text,
              inputFormatters: widget.inputFormatters,
              validator: widget.validator != null ? widget
                  .validator as String? Function(String?)? : null,
            ),
            SizedBox(height: 10,),
            if(isMobile)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _btnCancel(context),
                  _btnconfirmation(context),
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
        Navigator.pop(context);
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
            Text(
              widget.txtCancelar,
            ),
          ],
        ),
      ),
    );
  }

  Widget _btnconfirmation(BuildContext context) {
    return InkWell(
      onTap: () => onConfirmar(),
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
            Text(
              widget.txtConfirmar,
            ),
          ],
        ),
      ),
    );
  }

  void onConfirmar() {
    if (_formKey.currentState!.validate()) {
      if (widget.closeable) Navigator.pop(context);
      if (widget.onConfirm != null) widget.onConfirm!(_controller.text);
    }
  }
}
