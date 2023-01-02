
import 'package:http/http.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class PlataformaRequester {

  //MÉTODO GET - getbuscarTodosItensPorIdEmpresaETipoItem - buscarPlataformaContratoIntegradorExtra
  static Future<ResponsePws> buscarTodosItensPorIdEmpresaETipoItem(PWSConfig config, String token, String idEmpresa, String tipoItem) async {
    Response? response = await RequesterPws(config: config).consome(
        urlPws: UrlPws.getbuscarTodosItensPorIdEmpresaETipoItem(),
        headerParams: {
          'Authorization': "Bearer $token",
        },
        // headerParams: {
        //   "Authorization":
        //       "?token=eyJhbGciOiJIUzUxMiJ9.eyJ0aXBvQ2xpZW50IjoiQVBJIiwiaWRTZXNzYW8iOiI5ZTUzYjUzYy01Zjg5LTQ5NjktODQ4MC0yZDJkZTYzOTcyMTAiLCJleHAiOjE2NzE0ODg5OTEsImlhdCI6MTY3MTQ3NDU5MX0.Pbmj1C1KzKV6-jn5oBTVgmPi4i_CoscHs9VyIqWXg3f3yzluyR3TK1vQQZbt2xlOr8Vb-yMaA85Enf2OnnVe-g"
        // },
        pathParams: {
          "{idEmpresa}": 1.toString(),
          "{tipoItem}": "EXTRA",
        }
    );
    return ResponsePws(
        response: response,
        converter: (json) => ItemConfiguracaoIntegradorWaychef.listFromJson(json));
  }


  //MÉTODO GET - getbuscarTodosItemConfiguracaoWaychef- buscarTodosItemConfiguracaoWaychef
  static Future<ResponsePws> buscarTodosItemConfiguracaoWaychefExtra(PWSConfig config, String token) async {
    Response? response = await RequesterPws(config: config).consome(
        urlPws: UrlPws.getbuscarTodosItemConfiguracaoWaychefExtra(),
        headerParams: {
          'Authorization': "Bearer $token",
        },
        pathParams: {
          "{tipoItem}": "NORMAL",
        }
    );
    return ResponsePws(
        response: response,
        converter: (json) => ItemConfiguracaoWaychef.listFromJson(json));
  }



//método PUT ABAIXO
  static Future<ResponsePws> atualizarItemConfiguracaoIntegrador(PWSConfig config,
      String token, List<ItemConfiguracaoIntegradorWaychef> itemDto) async {

    Response? response = await RequesterPws(config: config).consome(
        urlPws: UrlPws.putAtualizarItemConfiguracaoIntegrador(),
        headerParams: {
          "Authorization": "Bearer " + token,
        },
        //body: "[{\"id\":\"e0488da5-6116-11ed-a5cb-20898409f05a\", \"valor\":10.10, \"podeComercializar\":true, \"idEmpresa\":1, \"idItemConfiguracaoWaychef\":\"e03f6204-6116-11ed-a5cb-20898409f05a\", \"itemConfiguracaoWaychefDTO\":{\"id\":\"e03f6204-6116-11ed-a5cb-20898409f05a\", \"nome\":\"AUTOATENDIMENTO\", \"detalhes\":null, \"tipoItem\":\"NORMAL\", \"tipoItemContratoWaychef\":\"SERVICO_ALFA_SYNC\", \"integradorPodeComercializarItemDTOList\":[]}}, {\"id\":\"e048aa63-6116-11ed-a5cb-20898409f05a\", \"valor\":0.00, \"podeComercializar\":true, \"idEmpresa\":1, \"idItemConfiguracaoWaychef\":\"e03f5c35-6116-11ed-a5cb-20898409f05a\", \"itemConfiguracaoWaychefDTO\":{\"id\":\"e03f5c35-6116-11ed-a5cb-20898409f05a\", \"nome\":\"AUTOATENDIMENTO\", \"detalhes\":null, \"tipoItem\":\"NORMAL\", \"tipoItemContratoWaychef\":\"SERVICO_WAYCHEF_MOBILE\", \"integradorPodeComercializarItemDTOList\":[]}}]",
        body: itemDto);
    return ResponsePws(
        response: response);
  }



