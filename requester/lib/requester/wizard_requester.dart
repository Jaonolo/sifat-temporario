import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:http/http.dart';
import 'package:models/model/enum/client.dart';

class WizardRequester {

  static Future<ResponsePws> buscarPlanos(PWSConfig config) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getContratoConfiguracao(),
      headerParams: {
        "clientKey": config.client.clientKey,
      },
    );
    return ResponsePws(response: response,
        converter: (json) => WizardBuscarPlanosEnvelop.fromJson(json));
  }

  static Future<ResponsePws> buscarEmpresa(PWSConfig config,
      String inscricaoFederal) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getWizardBuscarEmpresa(),
      headerParams: {
        "clientKey": config.client.clientKey,
      },
      queryParams: {
        "inscricaoFederal": inscricaoFederal,
      },
    );
    return ResponsePws(response: response,
        converter: (json) => WizardBuscarEmpresaEnvelop.fromJson(json));
  }

  static Future<ResponsePws> validarMaster(PWSConfig config, int idEmpresa,
      String email, String senha) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getWizardValidarMaster(),
      headerParams: {
        "clientKey": config.client.clientKey,
      },
      queryParams: {
        "idEmpresa": idEmpresa,
        "email": email,
        "senha": senha,
      },
    );
    return ResponsePws(response: response,
        converter: (json) => WizardValidarMasterDTO.fromJson(json));
  }

  static Future<ResponsePws> cadastrarEmpresa(PWSConfig config,
      NovaEmpresaDTO dto) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.postWizardCadastrarEmpresa(),
      headerParams: {
        "clientKey": config.client.clientKey,
      },
      body: dto.toJson(),
    );
    return ResponsePws(
        response: response, converter: (json) => EmpresaDTO.fromJson(json));
  }
}
