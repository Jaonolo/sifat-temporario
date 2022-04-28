import 'package:autoatendimento/app/modules/venda/models/produto_carrinho.dart';
import 'package:models/model/models.dart';


abstract class ControllerProdutoGenericoAbstract{
  ProdutoCarrinho produtoCarrinho = ProdutoCarrinho(NotaItem());

  ProdutoMenu? produtoMenu;

  ProdutoMenu? proximoMenu;

  ProdutoMenu? anteriorMenu;

  void adicionarAoCarrinho();

  Future<void> atualizaMenus(int index);

  Future<void> proximo();

  void anterior();
}