import 'package:http/http.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class PlataformaContratosExtrasIntegradorRequester {
  //método PUT ABAIXO
  static Future<ResponsePws> atualizarItemConfiguracaoIntegrador(
      PWSConfig config,
      String token,
      List<ItemConfiguracaoIntegradorWaychef> itemDto) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.putAtualizarItemConfiguracaoIntegrador(),
        headerParams: {
          "Authorization": "Bearer " + token,
        },
        //body: "[{\"id\":\"e0488da5-6116-11ed-a5cb-20898409f05a\", \"valor\":10.10, \"podeComercializar\":true, \"idEmpresa\":1, \"idItemConfiguracaoWaychef\":\"e03f6204-6116-11ed-a5cb-20898409f05a\", \"itemConfiguracaoWaychefDTO\":{\"id\":\"e03f6204-6116-11ed-a5cb-20898409f05a\", \"nome\":\"AUTOATENDIMENTO\", \"detalhes\":null, \"tipoItem\":\"NORMAL\", \"tipoItemContratoWaychef\":\"SERVICO_ALFA_SYNC\", \"integradorPodeComercializarItemDTOList\":[]}}, {\"id\":\"e048aa63-6116-11ed-a5cb-20898409f05a\", \"valor\":0.00, \"podeComercializar\":true, \"idEmpresa\":1, \"idItemConfiguracaoWaychef\":\"e03f5c35-6116-11ed-a5cb-20898409f05a\", \"itemConfiguracaoWaychefDTO\":{\"id\":\"e03f5c35-6116-11ed-a5cb-20898409f05a\", \"nome\":\"AUTOATENDIMENTO\", \"detalhes\":null, \"tipoItem\":\"NORMAL\", \"tipoItemContratoWaychef\":\"SERVICO_WAYCHEF_MOBILE\", \"integradorPodeComercializarItemDTOList\":[]}}]",
        body: itemDto);
  }

  //MÉTODO GET - getbuscarTodosItensPorIdEmpresaETipoItem - buscarPlataformaContratoIntegradorExtra
  static Future<ResponsePws> buscarTodosItensPorIdEmpresaETipoItem(
      PWSConfig config, String token, String idEmpresa, String tipoItem) async {
    token =
        "eyJhbGciOiJIUzUxMiJ9.eyJ0aXBvQ2xpZW50IjoiRVJQIiwiaWRTZXNzYW8iOiI2MmRhNzE4Zi00ZjgxLTQ2YzAtODY1Mi0wNmE4MTA2NjNiYmEiLCJleHAiOjE2NzU4Njk3NjEsImlhdCI6MTY3NTg1NTM2MX0.7nTM3XWOzaqofQcWUE70lkavUPruXg9e62eQZ01C0MFICgHIN6LhX3VNdROTnKrLJ1wtBPg21QjG_ejpVh74Lg";

    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getbuscarTodosItensPorIdEmpresaETipoItem(),
        headerParams: {
          "Content-type": "application/json; charset=UTF-8",
          'Authorization': "Bearer $token",
        },
        pathParams: {
          "{idEmpresa}": 1.toString(),
          "{tipoItem}": "EXTRA",
        },
        converter: (json) =>
            ItemConfiguracaoIntegradorWaychef.listFromJson(json));
  }
}
