// import 'dart:convert';
//
// import 'package:dio/dio.dart';
// import 'package:erp/models/integrador_pode_comercializar_item_dto.dart';
// import 'package:erp/models/item_configurcao_waychef.dart';
//
// import 'package:erp/pws/requester_pws.dart';
// import 'package:erp/pws/response_pws.dart';
//
// import '../models/plataformaintegrador/item_configuracao_integrador_waychef.dart';
// import '../models/plataformaintegrador/item_configuracao_wayche_dto.dart';
// import 'url_pws.dart';
//
// class PlataformaRequesterAntiga {
//
//   //MÉTODO GET - getbuscarTodosItensPorIdEmpresaETipoItem - buscarPlataformaContratoIntegradorExtra
//   static Future<ResponsePws> buscarTodosItensPorIdEmpresaETipoItem(String token, String idEmpresa, String tipoItem) async {
//     Response? response = await RequesterPws().consome(
//       urlPws: UrlPws.getbuscarTodosItensPorIdEmpresaETipoItem(),
//       // headerParams: {
//       //   "Authorization":
//       //       "?token=eyJhbGciOiJIUzUxMiJ9.eyJ0aXBvQ2xpZW50IjoiQVBJIiwiaWRTZXNzYW8iOiI5ZTUzYjUzYy01Zjg5LTQ5NjktODQ4MC0yZDJkZTYzOTcyMTAiLCJleHAiOjE2NzE0ODg5OTEsImlhdCI6MTY3MTQ3NDU5MX0.Pbmj1C1KzKV6-jn5oBTVgmPi4i_CoscHs9VyIqWXg3f3yzluyR3TK1vQQZbt2xlOr8Vb-yMaA85Enf2OnnVe-g"
//       // },
//       pathParams: {
//         "{idEmpresa}": 1.toString(),
//         "{tipoItem}": "EXTRA",
//       }
//     );
//     return ResponsePws(
//         response: response,
//         converter: (json) => ItemConfiguracaoIntegradorWaychef.listFromJson(json));
//   }
//
//
// //método PUT ABAIXO
// static Future<ResponsePws> atualizarItemConfiguracaoIntegrador(
//     String token, List<ItemConfiguracaoIntegradorWaychef> itemDto) async {
//
//   Response? response = await RequesterPws(config: config).consome(
//       urlPws: UrlPws.putAtualizarItemConfiguracaoIntegrador(),
//       headerParams: {
//         // "Authorization": "Bearer " + token,
//       },
//       //body: "[{\"id\":\"e0488da5-6116-11ed-a5cb-20898409f05a\", \"valor\":10.10, \"podeComercializar\":true, \"idEmpresa\":1, \"idItemConfiguracaoWaychef\":\"e03f6204-6116-11ed-a5cb-20898409f05a\", \"itemConfiguracaoWaychefDTO\":{\"id\":\"e03f6204-6116-11ed-a5cb-20898409f05a\", \"nome\":\"AUTOATENDIMENTO\", \"detalhes\":null, \"tipoItem\":\"NORMAL\", \"tipoItemContratoWaychef\":\"SERVICO_ALFA_SYNC\", \"integradorPodeComercializarItemDTOList\":[]}}, {\"id\":\"e048aa63-6116-11ed-a5cb-20898409f05a\", \"valor\":0.00, \"podeComercializar\":true, \"idEmpresa\":1, \"idItemConfiguracaoWaychef\":\"e03f5c35-6116-11ed-a5cb-20898409f05a\", \"itemConfiguracaoWaychefDTO\":{\"id\":\"e03f5c35-6116-11ed-a5cb-20898409f05a\", \"nome\":\"AUTOATENDIMENTO\", \"detalhes\":null, \"tipoItem\":\"NORMAL\", \"tipoItemContratoWaychef\":\"SERVICO_WAYCHEF_MOBILE\", \"integradorPodeComercializarItemDTOList\":[]}}]",
//       body: itemDto);
//   return ResponsePws(
//       response: response);
// }
//
//
//
//
// //
// // //método POST ABAIXO
// // static Future<ResponsePws> NovoItemConfiguracaoIntegrador(String token,
// //     List<ItemConfiguracaoIntegradorWaychef> itemIntegradorDTO) async {
// //   Response? response = await RequesterPws().consome(
// //     urlPws: UrlPws.postNovoItemConfiguracaoIntegrador(),
// //     // headerParams: {"Authorization": "Bearer " + token,},
// //     body: itemIntegradorDTO,
// //   );
// //   return ResponsePws(
// //       response: response,
// //       converter: (json) =>
// //           ItemConfiguracaoIntegradorWaychef.listFromJson(json));
// // }
// //
//
// // static Future<ResponsePws> buscarPlataformaContratoExtra() async {
// //   Response? response = await RequesterPws().consome(
// //     urlPws: UrlPws.plataformaListar(),
// //   );
// //   return ResponsePws(
// //       response: response,
// //       converter: (json) => ItemConfiguracaoWaychef.listFromJson(json));
// // }
// //
//
// //
//
// }
