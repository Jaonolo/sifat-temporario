import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:http/http.dart' as http;

class ServicoAutoPesagemRequester {
  static Future<ResponsePws> login(PWSConfig pwsConfig, String token,
      String clientSecret, String clientKey, String nomeEstacao) async {
    http.Response response = await RequesterPws(config: pwsConfig).consome(
        urlPws: UrlPws.putAutoPesagemLogin(),
        formParams: {
          "clientSecret": clientSecret,
          "clientKey": clientKey,
          "nomeEstacao": nomeEstacao
        });

    return ResponsePws(
        response: response,
        converter: (json) => LoginAutoPesagemDTO.fromJson(json));
  }

  static Future<ResponsePws> lerPeso(PWSConfig pwsConfig, String portaSerial,
      String baundRate, String modeloBalanca) async {
    http.Response response = await RequesterPws(config: pwsConfig)
        .consome(urlPws: UrlPws.getLerPeso(), queryParams: {
      "portaSerial": portaSerial,
      "baundRate": baundRate,
      "modeloBalanca": modeloBalanca
    });

    return ResponsePws(response: response, converter: (json) => json);
  }

  static Future<ResponsePws> imprimir(PWSConfig pwsConfig,
      TicketImpressaoDTO dto) async {
    http.Response response = await RequesterPws(config: pwsConfig).consome(
      urlPws: UrlPws.putImprimirAutoPesagem(),
      body: dto,
    );

    return ResponsePws(response: response);
  }
}
