import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class ClienteRequester {
  //v2
  static Future<ResponsePws> buscarCadastroSimplificado(PWSConfig config,
      String token, int offset, String filtro, bool delivery) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getBuscarCadastroSimplificado(),
        headerParams: {
          "token": token,
        },
        queryParams: {
          "offset": offset,
          "filtro": filtro,
          "delivery": delivery,
        },
        converter: (json) => ClienteSimplificadoDTO.listFromJson(json));
  }

  static Future<ResponsePws> carregar(
      PWSConfig config, String token, int idCliente) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getCliente(),
        headerParams: {
          "token": token,
        },
        pathParams: {
          "{idCliente}": idCliente.toString(),
        },
        converter: (json) => Cliente.fromJson(json));
  }

  static Future<ResponsePws> carregarOcorrencias(
      PWSConfig config, String token, String idCliente) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getClienteCarregaOcorrencia(),
        headerParams: {
          "token": token,
        },
        pathParams: {
          "{idCliente}": idCliente,
        },
        converter: (json) => ClienteOcorrencia.listFromJson(json));
  }

  static Future<ResponsePws> inserirOcorrencias(PWSConfig config, String token,
      String idCliente, ClienteOcorrencia clienteOcorrencia) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.postInserirOcorrencia(),
      headerParams: {
        "token": token,
      },
      pathParams: {
        "{idCliente}": idCliente,
      },
      body: clienteOcorrencia,
    );
  }

  static Future<ResponsePws> atualizar(
      PWSConfig config, String token, Cliente cliente) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.putClienteAtualiza(),
        headerParams: {
          "token": token,
        },
        pathParams: {
          "{idCliente}": cliente.pessoa!.id.toString(),
        },
        body: cliente,
        converter: (json) => Cliente.fromJson(json));
  }

  static Future<ResponsePws> inserirCliente(
      PWSConfig config, String token, Cliente cliente) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.putClienteInsere(),
        headerParams: {
          "token": token,
        },
        body: cliente,
        converter: (json) => Cliente.fromJson(json));
  }

  static Future<ResponsePws> buscarHistorico(
      PWSConfig config, String token, int idCliente, int offset) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getBuscarHistorico(),
        headerParams: {
          "token": token,
        },
        queryParams: {
          "offset": offset,
          "idCliente": idCliente,
        },
        converter: (json) => HistoricoPedidoDTO.fromJson(json));
  }
}
