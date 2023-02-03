// // ignore: file_names
//
// // ignore_for_file: file_names
//
//
// import 'package:erp/pws/request_type.dart';
//
// class UrlPws{
//
//   final String _urlBase = 'http://api.wenderson:8081';
//   String _url = '';
//   RequestType _type = RequestType.GET;
//
//   // void inicializePws(){
//   //   Application.pwsConfigWaychef = PWSConfig(
//   //       urlBase: "http://api.wenderson/api",
//   //       client: Clients.ERP,
//   //       clientSecret: "");
//   //   Application.pwsConfigGateway = PWSConfig(
//   //       urlBase: "http://api.wenderson:8081",
//   //       client: Clients.ERP,
//   //       clientSecret: "");
//   // }
//
//   // ===========================PLATAFORMA EMPRESA =======================
//
//
//
//   // ===========================PLATAFORMA CONTRATO INTEGRADOR ================
//
//
//
//   // ===========================PLATAFORMA CONTRATO PLATAFORMA ===============
//   UrlPws.getbuscarTodosItensPorIdEmpresaETipoItem() {
//     _url = "/contrato/waychef/item-integrador/buscar-todos/{idEmpresa}/por-tipo/{tipoItem}";
//     _type = RequestType.GET;
//
//   }  UrlPws.putAtualizarItemConfiguracaoIntegrador() {
//     _url = "/contrato/waychef/item-integrador";
//     _type = RequestType.PUT;
//   }
//
//
//
//
//
//   // ===========================================================================
//
//   // UrlPws.plataformaListar() {
//   //   _url = "/contrato/waychef/item-configuracao/buscar-todos";
//   //   _type = RequestType.GET;
//   // }
//
//   UrlPws.plataformaIntegradorListar() {
//     _url = "/contrato/waychef/item-integrador/buscar-todos/1";
//     _type = RequestType.GET;
//   }
//
//   UrlPws.getBuscarTodosItensPorIdEmpresa() {
//     _url = "/contrato/waychef/item-integrador/buscar-todos/{idEmpresa}";
//     _type = RequestType.GET;
//   }
//
//
//
//   UrlPws.postNovoItemConfiguracaoIntegrador() {
//     _url = "/contrato/waychef/item-integrador";
//     _type = RequestType.POST;
//   }
//
//
//   get url => _urlBase + _url;
//   get type => _type;
//
// }
