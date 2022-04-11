import 'package:autopesagem/config/app_config.dart';
import 'package:autopesagem/dao/dao.dart';

import 'package:autopesagem/pages/splash/splash_page.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DialogConfigApp extends StatefulWidget {
  TextEditingController host = TextEditingController();
  TextEditingController clientSecret = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String mensagemErro = "";

  DialogConfigApp({this.mensagemErro = ""}) {
    host.text = AppConfig.urlApi;
    clientSecret.text = AppConfig.clientSecret;
  }

  @override
  _DialogConfigAppState createState() => _DialogConfigAppState(mensagemErro);
}

class _DialogConfigAppState extends State<DialogConfigApp> {
  String mensagemErro = "";

  _DialogConfigAppState(this.mensagemErro);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Color.fromRGBO(43, 49, 53, 1),
      title: Text("Configuração API", style: TextStyle(color: Colors.white)),
      content: Container(
          height: 300,
          width: MediaQuery
              .of(context)
              .size
              .width * 0.90,
          child: Form(
            key: widget.formKey,
            child: Column(
              children: [
                Text(
                  mensagemErro,
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: "Host:"),
                  controller: widget.host,
                  validator: (value) {
                    if (value != null && value.isEmpty) return "teste";
                    return null;
                  },
                ),
                TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.white),
                      labelText: "ClientSecret"),
                  controller: widget.clientSecret,
                ),
              ],
            ),
          )),
      actions: <Widget>[
        TextButton(
          onPressed: () => realizarLoginApi(context),
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  Future<void> realizarLoginApi(BuildContext context) async {
    PutValue.setValues(widget.host.text, widget.clientSecret.text);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SplashPage()));
  }
}
