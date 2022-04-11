import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:http/http.dart';

class QuestRequester {
  static Future<ResponsePws> consultarParticipante(PWSConfig config,
      String token, String cpf,
      {String idNota = ""}) async {
    var query = Map<String, dynamic>();
    query["cpf"] = cpf;
    if (idNota.isNotEmpty) query["idNota"] = idNota.toString();

    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getConsultarParticipanteQuest(),
      headerParams: {"token": token},
      queryParams: query,
    );
    return ResponsePws(response: response,
        converter: (json) => ClienteQuestDTO.fromJson(json));
  }

  static Future<ResponsePws> preCadastro(PWSConfig config, String token,
      EnvioPreCadastro envioPreCadastro, num idNota) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.postPreCadastroParticipanteQuest(),
      headerParams: {"token": token},
      queryParams: {"idNota": idNota.toString()},
      body: envioPreCadastro.toJson(),
    );
    return ResponsePws(response: response,
        converter: (json) => ClienteQuestDTO.fromJson(json));
  }

  static Future<ResponsePws> gerarToken(PWSConfig config, String token,
      String cnpjParceiro,
      String cpfCnpjParticipante, BigDecimal valorResgate) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.postGerarTokenQuest(),
      headerParams: {
        "token": token,
      },
      queryParams: {
        "cnpjParceiro": cnpjParceiro,
        "cpfCnpjParticipante": cpfCnpjParticipante,
        "valorResgate": valorResgate.toString(),
      },
    );
    return ResponsePws(
        response: response, converter: (json) => RetornoToken.fromJson(json));
  }
}
