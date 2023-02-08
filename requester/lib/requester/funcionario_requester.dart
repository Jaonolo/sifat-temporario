import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class FuncionarioRequester {
  static Future<ResponsePws> carregaFuncionarios(
      PWSConfig config, String token, String tipoFuncionario) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getCarregaFuncionarios(),
        headerParams: {"token": token},
        queryParams: {"tipo": tipoFuncionario},
        converter: (json) => Funcionario.listFromJson(json));
  }
}
