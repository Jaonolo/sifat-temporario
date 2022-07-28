import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:models/model/models.dart';

import 'nota_item_utils.dart';

class StringUtils {
  static String stringToMd5(String text) =>
      md5.convert(utf8.encode(text)).toString().toUpperCase();

  static String getEnumValue(dynamic value, {bool withUnderline = true}) {
    String result = value.toString().split(".")[1];
    if (!withUnderline) result = result.replaceAll("_", " ");
    return result;
  }

  static bool validatePattern(Pattern pattern, String value) {
    RegExp regex = new RegExp(pattern as String);
    return regex.hasMatch(value);
  }

  static void printWrapped(String text) {
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  static String toJson(dynamic obj) {
    String json = "";
    if (obj is List) {
      json += "[";
      for (var i = 0; i < obj.length; i++) {
        var o = obj[i];
        json += jsonEncode(o.toJson());
        if (i != (obj.length - 1)) json += ",";
      }
      json += "]";
    } else {
      json = jsonEncode(obj.toJson());
    }
    return json;
  }

  static String padStart(String string, int minLength, String padChar) {
    if (string.length >= minLength) return string.substring(0, minLength);

    String retorno = "";
    for (var i = string.length; i < minLength; i++)
      retorno += padChar;

    retorno += string;

    return retorno;
  }

  static String padEnd(String string, int minLength, String padChar) {
    if (string.length >= minLength) return string.substring(0, minLength);

    String retorno = string;
    for (var i = string.length; i < minLength; i++)
      retorno += padChar;
    return retorno;
  }

  static String removeMascaraInscricaoFederal(String inscricaoFederal) {
    return inscricaoFederal
        .replaceAll(".", "")
        .replaceAll("-", "")
        .replaceAll("/", "");
  }

  static String removeMascaraCEP(String cep) {
    return cep.replaceAll("-", "");
  }

  static String removeMascaraTelefone(String telefone) {
    return telefone.replaceAll("-", "").replaceAll("(", "").replaceAll(")", "");
  }

  static String mascararEmail(String email) {
    List<String> split = email.split("@");
    String comecoEmail = split[0];
    int length = comecoEmail.length;
    if (length > 3) {
      comecoEmail = comecoEmail.substring(0, 3);
      for (int i = 3; i < length; i++) {
        comecoEmail += "*";
      }
    } else {
      comecoEmail = "";
      for (int i = 0; i < length; i++) {
        comecoEmail += "*";
      }
      //throw new Exception("Endereço de e-mail muito pequeno para mascarar.");
    }
    return comecoEmail + "@" + split[1];
  }

  DateTime montaDateTime(DateTime data, String hora) {
    return DateTime(data.year, data.month, data.day,
        int.parse(hora.split(':')[0]), int.parse(hora.split(':')[1]));
  }

  static DateTime montaDateTimeFromString(String data) {
    return DateTime(int.parse(data.split('/')[0]),
        int.parse(data.split('/')[1]), int.parse(data.split('/')[2]));
  }

  static String mascaraCPF(String cpf) {
    String cpfFormatado = '';

    for (int i = 0; i < cpf.length; i++) {
      cpfFormatado += cpf[i];

      if (i == 2 || i == 5) cpfFormatado += '.';

      if (i == 8) cpfFormatado += '-';
    }
    return cpfFormatado;
  }

  static String mascaraTelefoneCel(String cel) {
    if (cel.isEmpty || cel == "") {
      return "";
    }

    return cel.length == 10
        ? '(${cel.substring(0, 2)}) ${cel.substring(2, 6)}-${cel.substring(
        6, 10)}'
        : '(${cel.substring(0, 2)}) ${cel.substring(2, 7)}-${cel.substring(
        7, 11)}';
  }

  static String mascaraCNPJ(String cnpj) {
    String cnpjFormatado = '';

    for (int i = 0; i < cnpj.length; i++) {
      cnpjFormatado += cnpj[i];

      if (i == 1 || i == 4 || i == 7) cnpjFormatado += ".";

      if (i == 7) cnpjFormatado += "/";

      if (i == 11) cnpjFormatado += "-";
    }
    return cnpjFormatado;
  }

  static String montaDescricaoSubItensAuto(NotaItem notaItem, {bool ignorarItemPrincipal = false, bool isValorItemTotal = true}) {
    String descricaoSub = "";

    if(!ignorarItemPrincipal) {
      switch (notaItem.tipo) {
        case "OBSERVACAO":
          if (descricaoSub.isNotEmpty) descricaoSub += " | ";
          descricaoSub += '${notaItem.descricao!}';
          break;
        case "ADICIONAL":
          if (descricaoSub.isNotEmpty) descricaoSub += " | ";
          descricaoSub +=
              '${notaItem.quantidade} UN ${notaItem.descricao}   R\$ ${notaItem.precoTotal!.toStringAsFixed(2)}\n';
          break;
        case "ITEM_COMBO":
          if (descricaoSub.isNotEmpty) descricaoSub += " | ";
          descricaoSub += "${notaItem.quantidade} UN  ${notaItem.descricao}";
          descricaoSub +=
              '  R\$ ${isValorItemTotal ? NotaItemUtils.getSubtotal(notaItem).toStringAsFixed(2) : notaItem.precoTotal!.toStringAsFixed(2)}\n';
          break;
      }
    }

    if (notaItem.subitens.isNotEmpty)
      for (NotaItem ni in notaItem.subitens)
        descricaoSub += montaDescricaoSubItensAuto(ni,isValorItemTotal: isValorItemTotal);

    return descricaoSub.toUpperCase();
  }

  static String formatInscricaoFederal(String value) {
    if (value.length > 11) {
      return
        mascaraCNPJ(value);
    } else {
      return
        mascaraCPF(value);
    }
  }
}
