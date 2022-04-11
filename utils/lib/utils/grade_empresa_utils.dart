import 'package:models/model/models.dart';
import 'package:utils/utils/string_utils.dart';

class GradeEmpresaUtils {
  static bool validaPromocao(GradeEmpresa? gradeEmpresa, String modulo) {
    if (gradeEmpresa == null) return false;

    Promocao? promocao = gradeEmpresa.promocao;

    if (promocao == null) return false;

    if (promocao.suspensa!) return false;

    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);

    if (promocao.dataInicial!.isBefore(date)) return false;

    if (promocao.dataFinal!.isAfter(date)) return false;

    if (promocao.periodicidade == "HAPPY_HOUR") {
      DateTime horaInicial =
      StringUtils().montaDateTime(now, promocao.horaInicial!);
      DateTime horaFinal =
      StringUtils().montaDateTime(now, promocao.horaFinal!);
      bool passaMeiaNoite = horaInicial.isAfter(horaFinal);

      if (!passaMeiaNoite) {
        if (now.isBefore(horaInicial) || now.isAfter(horaFinal)) return false;
      } else {
        if (now.isBefore(horaInicial) && now.isAfter(horaFinal)) return false;
      }
    }

    if (promocao.periodicidade != "PERIODO_DATA") {
      int diaSemana = DateTime
          .now()
          .weekday;
      switch (diaSemana) {
        case 1:
          if (promocao.segundaFeira!) return false;
          break;
        case 2:
          if (promocao.tercaFeira!) return false;
          break;
        case 3:
          if (promocao.quartaFeira!) return false;
          break;
        case 4:
          if (promocao.quintaFeira!) return false;
          break;
        case 5:
          if (promocao.sextaFeira!) return false;
          break;
        case 6:
          if (promocao.sabado!) return false;
          break;
        case 7:
          if (promocao.domingo!) return false;
          break;
      }
    }

    if (!promocao.modulosWaiter.contains(modulo)) return false;

    return true;
  }

/*
  static String preco(GradeEmpresa gradeEmpresa, String modulo) {
    if (validaPromocao(gradeEmpresa, modulo) &&
        gradeEmpresa.promocao != null &&
        gradeEmpresa.promocao.modalidade == "PRECO_FIXO_UNIDADE") {
      return "* R\$ " + gradeEmpresa.precoPromocional.toStringAsFixed(2);
    } else {
      return "R\$ " + gradeEmpresa.precoVenda.toStringAsFixed(2);
    }
  }
*/

  static bool validaPromocaoPrecoFixo(GradeEmpresa gradeEmpresa,
      String modulo) {
    if (GradeEmpresaUtils.validaPromocao(gradeEmpresa, modulo) &&
        gradeEmpresa.promocao != null &&
        gradeEmpresa.promocao!.modalidade == "PRECO_FIXO_UNIDADE") {
      return true;
    } else {
      return false;
    }
  }
}
