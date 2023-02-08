import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class AutoatendimentoRequester {
  static Future<ResponsePws> startSitef(
      PWSConfig config,
      ServicoSitef servicoSitef,
      String caixa,
      String cnpjEstabelecimento) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.postAutoatendimentoStartSitef(),
      headerParams: {},
      queryParams: {"caixa": caixa, "cnpjEstabelecimento": cnpjEstabelecimento},
      body: servicoSitef.toJson(),
    );
  }

  static Future<ResponsePws> printNFCe(
      PWSConfig config, PrinterNFCeDTO dto) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.postAutoatendimentoPrintNFCe(),
      headerParams: {},
      body: dto.toJson(),
    );
  }

  static Future<ResponsePws> carregaArquivoProperties(PWSConfig config) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.getAutoatendimentoArquivoProperties(),
      headerParams: {},
    );
  }

  static Future<ResponsePws> insereArquivoProperties(
      PWSConfig config, ConfigPropertiesDTO dto) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.postAutoatendimentoArquivoProperties(),
      headerParams: {},
      body: dto.toJson(),
    );
  }

  static Future<ResponsePws> carregaNomeEstacao(PWSConfig config) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.getAutoatendimentoNomeEstacao(),
      headerParams: {},
    );
  }

  static Future<ResponsePws> printVenda(
      PWSConfig config, PrinterVendaDTO dto) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.postAutoatendimentoPrintVenda(),
      headerParams: {},
      body: dto.toJson(),
    );
  }

  static Future<ResponsePws> printConsumo(
      PWSConfig config, PrinterVendaDTO dto) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.postAutoatendimentoPrintConsumo(),
      headerParams: {},
      body: dto.toJson(),
    );
  }
}
