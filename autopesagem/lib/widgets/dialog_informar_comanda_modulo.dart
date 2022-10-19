import 'package:autopesagem/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DialogInformarComandaModulo extends StatefulWidget {
  @override
  _DialogInformarComandaModuloState createState() =>
      _DialogInformarComandaModuloState();
}

class _DialogInformarComandaModuloState
    extends State<DialogInformarComandaModulo> {
  FocusNode focusNode = FocusNode();

  TextEditingController txtController = new TextEditingController();

  String modulo = "MESA";

  @override
  void initState() {
    if (AppConfig.clientAutoPesagem.lancamentoAutomatico != "AMBOS") {
      modulo = AppConfig.clientAutoPesagem.lancamentoAutomatico!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    focusNode.requestFocus();
    return AlertDialog(
      backgroundColor: Color.fromRGBO(43, 49, 53, 1),
      title: Text((AppConfig.clientAutoPesagem.lancamentoAutomatico == "AMBOS")
          ? "Escolha o modulo:"
          : "", style: TextStyle(color: Colors.white),),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              if(AppConfig.clientAutoPesagem.lancamentoAutomatico == "AMBOS" ||
                  AppConfig.clientAutoPesagem.lancamentoAutomatico == "MESA")
                Expanded(
                  child: btnModulo("MESA"),
                ),
              if(AppConfig.clientAutoPesagem.lancamentoAutomatico == "AMBOS" ||
                  AppConfig.clientAutoPesagem.lancamentoAutomatico == "FICHA")
                Expanded(
                  child: btnModulo("FICHA"),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
            child: TextFormField(
              focusNode: focusNode,
              style: TextStyle(color: Colors.white),
              controller: txtController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Informe o numero da comanda",
                  hoverColor: Colors.white
              ),
              inputFormatters: [
                LengthLimitingTextInputFormatter(6),
              ],
              onFieldSubmitted: (_) => confirm(context),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, {"": ""}),
          child: const Text(
            'Cancelar',
            style: TextStyle(color: Colors.white),
          ),
        ),
        TextButton(
          onPressed: () => confirm(context),
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget btnModulo(String lblModulo) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: modulo == lblModulo
                ? Color.fromRGBO(249, 77, 24, 1)
                : Color.fromRGBO(43, 49, 53, 1),
          ),
          onPressed: () {
            setState(() {
              modulo = lblModulo;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(lblModulo,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          )
      ),
    );
  }

  void confirm(BuildContext context) {
    if (txtController.text.isEmpty) {
      print(txtController.text);
      focusNode.requestFocus();
      return;
    }

    Navigator.pop(context, {"comanda": txtController.text, "modulo": modulo});
  }
}
