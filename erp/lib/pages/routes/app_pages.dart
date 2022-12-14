import 'package:erp/pages/plataforma/empresas/comissao/comissao_page.dart';
import 'package:erp/pages/plataforma/empresas/plataforma_empresa_page.dart';
import 'package:get/get.dart';
import '../plataforma/contratosintegrador/contrato/planos/contratos_integrador_bindigs.dart';
import '../plataforma/contratosintegrador/contrato/planos/contratos_integrador_page.dart';
import '../plataforma/contratosintegrador/contratocustomizado/cadastrarplanos/cadastrar_contrato_integrador_bindigs.dart';
import '../plataforma/contratosintegrador/contratocustomizado/cadastrarplanos/cadastrar_contrato_integrador_page.dart';
import '../plataforma/contratosintegrador/contratocustomizado/contrato_customizado_terceira_page.dart';
import '../plataforma/contratosintegrador/extras/plataforma_integrador_page.dart';
import '../plataforma/contratosintegrador/extras/plataforma_integrador_page_bindings.dart';
import '../plataforma/contratosplataforma/extras/plataforma_page.dart';
import '../plataforma/contratosplataforma/extras/plataforma_page_bindings.dart';
import '../plataforma/contratosplataforma/padrao/plataforma_contrato_bindigs.dart';
import '../plataforma/contratosplataforma/padrao/plataforma_contrato_page.dart';
import '../plataforma/empresas/comissao/comissao_bindings.dart';
import '../plataforma/empresas/extras/extras_bindings.dart';
import '../plataforma/empresas/extras/extras_page.dart';
import '../plataforma/empresas/plano/plano_bindigs.dart';
import '../plataforma/empresas/plano/plano_page.dart';
import '../plataforma/empresas/plataforma_empresa_bindigs.dart';

part 'app_routes.dart';


class AppPages {
  static final routes = [

    // PLATAFORMA EMPRESAS ABAIXO
    GetPage(
      name: Routes.PLATAFORMA_EMPRESA,
      page: () => PlataformaEmpresaPage(),
      binding: PlataformaEmpresaBindings(),
    ),
    GetPage(
      name: Routes.PLATAFORMA_EMPRESA_PLANO,
      page: () => PlanoPage(),
      binding: PlanoBindings(),
    ),
    GetPage(
      name: Routes.PLATAFORMA_EMPRESA_EXTRA,
      page: () => ExtrasPage(),
      binding: ExtrasBindings(),
    ),
    GetPage(
      name: Routes.PLATAFORMA_EMPRESA_COMISSAO,
      page: () => ComissaoPage(),
      binding: ComissaoBindings(),
    ),

    //  PLATAFORMA CONTRATOS INTEGRADOR
    GetPage(
      name: Routes.CONTRATO_INTREGRADOR,
      page: () => ContratosIntegradorPage(),
      binding: ContratosIntegradorBindings(),
    ),
    GetPage(
      name: Routes.CONTRATO_INTREGRADOR_CUSTOMIZADO,
      page: () => CadastrarContratoIntegradorPage(),
      binding: CadastrarContratoIntegradorBindings(),
    ),
    GetPage(
      name: Routes.CONTRATO_INTREGRADOR_EXTRAS,
      page: () => PlataformaIntegradorPage(),
      binding: PlataformaIntegradorPageBindings(),
    ),

    // PLATAFORMA CONTRATOS PLATAFORMA
    // GetPage(
    //   name: Routes.PLATAFORMA_CONTRATOS_COMISSAO,
    //   page: () => ContratosIntegradorPage(),
    //   binding: ContratosIntegradorBindings(),
    // ),
    GetPage(
      name: Routes.PLATAFORMA_CONTRATOS_PADRAO,
      page: () => PlataformaContratoPage(),
      binding: PlataformaContratoBindings(),
    ),

    GetPage(
      name: Routes.PLATAFORMA_CONTRATOS_EXTRAS,
      page: () => PlataformaPage(),
      binding: PlataformaPageBindings(),
    ),


    // ************ TESTELIVRE *************************
    // GetPage(
    //   name: Routes.TESTE,
      // page: () => ContratoCustomizadoTerceiraPage(),
    // //   binding: PlataformaPageBindings(),
    // ),

  ];
}