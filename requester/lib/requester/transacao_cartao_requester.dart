import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class TransacaoCartaoRequester {
  static Future<ResponsePws> cancelarTransacao(PWSConfig config, String token,
      int idTransacao, TransacaoCartao transacaoCancelamento) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.postCancelarTransacao(),
        headerParams: {
          "token": token,
        },
        pathParams: {
          "{idTransacao}": idTransacao.toString(),
        },
        body: transacaoCancelamento.toJson(),
        converter: (json) => TransacaoCartao.fromJson(json));
  }

  static Future<ResponsePws> buscarTransacoes(PWSConfig config, String token,
      bool cancelados, int diasParaRetroagir, String tipoTef) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getTransacoesCartao(),
        headerParams: {
          "token": token,
        },
        queryParams: {
          "buscarCancelados": cancelados,
          "diasParaRetroagir": diasParaRetroagir,
          "tipoTef": tipoTef,
        },
        converter: (json) => TransacaoCartao.listFromJson(json));
  }
}
