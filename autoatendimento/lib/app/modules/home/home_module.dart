import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/aviso_idade/aviso_idade_page.dart';
import 'package:autoatendimento/app/modules/home/pages/cpf/cpf_page.dart';
import 'package:autoatendimento/app/modules/home/pages/pagamentos/pagamentos_page.dart';
import 'package:autoatendimento/app/modules/home/pages/pedido_finalizado/pedido_finalizado_page.dart';
import 'package:autoatendimento/app/modules/home/pages/pedido_viagem/pedido_viagem_page.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/controller/produto_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/revisao_pedido/revisao_pedido_page.dart';
import 'package:autoatendimento/app/modules/home/pages/toque_comecar/toque_comecar_page.dart';
import 'package:autoatendimento/app/modules/home/pages/transacao_tef/transacao_tef_controller.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'home_page.dart';
import 'pages/splash/splash_controller.dart';
import 'pages/splash/splash_page.dart';
import 'pages/transacao_tef/transacao_tef_page.dart';
import 'pages/wizard/wizard_controller.dart';
import 'pages/wizard/wizard_page.dart';


class HomeModule extends Module {
  @override
  List<Bind> get binds =>
      [
        Bind.lazySingleton((i) => AppController()),
        Bind.lazySingleton((i) => HomeController()),
        Bind.lazySingleton((i) => VendaController()),
        Bind.lazySingleton((i) => TransacaoTefController()),
        Bind.lazySingleton((i) => ProdutoController()),
        Bind.lazySingleton((i) => SplashController()),
        Bind.lazySingleton((i) => WizardController()),
      ];

  @override
  List<ModularRoute> get routes =>
      [
        ChildRoute('/', child: (context, args) => SplashPage()),
        ChildRoute("/comecar", child: (_, args) => ToqueComecarPage()),
        ChildRoute("/home", child: (_, args) => HomePage()),
        ChildRoute("/revisao", child: (_, args) => RevisaoPedidoPage()),
        ChildRoute("/viagem", child: (_, args) => PedidoViagemPage()),
        ChildRoute("/cpf", child: (_, args) => CPFPage()),
        ChildRoute("/pagamento", child: (_, args) => PagamentoPage()),
        ChildRoute("/finalizado", child: (_, args) => PedidoFinalizadoPage()),
        ChildRoute("/aviso", child: (_, args) => AvisoIdadePage()),
        ChildRoute("/transacao", child: (_, args) => TransacaoTefPage()),
        ChildRoute("/wizard", child: (_, args) => WizardPage()),
      ];
}
