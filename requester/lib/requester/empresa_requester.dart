import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:models/model/enum/clients.dart';
import 'package:http/http.dart';

class EmpresaRequester {
  static Future<ResponsePws> buscar(PWSConfig config, String token) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getEmpresa(),
      headerParams: {"token": token},
    );
    return ResponsePws(
        response: response, converter: (json) => Empresa.fromJson(json));
  }

  static Future<ResponsePws> solicitarConfiguracao(PWSConfig config,
      SolicitarConfiguracaoDTO dto) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.postEmpresaConfiguracao(),
      headerParams: {"clientKey": config.client.clientKey},
      body: dto.toJson(),
    );
    return ResponsePws(
        response: response, converter: (json) => EmpresaDTO.listFromJson(json));
  }

  static Future<ResponsePws> carregarConfiguracao(PWSConfig config,
      SolicitarConfiguracaoDTO dto) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getEmpresaConfiguracao(),
      headerParams: {"clientKey": config.client.clientKey},
      queryParams: {
        "inscricaoFederal": dto.incricaoFereral,
        "nomeEstacao": dto.nomeEstacao,
        "codigoVerificador": dto.codigoVerificador,
      },
      body: dto.toJson(),
    );
    return ResponsePws(response: response,
        converter: (json) => SolicitarConfiguracaoDTO.fromJson(json));
  }

  static Future<ResponsePws> validarInscricaoFederal(PWSConfig config,
      String inscFederal) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getValidarInscricaoFederal(),
      headerParams: {"clientKey": config.client.clientKey},
      queryParams: {
        "inscricaoFederal": inscFederal,
      },
    );
    return ResponsePws(
        response: response, converter: (json) => EmpresaDTO.fromJson(json));
  }

  static Future<ResponsePws> cadastrarEmpresa(PWSConfig config,
      NovaEmpresaDTO dto) async {
    Response response = await RequesterPws(config: config).consome(
        urlPws: UrlPws.postCadastrarEmpresa(),
        headerParams: {"clientKey": config.client.clientKey},
        body: dto.toJson());
    return ResponsePws(
        response: response, converter: (json) => EmpresaDTO.fromJson(json));
  }

  static Future<ResponsePws> buscarSimplificado(PWSConfig config,
      num idEmpresa) async {
    Response response = await RequesterPws(config: config).consome(
        urlPws: UrlPws.getEmpresaSimplificado(),
        headerParams: {"clientSecret": config.clientSecret},
        pathParams: {"{idEmpresa}": idEmpresa.toString()});
    return ResponsePws(
        response: response, converter: (json) => EmpresaDTO.fromJson(json));
  }

  static Future<ResponsePws> buscarIntegrador(PWSConfig config, String token,
      String idIntegrador) async {
    Response response = await RequesterPws(config: config)
        .consome(urlPws: UrlPws.getBuscarIntegrador(), headerParams: {
      "token": token,
    }, pathParams: {
      "{idIntegrador}": idIntegrador,
    });
    return ResponsePws(
        response: response, converter: (json) => Empresa.fromJson(json));
  }
}
