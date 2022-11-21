import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/venda/models/produto_carrinho.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';

class ProdutoCarrinhoUtils {

  static ProdutoCarrinho clone(ProdutoCarrinho produtoCarrinho) {
    NotaItem itemClone = produtoCarrinho.notaItem.clone();
    ProdutoCarrinho produtoCarrinhoClone = ProdutoCarrinho(itemClone);
    produtoCarrinhoClone.index = produtoCarrinho.index;
    return produtoCarrinhoClone;
  }

  static Future<ProdutoCarrinho> atualizaProdutoCarrinho(
      ProdutoCarrinho produtoCarrinhoOriginal,
      ProdutoCarrinho produtoCarrinho,
      Function(int idProdutoEmpresa) buscaProduto
      ) async {
    if (NotaItemUtils.verificaAlcoolica(produtoCarrinho.notaItem, buscaProduto)) {
      bool permitido =
      await podeVenderBebidaAlcoolica(produtoCarrinho.notaItem);
      if (!permitido) {
        throw Exception('Venda de bebida alcoolica não permitida');
      }
    }

    NotaItemUtils.atualizaQuantidadeSubitens(produtoCarrinho.notaItem,
        BigDecimal.ONE(), produtoCarrinhoOriginal.notaItem.quantidade!);
    NotaItemUtils.atualizaTotais(produtoCarrinho.notaItem, buscaProduto);
    produtoCarrinhoOriginal.notaItem = produtoCarrinho.notaItem;
    produtoCarrinho = produtoCarrinhoOriginal;

    return produtoCarrinho;
  }

  static Future<bool> podeVenderBebidaAlcoolica(NotaItem notaItem) async {
    AppController appController = Modular.get();
    if (appController.maiorIdade) return true;
    bool liberadoBebidaAlcoolica = await Modular.to.pushNamed("/aviso") as bool;
    return liberadoBebidaAlcoolica;
  }
}
