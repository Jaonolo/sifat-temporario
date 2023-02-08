
import 'package:http/http.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class PlataformaRequester {

  //MÉTODO GET - getbuscarTodosItensPorIdEmpresaETipoItem - buscarPlataformaContratoIntegradorExtra
  static Future<ResponsePws> buscarTodosItensPorIdEmpresaETipoItem(PWSConfig config, String token, String idEmpresa, String tipoItem) async {
    return await RequesterPws(config: config).consome(
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
        },
        converter: (json) => ItemConfiguracaoIntegradorWaychef.listFromJson(json)
    );
  }


  //MÉTODO GET - getbuscarTodosItemConfiguracaoWaychef- buscarTodosItemConfiguracaoWaychef
  static Future<ResponsePws> buscarTodosItemConfiguracaoWaychefExtra(PWSConfig config, String token) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getbuscarTodosItemConfiguracaoWaychefExtra(),
        headerParams: {
          'Authorization': "Bearer $token",
        },
        pathParams: {
          "{tipoItem}": "NORMAL",
        },
        converter: (json) => ItemConfiguracaoWaychef.listFromJson(json)
    );
  }



//método PUT ABAIXO
  static Future<ResponsePws> atualizarItemConfiguracaoIntegrador(PWSConfig config,
      String token, List<ItemConfiguracaoIntegradorWaychef> itemDto) async {

    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.putAtualizarItemConfiguracaoIntegrador(),
        headerParams: {
          "Authorization": "Bearer " + token,
        },
        body: itemDto);
  }

}