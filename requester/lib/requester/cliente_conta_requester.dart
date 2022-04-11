import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:http/http.dart';

class ClienteContaRequester {

  static Future<ResponsePws> extrato(PWSConfig config, String token,
      String idCliente, String dataInicialFormatada,
      String dataFinalFormatada) async {
    Response response = await RequesterPws(config: config).consome(
        urlPws: UrlPws.getBuscarExtrato(),
        headerParams: {
          "token": token
        },
        pathParams: {
          "{idCliente}": idCliente
        },
        queryParams: {
          "dataInicial": dataInicialFormatada,
          "dataFinal": dataFinalFormatada
        }
    );

    return ResponsePws(response: response,
        converter: (json) => ClienteExtratoDTO.fromJson(json));
  }


  static Future<ResponsePws> debitar(PWSConfig config, String token,
      ClienteConta conta, bool permissaoLimiteUltrapassado) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.postInserirDebito(),
      headerParams: {
        "token": token,
        "permissao-limite-ultrapassado": permissaoLimiteUltrapassado.toString()
      },
      pathParams: {
        "{idCliente}": conta.idCliente.toString(),
      },
      body: conta.toJson(),
    );

    return ResponsePws(
        response: response, converter: (json) => ClienteConta.fromJson(json));
  }

}

