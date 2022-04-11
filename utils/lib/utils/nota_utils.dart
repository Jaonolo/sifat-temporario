import 'package:models/model/models.dart';

import 'nota_item_utils.dart';

class NotaUtils {
  static Nota atualizarTotais(Nota nota, List<NotaItem> itens) {
    nota.valorSubTotal = BigDecimal.ZERO();
    nota.valorTotalServico = BigDecimal.ZERO();
    nota.valorTotal = BigDecimal.ZERO();
    nota.valorDescontoItens = BigDecimal.ZERO();

    itens.forEach((item) {
      nota.valorTotal = nota.valorTotal!.somar(NotaItemUtils.getSubtotal(item));
    });

    return nota;
  }
}
