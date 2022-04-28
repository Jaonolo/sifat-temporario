import 'package:autoatendimento/app/modules/venda/models/produto_carrinho.dart';
import 'package:models/model/models.dart';

import '../enum/tipo_botao.dart';



abstract class ControllerProdutoGenericoAbstract{
  ProdutoCarrinho produtoCarrinho = ProdutoCarrinho(NotaItem());

  ProdutoMenu? produtoMenu;

  ProdutoMenu? proximoMenu;

  ProdutoMenu? anteriorMenu;

  TipoBotaoMenus tipoBotaoMenus = TipoBotaoMenus.PROXIMO;

  void adicionarAoCarrinho();

  Future<void> atualizaMenus(int index);

  Future<void> proximo();

  void anterior();

  void atualizaTipoBotaoMenus({bool revisao = false, bool escolheuCompomenteExtra = false});
}