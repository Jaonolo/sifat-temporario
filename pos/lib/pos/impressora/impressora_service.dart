import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:models/model/enum/marca_pos.dart';
import 'package:models/model/enum/tipo_estacao.dart';
import 'package:models/model/models.dart';
import 'package:utils/widgets/confirmation_dialog.dart';

class ImpressoraService {
  MarcaPOS marca;
  TipoEstacao tipoEstacao;
  static const platform = const MethodChannel("impressora_channel");

  ImpressoraService(this.tipoEstacao, this.marca) {
    //se for gtouch ou mini pdv tem que conectar a impressora
    conectarImpressora();
  }

  Future conectarImpressora() async {
    if (tipoEstacao == TipoEstacao.GTOUCH) {
      try {
        await platform.invokeMethod(
            "conectar", {"tipoEstacao": "GTOUCH", "marcaPos": "NENHUMA"});
      } on PlatformException catch (e) {
        throw e;
      }
    } else if (tipoEstacao == TipoEstacao.MINI_PDV) {
      try {
        await platform.invokeMethod(
            "conectar", {"tipoEstacao": "MINI_PDV", "marcaPos": "NENHUMA"});
      } on PlatformException catch (e) {
        throw e;
      }
    }
  }

  Future imprime(String text) async {
    switch (tipoEstacao) {
      case TipoEstacao.MOVEL:
        break;

      case TipoEstacao.SMART_POS:
        switch (marca) {
          case MarcaPOS.GERTEC:
            await _imprimirGertec(text);
            break;
          case MarcaPOS.INGENICO:
            await _imprimirIngenico(text);
            break;
          case MarcaPOS.CIELO_LIO:
            await _imprimirCieloLio(text);
            break;
          case MarcaPOS.NENHUMA:
            print('Não possui impressora');
            break;
        }
        break;

      case TipoEstacao.GTOUCH:
        await _imprimirGTouch(text);
        break;

      case TipoEstacao.MINI_PDV:
        await _imprimirMiniPdv(text);
        break;
    }
  }

  Future _imprimirGertec(String text) async {
    try {
      await platform.invokeMethod("imprimir",
          {"tipoEstacao": "SMART_POS", "marcaPos": "GERTEC", "text": text});
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future _imprimirIngenico(String text) async {
    try {
      await platform.invokeMethod("imprimir",
          {"tipoEstacao": "SMART_POS", "marcaPos": "INGENICO", "text": text});
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future _imprimirCieloLio(String text) async {
    try {
      //não possui o await pois o metodo nao retorna o onSucess
      platform.invokeMethod("imprimir",
          {"tipoEstacao": "SMART_POS", "marcaPos": "CIELO_LIO", "text": text});
    } on PlatformException catch (e) {
      throw e;
    } catch (e) {
      throw Exception("o erro ocorreu no metofdo _imprimirCieloLio");
    }
  }

  Future _imprimirGTouch(String text) async {
    try {
      await platform.invokeMethod("imprimir",
          {"tipoEstacao": "GTOUCH", "marcaPos": "NENHUMA", "text": text});
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future _imprimirMiniPdv(String text) async {
    try {
      await platform.invokeMethod("imprimir",
          {"tipoEstacao": "MINI_PDV", "marcaPos": "NENHUMA", "text": text});
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future imprimeNFCE(XmlDTO xmlDTO, BuildContext context) async {
    switch (tipoEstacao) {
      case TipoEstacao.MOVEL:
        break;
      case TipoEstacao.SMART_POS:
        switch (marca) {
          case MarcaPOS.GERTEC:
            await _imprimirNFCEGertec(xmlDTO);
            break;
          case MarcaPOS.INGENICO:
            await _imprimirNFCEIngenico(xmlDTO);
            break;
          case MarcaPOS.CIELO_LIO:
            await _imprimirNFCECieloLio(xmlDTO, context);
            break;
          case MarcaPOS.NENHUMA:
            print('Não possui impressora');
            break;
        }
        break;

      case TipoEstacao.GTOUCH:
        await _imprimirNFCEGTouch(xmlDTO);
        break;

      case TipoEstacao.MINI_PDV:
        await _imprimirNFCEMiniPdv(xmlDTO);
        break;
    }
  }

  Future _imprimirNFCEGertec(XmlDTO xmlDTO) async {
    try {
      await platform.invokeMethod("imprimir_nfce", {
        "tipoEstacao": "SMART_POS",
        "marcaPos": "GERTEC",
        "inicio": xmlDTO.inicioImpressao,
        "qrcode": xmlDTO.qrCode,
        "fim": xmlDTO.fimImpressao
      });
    } on PlatformException catch (e) {
      throw e;
    }
  }

  Future _imprimirNFCEIngenico(XmlDTO xmlDTO) async {
    try {
      await platform.invokeMethod("imprimir_nfce", {
        "tipoEstacao": "SMART_POS",
        "marcaPos": "INGENICO",
        "inicio": xmlDTO.inicioImpressao,
        "qrcode": xmlDTO.qrCode,
        "fim": xmlDTO.fimImpressao
      });
    } on PlatformException catch (e, s) {
      print(s);
      throw e;
    }
  }

  Future _imprimirNFCECieloLio(XmlDTO xmlDTO, BuildContext context) async {
    try {
      //não possui o await pois o metodo nao retorna o onSucess
      platform.invokeMethod("imprimir_nfce", {
        "tipoEstacao": "SMART_POS",
        "marcaPos": "CIELO_LIO",
        "inicio": xmlDTO.inicioImpressao,
        "qrcode": xmlDTO.qrCode,
        "fim": xmlDTO.fimImpressao
      });
    } on PlatformException catch (e, s) {
      showDialog(
          context: context,
          builder: (_) =>
              ConfirmationDialog(
                message: "\n ####### \n ${e.toString()} \n\n ${s.toString()}",
                txtConfirmar: "OK",
              ));
      throw e;
    }
  }

  Future _imprimirNFCEGTouch(XmlDTO xmlDTO) async {
    try {
      await platform.invokeMethod("imprimir_nfce", {
        "tipoEstacao": "GTOUCH",
        "marcaPos": "NENHUMA",
        "inicio": xmlDTO.inicioImpressao,
        "qrcode": xmlDTO.qrCode,
        "fim": xmlDTO.fimImpressao
      });
    } on PlatformException catch (e, s) {
      print(s);
      throw e;
    }
  }

  Future _imprimirNFCEMiniPdv(XmlDTO xmlDTO) async {
    try {
      await platform.invokeMethod("imprimir_nfce", {
        "tipoEstacao": "MINI_PDV",
        "marcaPos": "NENHUMA",
        "inicio": xmlDTO.inicioImpressao,
        "qrcode": xmlDTO.qrCode,
        "fim": xmlDTO.fimImpressao
      });
    } on PlatformException catch (e, s) {
      print(s);
      throw e;
    }
  }

  Future displayGTouch(BigDecimal valor) async {
    await platform.invokeMethod(
      'enviarDisplay',
      <String, dynamic>{
        "tipoEstacao": "GTOUCH",
        "marcaPos": "NENHUMA",
        "symbol": valor.compareTo(BigDecimal.ZERO()) > 0 ? 2 : 0,
        "value": valor.toStringAsFixed(2),
      },
    );
  }
}
