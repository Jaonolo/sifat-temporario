import 'package:autoatendimento/novo_auto_atendimento/pages/Menu/menu_page.dart';
import 'package:get/get.dart';
import '../pages/Menu/menu_bindings.dart';
import '../pages/pedido_viagem/pedido_viagem_page.dart';
import '../pages/pedido_viagem/pedido_viagem_bindings.dart';
import '../pages/produto/produto_simples/produto_simples_bindings.dart';
import '../pages/produto/produto_simples/produto_simples_page.dart';

import '../pages/toque_comecar/toque_comecar_page.dart';

part 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.TOQUEPARACOMECAR,
      page: () => ToqueComecarPage(),
    ),
    GetPage(
      name: Routes.ESCOLHAOPCAO,
      page: () => PedidoViagemPage(),
      binding: PedidoViagemPageBindings(),
    ),
    GetPage(
      name: Routes.MENU,
      page: () => MenuPage(),
      binding: MenuPageBindings(),
    ),
    GetPage(
      name: Routes.SIMPLES,
      page: () => ProdutoSimplesPage(),
      binding: ProdutoSimplesBindings(),
    ),
  ];
}
