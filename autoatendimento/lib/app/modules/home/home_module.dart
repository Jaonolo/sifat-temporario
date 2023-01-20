import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/aviso_idade/aviso_idade_page.dart';
import 'package:autoatendimento/app/modules/home/pages/configuracao/configuracao_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/configuracao/configuracao_page.dart';
import 'package:autoatendimento/app/modules/home/pages/cpf/cpf_page.dart';
import 'package:autoatendimento/app/modules/home/pages/pagamentos/pagamentos_page.dart';
import 'package:autoatendimento/app/modules/home/pages/pedido_finalizado/pedido_finalizado_page.dart';
import 'package:autoatendimento/app/modules/home/pages/pedido_viagem/pedido_viagem_page.dart';
import 'package:autoatendimento/app/modules/home/pages/pendencia_fiscal/pendencia_fiscal_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/adicional/produto_adicional_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/combo/produto_combo_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/composto/produto_composto_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/revisao_pedido/revisao_pedido_page.dart';
import 'package:autoatendimento/app/modules/home/pages/tef/administrativo_tef/administrativo_tef_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/tef/administrativo_tef/administrativo_tef_page.dart';
import 'package:autoatendimento/app/modules/home/pages/tef/cancelamento_tef/cancelamento_tef_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/tef/cancelamento_tef/cancelamento_tef_page.dart';
import 'package:autoatendimento/app/modules/home/pages/tef/transacao_tef/transacao_tef_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/tef/transacao_tef/transacao_tef_page.dart';
import 'package:autoatendimento/app/modules/home/pages/toque_comecar/toque_comecar_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/toque_comecar/toque_comecar_page.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';
import 'home_page.dart';
import 'pages/bloqueio_admnistrativo/bloqueio_administrativo_page.dart';
import 'pages/pendencia_fiscal/pendencia_fiscal_page.dart';
import 'pages/splash/splash_controller.dart';
import 'pages/splash/splash_page.dart';
import 'pages/wizard/wizard_controller.dart';
import 'pages/wizard/wizard_page.dart';


class HomeModule extends Module {
  @override
  List<Bind> get binds =>
      [
        Bind.lazySingleton((i) => AppController()),
        Bind.lazySingleton((i) => ToqueComecarController()),
        Bind.lazySingleton((i) => HomeController()),
        Bind.lazySingleton((i) => VendaController()),
        Bind.lazySingleton((i) => TransacaoTefController()),
        Bind.lazySingleton((i) => ProdutoAdicionalController()),
        Bind.lazySingleton((i) => ProdutoComboController()),
        Bind.lazySingleton((i) => ProdutoCompostoController()),
        Bind.lazySingleton((i) => SplashController()),
        Bind.lazySingleton((i) => WizardController()),
        Bind.lazySingleton((i) => ConfiguracaoController()),
        Bind.lazySingleton((i) => AdministrativoTefController()),
        Bind.lazySingleton((i) => CancelamentoTefController()),
        Bind.lazySingleton((i) => PendenciaFiscalController()),





      ];

  @override
  List<ModularRoute> get routes =>
      [
        ChildRoute('/', child: (context, args) => SplashPage()),
        ChildRoute("/wizard", child: (_, args) => WizardPage()),
        ChildRoute("/comecar", child: (_, args) => ToqueComecarPage()),
        ChildRoute("/viagem", child: (_, args) => PedidoViagemPage()),
        ChildRoute("/home", child: (_, args) => HomePage()),
        ChildRoute("/revisao", child: (_, args) => RevisaoPedidoPage()),
        ChildRoute("/cpf", child: (_, args) => CPFPage()),
        ChildRoute("/pagamento", child: (_, args) => PagamentoPage()),
        ChildRoute("/transacao", child: (_, args) => TransacaoTefPage()),
        ChildRoute("/finalizado", child: (_, args) => PedidoFinalizadoPage()),
        ChildRoute("/aviso", child: (_, args) => AvisoIdadePage()),
        ChildRoute("/bloqueio", child: (_, args) => BloqueioAdministrativoPage()),
        ChildRoute("/configuracao", child: (_, args) => ConfiguracaoPage()),
        ChildRoute("/administrativo_tef", child: (_, args) => AdministrativoTefPage()),
        ChildRoute("/cancelamento_tef", child: (_, args) => CancelamentoTefPage()),
        ChildRoute("/pendencia_fiscal", child: (_, args) => PendenciaFiscalPage()),

      ];
}
