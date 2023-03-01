import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class OperacaoRequester {
  static Future<ResponsePws> buscarConferencia(
      PWSConfig config, String token, Turno turno) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getOperacaoConferencia(),
        headerParams: {
          'token': token,
        },
        queryParams: {
          'idTurno': turno.id,
        },
        debug: true,
        converter: (json) => ConferenciaCaixaDTO.fromJson(json));
  }

  static Future<ResponsePws> inserir(
      PWSConfig config, String token, Operacao operacao) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.postOperacao(),
        headerParams: {
          'token': token,
        },
        body: operacao.toJson(),
        converter: (json) => Operacao.fromJson(json));
  }
}
