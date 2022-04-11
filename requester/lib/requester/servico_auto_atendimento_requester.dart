import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:http/http.dart' as http;

class ServicoAutoAtendimentoRequester {
  static Future<ResponsePws> login(PWSConfig config, String clientSecret,
      String clientKey, String nomeEstacao) async {
    http.Response response = await RequesterPws(config: config).consome(
        urlPws: UrlPws.putAutoAtendimentoLogin(),
        formParams: {
          "clientSecret": clientSecret,
          "clientKey": clientKey,
          "nomeEstacao": nomeEstacao
        });
    return ResponsePws(
      response: response,
      converter: (json) => LoginAutoAtendimentoDTO.fromJson(json),
    );
  }
}
