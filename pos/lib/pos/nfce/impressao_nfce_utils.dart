import 'package:core/application/application.dart';
import 'package:flutter/material.dart';
import 'package:models/model/models.dart';
import 'package:utils/widgets/confirmation_dialog.dart';

class ImpressaoNFCeUtils {
  static Future imprimir(XmlDTO xmlDTO, Nota nota, BuildContext context) async {
    Modulo? modulo = Application
        .getInstance()
        .estacao!
        .modulos
        .firstWhere(
            (modulo) => modulo.tipo == nota.consumo!.modulo,
        orElse: () => Modulo());

    if (modulo.id == null || modulo.impressaoVenda == "PERGUNTA") {
      await showDialog(
          context: context,
          builder: (context) =>
              ConfirmationDialog(
                showCancelButton: true,
                title: "Impressão",
                message: "Imprimir venda ?",
                txtConfirmar: "Sim",
                txtCancelar: "Não",
                onConfirm: () async {
                  await Application
                      .getInstance()
                      .impressoraService
                      .imprimeNFCE(xmlDTO, context);
                },
              ));
    } else if (modulo.impressaoVenda == "IMPRIME") {
      await Application
          .getInstance()
          .impressoraService
          .imprimeNFCE(xmlDTO, context);
    }
  }
}
