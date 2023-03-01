import 'package:autopesagem/config/app_config.dart';

import 'package:models/model/models.dart';
import 'package:requester/requester/consumo_requester.dart';
import 'package:requester/response/response_pws.dart';

class LancaItemUtils {
  static Future<Nota> lancaItem({required int comanda,
    required BigDecimal totalAtual,
    required BigDecimal pesoAtual,
    required String modulo}) async {
    //Realiza a busca da comanda
    //Se ja existir adiciona o item nela
    //Caso nao cria a nota e inseri
    //Adiciona o item
    ResponsePws buscarConsumos = await ConsumoRequester.buscarConsumos(
        AppConfig.application.pwsConfigWaychef, AppConfig.token,
        modulos: [Modulo()
          ..tipo = modulo
        ], comanda: comanda);

    Nota nota = Nota();
    NotaItem notaItem = NotaItem();

    if (buscarConsumos.status == 200) {
      List<Nota> list = buscarConsumos.content;
      nota = list.first;
    } else if (buscarConsumos.status == 204) {
      nota = _criaNota(modulo, comanda);

      ResponsePws inserirNota = await ConsumoRequester.inserir(
          AppConfig.application.pwsConfigWaychef, AppConfig.token, nota);

      if (inserirNota.status == 201) {
        nota = inserirNota.content;
      } else {
        throw new PwsException(inserirNota.content);
      }
    } else {
      throw new PwsException(buscarConsumos.content);
    }

    if (nota.status == "FECHADA") {
      await ConsumoRequester.reabrir(
          AppConfig.application.pwsConfigWaychef, AppConfig.token, nota);
    }

    notaItem = await _criaNotaItem(nota, totalAtual, pesoAtual);

    ResponsePws inserirItem = await ConsumoRequester.inserirItem(
        AppConfig.application.pwsConfigWaychef, AppConfig.token, notaItem);

    if (inserirItem.status == 201) {
      ResponsePws buscandoItens = await ConsumoRequester.buscarItens(
          AppConfig.application.pwsConfigWaychef, AppConfig.token, nota.id!);

      if (buscandoItens.isSuccess) {
        List<NotaItem> itens = buscandoItens.content;
        nota.itens = itens;
        return nota;
      }
    }
    throw new PwsException(inserirItem.content);
  }

  static Nota _criaNota(String modulo, int comanda) {
    Nota nota = Nota();
    nota.dataLancamento = DateTime.now();
    nota.consumo!.modulo = modulo;
    nota.consumo!.comanda = comanda;
    nota.consumo!.dataAbertura = DateTime.now();
    nota.dataEmissao = DateTime.now();
    nota.status = 'ABERTA';
    nota.dataStatus = DateTime.now();
    nota.operacao = 'VENDA';

    return nota;
  }

  static NotaItem _criaNotaItem(Nota nota,
      BigDecimal totalAtual,
      BigDecimal pesoAtual,) {
    //Cria o objeto NotaItem
    NotaItem notaItem = NotaItem();

    //Alimenta o objeto NotaItem
    notaItem.nota = nota;
    notaItem.idNota = notaItem.nota!.id;

    notaItem.tipo = 'ITEM';
    notaItem.dataLancamento = DateTime.now();

    notaItem.idEstacao = AppConfig.estacaoTrabalho.id;

    notaItem.idProdutoEmpresa =
        AppConfig.clientAutoPesagem.gradeEmpresa!.produtoEmpresa!.id;

    notaItem.descricao = AppConfig
        .clientAutoPesagem.gradeEmpresa!.produtoEmpresa!.produto!.descricao;
    notaItem.quantidade = pesoAtual;
    notaItem.grade = AppConfig.clientAutoPesagem.gradeEmpresa;
    notaItem.idGrade = AppConfig.clientAutoPesagem.gradeEmpresa!.id;
    notaItem.precoCusto = notaItem.grade!.precoCustoCompra;
    notaItem.precoUnitario =
        AppConfig.clientAutoPesagem.gradeEmpresa!.getPrecoVenda;
    notaItem.precoTotal = totalAtual;
    notaItem.consumoItem!.confirmado = true;
    notaItem.consumoItem!.dataConfirmacao = DateTime.now();

    return notaItem;
  }
}
