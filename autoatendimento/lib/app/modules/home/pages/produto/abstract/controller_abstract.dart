import 'package:autoatendimento/app/modules/venda/models/produto_carrinho.dart';
import 'package:models/model/models.dart';

abstract class ControllerAbstract {
  ProdutoCarrinho produtoCarrinhoOriginal = ProdutoCarrinho(NotaItem());

  // ------------------------ Variaveis Observable
  ProdutoCarrinho produtoCarrinho = ProdutoCarrinho(NotaItem());
  ProdutoMenu? produtoMenu;
  ProdutoMenu? proximoMenu;
  ProdutoMenu? anteriorMenu;
  int radiovalue = 0;

  // ------------------------ Variaveis usada apenas no combo rever isso aqui
  NotaItem? menu;

  // ------------------------ Metodos compartilhados
  void changeProdutoCarrinho(ProdutoCarrinho value);
  void selecaoRadio(int n);
}
