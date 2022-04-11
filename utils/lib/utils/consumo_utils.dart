import 'package:models/model/models.dart';

class ConsumoUtils {
  static Nota instanciar(EstacaoTrabalho caixa,
      {int? comanda, int? numeroPessoas}) {
    Nota nota = Nota();
    nota.dataEmissao = DateTime.now();
    nota.status = "ABERTA";
    nota.dataStatus = DateTime.now();
    nota.operacao = "VENDA";
    nota.modelo = "NENHUM";
    nota.consumo = Consumo();
    if (comanda != null) nota.consumo!.comanda = comanda;
    if (numeroPessoas != null) nota.consumo!.pessoas = numeroPessoas;
    nota.consumo!.dataAbertura = DateTime.now();
    nota.dataLancamento = DateTime.now();
    nota.consumo!.modulo = "AUTOATENDIMENTO";
    nota.idCaixa = caixa.id;
    return nota;
  }
}
