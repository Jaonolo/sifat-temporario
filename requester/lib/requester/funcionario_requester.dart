import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:http/http.dart';

class FuncionarioRequester {
  static Future<ResponsePws> carregaFuncionarios(PWSConfig config, String token,
      String tipoFuncionario) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getCarregaFuncionarios(),
      headerParams: {"token": token},
      queryParams: {"tipo": tipoFuncionario},
    );
    return ResponsePws(
        response: response,
        converter: (json) => Funcionario.listFromJson(json));
  }
}
