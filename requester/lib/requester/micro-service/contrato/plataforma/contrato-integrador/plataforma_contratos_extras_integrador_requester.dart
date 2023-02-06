
import 'dart:convert';

import 'package:http/http.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:http/http.dart' as http;


class PlataformaContratosExtrasIntegradorRequester {

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


  //MÉTODO GET - getbuscarTodosItensPorIdEmpresaETipoItem - buscarPlataformaContratoIntegradorExtra
  static Future<ResponsePws> buscarTodosItensPorIdEmpresaETipoItem(PWSConfig config, String token, String idEmpresa, String tipoItem) async {
    print('#################');
    var headers = {
      'Authorization': 'Bearer eyJhbGciOiJIUzUxMiJ9.eyJ0aXBvQ2xpZW50IjoiRVJQIiwiaWRTZXNzYW8iOiI2ZGRkNmQ0Mi0wYmYwLTQ0YTctOGJkZC05NmQyNWRhYjU5NWQiLCJleHAiOjE2NzU3MTI1NTAsImlhdCI6MTY3NTY5ODE1MH0.hGfjSB46nk967K1N4GyWq_ku6ECXEEC03wkRWHZaBBxyLx_NkQRkYtU1FC2OoLZk7gLC07DC51Gywfs26z9ndQ',
      'Content-Type': 'application/json'
    };
    var request = http.Request('GET', Uri.parse('http://localhost:8081/contrato/waychef/item-integrador/buscar-todos/1/por-tipo/EXTRA'));
    request.body = json.encode({});
    request.headers.addAll(headers);

    http.StreamedResponse r = await request.send();

    if (r.statusCode == 200) {
      print(await r.stream.bytesToString());
    }
    else {
      print(r.reasonPhrase);
    }
    print('#################');



    Response? response = await RequesterPws(config: config).consome(
        urlPws: UrlPws.getbuscarTodosItensPorIdEmpresaETipoItem(),
        headerParams: {
          "Content-type": "application/json; charset=UTF-8",
          'Authorization': "Bearer $token",
        },
        pathParams: {
          "{idEmpresa}": 1.toString(),
          "{tipoItem}": "EXTRA",
        }
    );
    return ResponsePws(
        response: response,
        converter: (json) => ItemConfiguracaoIntegradorWaychef.listFromJson(json));
  }

}