import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:models/model/enum/clients.dart';
import 'package:http/http.dart' as http;

class GerenciadorRequester {

  static Future<ResponsePws> login(PWSConfig config, String inscricaoFederal,
      String client, String nomeEstacao) async {
    Map<String, dynamic> formParams = {
      "clientKey": config.client.clientKey,
      "clientSecret": config.clientSecret,
      "versao": config.client.versao,
      "inscricaoFederal": inscricaoFederal,
      "client": client,
      "nomeEstacao": nomeEstacao,
    };

    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.gerenciadorLogin(),
      formParams: formParams,
    );

    return ResponsePws(response: response);
  }

  static Future<ResponsePws> atualizaSessao(PWSConfig config,
      String token) async {
    http.Response response = await RequesterPws(config: config).consome(
        urlPws: UrlPws.putAtualizaSessao(),
        headerParams: {
          "token": token,
          "clientSecret": config.clientSecret,
        });
    return ResponsePws(response: response);
  }
}