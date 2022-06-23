import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/modules/venda/models/produto_carrinho.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:models/model/models.dart';

abstract class ControllerAbstract {
  ProdutoCarrinho produtoCarrinhoOriginal = ProdutoCarrinho(NotaItem());

  // ------------------------ Variaveis Observable
  ProdutoCarrinho produtoCarrinho = ProdutoCarrinho(NotaItem());
  ProdutoMenu? produtoMenu;
  ProdutoMenu? proximoMenu;
  ProdutoMenu? anteriorMenu;
  int radiovalue = 0;
  NotaItem? menu;
}