//
// //método POST ABAIXO
// static Future<ResponsePws> NovoItemConfiguracaoIntegrador(String token,
//     List<ItemConfiguracaoIntegradorWaychef> itemIntegradorDTO) async {
//   Response? response = await RequesterPws().consome(
//     urlPws: UrlPws.postNovoItemConfiguracaoIntegrador(),
//     // headerParams: {"Authorization": "Bearer " + token,},
//     body: itemIntegradorDTO,
//   );
//   return ResponsePws(
//       response: response,
//       converter: (json) =>
//           ItemConfiguracaoIntegradorWaychef.listFromJson(json));
// }
//

// static Future<ResponsePws> buscarPlataformaContratoExtra() async {
//   Response? response = await RequesterPws().consome(
//     urlPws: UrlPws.plataformaListar(),
//   );
//   return ResponsePws(
//       response: response,
//       converter: (json) => ItemConfiguracaoWaychef.listFromJson(json));
// }
//

//

}












// import 'package:models/model/models.dart';
// import 'package:requester/config/pws_config.dart';
// import 'package:requester/requester/requester_pws.dart';
// import 'package:requester/response/response_pws.dart';
// import 'package:requester/url_pws/url_pws.dart';
// import 'package:models/model/enum/clients.dart';
// import 'package:http/http.dart';
//
// class EmpresaRequester {
//   static Future<ResponsePws> buscar(PWSConfig config, String token) async {
//     Response response = await RequesterPws(config: config).consome(
//       urlPws: UrlPws.getEmpresa(),
//       headerParams: {"token": token},
//     );
//     return ResponsePws(
//         response: response, converter: (json) => Empresa.fromJson(json));
//   }
//
//   static Future<ResponsePws> solicitarConfiguracao(PWSConfig config,
//       SolicitarConfiguracaoDTO dto) async {
//     Response response = await RequesterPws(config: config).consome(
//       urlPws: UrlPws.postEmpresaConfiguracao(),
//       headerParams: {"clientKey": config.client.clientKey},
//       body: dto.toJson(),
//     );
//     return ResponsePws(
//         response: response, converter: (json) => EmpresaDTO.listFromJson(json));
//   }
//
//   static Future<ResponsePws> carregarConfiguracao(PWSConfig config,
//       SolicitarConfiguracaoDTO dto) async {
//     Response response = await RequesterPws(config: config).consome(
//       urlPws: UrlPws.getEmpresaConfiguracao(),
//       headerParams: {"clientKey": config.client.clientKey},
//       queryParams: {
//         "inscricaoFederal": dto.incricaoFereral,
//         "nomeEstacao": dto.nomeEstacao,
//         "codigoVerificador": dto.codigoVerificador,
//       },
//       body: dto.toJson(),
//     );
//     return ResponsePws(response: response,
//         converter: (json) => SolicitarConfiguracaoDTO.fromJson(json));
//   }
//
//   static Future<ResponsePws> validarInscricaoFederal(PWSConfig config,
//       String inscFederal) async {
//     Response response = await RequesterPws(config: config).consome(
//       urlPws: UrlPws.getValidarInscricaoFederal(),
//       headerParams: {"clientKey": config.client.clientKey},
//       queryParams: {
//         "inscricaoFederal": inscFederal,
//       },
//     );
//     return ResponsePws(
//         response: response, converter: (json) => EmpresaDTO.fromJson(json));
//   }
//
//   static Future<ResponsePws> cadastrarEmpresa(PWSConfig config,
//       NovaEmpresaDTO dto) async {
//     Response response = await RequesterPws(config: config).consome(
//         urlPws: UrlPws.postCadastrarEmpresa(),
//         headerParams: {"clientKey": config.client.clientKey},
//         body: dto.toJson());
//     return ResponsePws(
//         response: response, converter: (json) => EmpresaDTO.fromJson(json));
//   }
//
//   static Future<ResponsePws> buscarSimplificado(PWSConfig config,
//       num idEmpresa) async {
//     Response response = await RequesterPws(config: config).consome(
//         urlPws: UrlPws.getEmpresaSimplificado(),
//         headerParams: {"clientSecret": config.clientSecret},
//         pathParams: {"{idEmpresa}": idEmpresa.toString()});
//     return ResponsePws(
//         response: response, converter: (json) => EmpresaDTO.fromJson(json));
//   }
//
//   static Future<ResponsePws> buscarIntegrador(PWSConfig config, String token,
//       String idIntegrador) async {
//     Response response = await RequesterPws(config: config)
//         .consome(urlPws: UrlPws.getBuscarIntegrador(), headerParams: {
//       "token": token,
//     }, pathParams: {
//       "{idIntegrador}": idIntegrador,
//     });
//     return ResponsePws(
//         response: response, converter: (json) => Empresa.fromJson(json));
//   }
// }
