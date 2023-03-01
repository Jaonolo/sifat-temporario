import 'package:http/http.dart' as http;
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class ClientAutoAtendimentoRequester {
  static Future<ResponsePws> login(PWSConfig config, String clientSecret,
      String clientKey, String nomeEstacao) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.putAutoAtendimentoLogin(),
        formParams: {
          "clientSecret": clientSecret,
          "clientKey": clientKey,
          "nomeEstacao": nomeEstacao
        },
        converter: (json) => ConfiguracoesAutoAtendimentoDTO.fromJson(json));
  }

  static Future<ResponsePws> buscarConfiguracoes(
      PWSConfig config, String token) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.putBuscarConfiguracoes(),
        headerParams: {"token": token},
        converter: (json) => ConfiguracoesAutoAtendimentoDTO.fromJson(json));
  }
}
