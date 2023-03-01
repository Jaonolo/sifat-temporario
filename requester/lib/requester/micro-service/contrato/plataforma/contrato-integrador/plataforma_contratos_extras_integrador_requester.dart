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
          'Authorization': "Bearer $token",
        },
        body: itemDto
    );
  }

  //MÉTODO GET - getbuscarTodosItensPorIdEmpresaETipoItem - buscarPlataformaContratoIntegradorExtra
  static Future<ResponsePws> buscarTodosItensPorIdEmpresaETipoItem(
      PWSConfig config, String token, String idEmpresa, String tipoItem) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getbuscarTodosItensPorIdEmpresaETipoItem(),
        headerParams: {
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
