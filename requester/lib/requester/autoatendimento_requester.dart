import 'package:http/http.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class AutoatendimentoRequester {
  static Future<ResponsePws> startSitef(PWSConfig config, ServicoSitef servicoSitef,
      String caixa,
      String cnpjEstabelecimento) async {

    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.postAutoatendimentoStartSitef(),
      headerParams: {},
      queryParams: {"caixa": caixa, "cnpjEstabelecimento": cnpjEstabelecimento},
      body: servicoSitef.toJson(),
    );
    return ResponsePws(response: response);
  }

  static Future<ResponsePws> printNFCe(PWSConfig config,
      PrinterNFCeDTO dto) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.postAutoatendimentoPrintNFCe(),
      headerParams: {},
      body: dto.toJson(),
    );
    return ResponsePws(response: response);
  }

  static Future<ResponsePws> carregaArquivoProperties(PWSConfig config) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getAutoatendimentoArquivoProperties(),
      headerParams: {},
    );
    return ResponsePws(response: response);
  }

  static Future<ResponsePws> insereArquivoProperties(PWSConfig config,
      ConfigPropertiesDTO dto) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.postAutoatendimentoArquivoProperties(),
      headerParams: {},
      body: dto.toJson(),
    );
    return ResponsePws(response: response);
  }

  static Future<ResponsePws> carregaNomeEstacao(PWSConfig config) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getAutoatendimentoNomeEstacao(),
      headerParams: {},
    );

    return ResponsePws(response: response);
  }

  static Future<ResponsePws> printVenda(PWSConfig config,
      PrinterVendaDTO dto) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.postAutoatendimentoPrintVenda(),
      headerParams: {},
      body: dto.toJson(),
    );
    return ResponsePws(response: response);
  }

  static Future<ResponsePws> printConsumo(PWSConfig config,
      PrinterVendaDTO dto) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.postAutoatendimentoPrintConsumo(),
      headerParams: {},
      body: dto.toJson(),
    );
    return ResponsePws(response: response);
  }
}
