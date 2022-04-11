import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:requester/requester/waycard_requester.dart';
import 'package:utils/utils/responsive_utils.dart';
import 'package:utils/widgets/confirmation_dialog.dart';
import 'package:waycard/config/app_config.dart';
import 'package:waycard/utils/waycard_utils.dart';

class CodigoConfirmacaoDialog extends StatefulWidget {
  final Usuario user;
  final bool mensagem;

  const CodigoConfirmacaoDialog({ required this.user, this.mensagem = false});

  @override
  _CodigoConfirmacaoDialogState createState() =>
      _CodigoConfirmacaoDialogState();
}

class _CodigoConfirmacaoDialogState extends State<CodigoConfirmacaoDialog> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appSize = MediaQuery
        .of(context)
        .size;

    return AlertDialog(
      shape: RoundedRectangleBorder(
        side: BorderSide(),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      title: Text(
        "Confirmação",
        style: TextStyle(
            fontSize: ResponsiveUtils.responsiveSize(
                appSize: appSize, baseValue: 22)),
      ),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                "Um e-mail com um código de verificação acaba de ser enviado para o seu e-mail, por favor, confirme o código:",
                style: TextStyle(
                    fontSize: ResponsiveUtils.responsiveSize(
                        appSize: appSize, baseValue: 18)),
              ),
              TextFormField(
                style: TextStyle(
                    fontSize: ResponsiveUtils.responsiveSize(
                        appSize: appSize, baseValue: 22)),
                autofocus: true,
                controller: _controller,
                keyboardType: TextInputType.numberWithOptions(
                    signed: false, decimal: false),
                decoration: InputDecoration(labelText: "Inserir Código"),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Insira o código";
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.all(ResponsiveUtils.responsiveSize(
                    appSize: appSize, baseValue: 16)),
                child: InkWell(
                  onTap: _onEnviarEmailNovamente,
                  child: Text(
                    "Enviar e-mail novamente",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: ResponsiveUtils.responsiveSize(
                            appSize: appSize, baseValue: 18)),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Row(
            children: <Widget>[
              Text(
                "Cancelar",
                style: TextStyle(
                    fontSize: ResponsiveUtils.responsiveSize(
                        appSize: appSize, baseValue: 20)),
              ),
              SizedBox(
                  width: ResponsiveUtils.responsiveSize(
                      appSize: appSize, baseValue: 20)),
              Icon(
                Icons.cancel,
                color: Colors.red,
              ),
            ],
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          child: Row(
            children: <Widget>[
              Text(
                "Confirmar",
                style: TextStyle(
                    fontSize: ResponsiveUtils.responsiveSize(
                        appSize: appSize, baseValue: 20)),
              ),
              SizedBox(
                  width: ResponsiveUtils.responsiveSize(
                      appSize: appSize, baseValue: 20)),
              Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
            ],
          ),
          onPressed: _onConfirmar,
        )
      ],
    );
  }

  void _onEnviarEmailNovamente() {
    WayCardUtils.showProgress();
    WaycardRequester.reenviarCodigo(
        AppConfig.application.pwsConfig, widget.user)
        .then((response) {
      if (response.isSuccess) {
        WayCardUtils.closeProgress();
      } else {
        throw PwsException(response.content);
      }
    }).catchError((e, s) {
      WayCardUtils.catchError(e, s, closeable: true);
    });
  }

  void _onConfirmar() {
    var codigoVerificador = _controller.text;
    WayCardUtils.showProgress();
    WaycardRequester.confirmarUsuario(
        AppConfig.application.pwsConfig, widget.user, codigoVerificador)
        .then((response) async {
      if (response.status == 200) {
        WayCardUtils.closeProgress();
        if (widget.mensagem) {
          return Navigator.pop(context);
        }
        showDialog(
            context: context,
            builder: (context) =>
                ConfirmationDialog(
                  title: "Cadastro",
                  message: "Usuário cadastrado com sucesso!",
                )).then((_) {
          Navigator.pop(context, true);
        });
      } else {
        throw PwsException(response.content);
      }
    }).catchError((error, s) {
      setState(() {
        _controller.text = "";
      });
      WayCardUtils.catchError(error, s, closeable: true);
    });
  }
}
