// ignore: file_names

// ignore_for_file: file_names


import 'package:erp/pws/request_type.dart';

class UrlPws{

  final String _urlBase = 'http://api.wenderson:8081';
  String _url = '';
  RequestType _type = RequestType.GET;

  UrlPws.plataformaListar() {
    _url = "/contrato/waychef/item-configuracao/buscar-todos";
    _type = RequestType.GET;
  }

  UrlPws.plataformaIntegradorListar() {
    _url = "/contrato/waychef/item-integrador/buscar-todos/1";
    _type = RequestType.GET;
  }

  // ===========================PLATAFORMA CONTRATO INTEGRADOR ABAIXO=======================

  UrlPws.getBuscarTodosItensPorIdEmpresa() {
    _url = "/contrato/waychef/item-integrador/buscar-todos/{idEmpresa}";
    _type = RequestType.GET;
  }

  UrlPws.putAtualizarItemConfiguracaoIntegrador() {
    _url = "/contrato/waychef/item-integrador";
    _type = RequestType.PUT;
  }

  UrlPws.postNovoItemConfiguracaoIntegrador() {
    _url = "/contrato/waychef/item-integrador";
    _type = RequestType.POST;
  }

  // ===========================PLATAFORMA CONTRATO INTEGRADOR ACIMA =======================

  // UrlPws.usuarioLogin() {
  //   _url = "/usuarios/login";
  //   _type = RequestType.POST;
  // }
  //
  // UrlPws.empresasUsuarioListar() {
  //   _url = "/empresas/empresas-usuario";
  //   _type = RequestType.GET;
  // }
  //
  // UrlPws.usuarioEmpresaListar() {
  //   _url = "/usuario-empresa/buscar-todos";
  //   _type = RequestType.GET;
  // }
  //
  // UrlPws.alterarFavoritoUsuarioEmpresa() {
  //   _url = "/usuario-empresa/alterar-favorito";
  //   _type = RequestType.PUT;
  // }
  //
  // UrlPws.listarVendedores() {
  //   _url = "/vendedores/buscar-todas";
  //   _type = RequestType.GET;
  // }
  //
  // UrlPws.integracaoListar() {
  //   _url = "/integracao/buscar-todas";
  //   _type = RequestType.GET;
  // }
  //
  // UrlPws.gerarIntegracao() {
  //   _url = "/integracao/gerar-integracao";
  //   _type = RequestType.POST;
  // }
  //
  // UrlPws.buscarIntegracaoEmpresa() {
  //   _url = "/integracao/buscar-integracao-empresa";
  //   _type = RequestType.GET;
  // }
  //
  // UrlPws.horariosFuncionamentoListar() {
  //   _url = "/horario-funcionamento/buscar-todas";
  //   _type = RequestType.GET;
  // }
  //
  // UrlPws.buscarHorariosEmpresa() {
  //   _url = "/horario-funcionamento/buscar-horarios-empresa";
  //   _type = RequestType.GET;
  // }
  //
  // UrlPws.termosControleListar() {
  //   _url = "/termos-controle/buscar-todas";
  //   _type = RequestType.GET;
  // }
  //
  // UrlPws.buscarTermoControleEmpresa() {
  //   _url = "/termos-controle/buscar-termos-empresa";
  //   _type = RequestType.GET;
  // }

  get url => _urlBase + _url;
  get type => _type;

}