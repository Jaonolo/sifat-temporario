import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class TurnoRequester {
  static Future<ResponsePws> buscarAtivo(PWSConfig config, String token) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getTurnoAtivo(),
        headerParams: {
          'token': token,
        },
        converter: (json) => Turno.fromJson(json));
  }

  static Future<ResponsePws> abrir(
      PWSConfig config, String token, Turno turno) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.postTurno(),
        headerParams: {
          'token': token,
        },
        body: turno.toJson(),
        converter: (json) => Turno.fromJson(json));
  }

  static Future<ResponsePws> listar(
      PWSConfig config, String token, Movimento movimento) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getTurnos(),
        headerParams: {
          'token': token,
        },
        queryParams: {
          "idMovimento": movimento.id.toString(),
        },
        converter: (json) => Turno.listFromJson(json));
  }

  static Future<ResponsePws> fechar(
      PWSConfig config, String token, Turno turno) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.putFecharTurno(),
        headerParams: {
          'token': token,
        },
        pathParams: {
          "{idTurno}": turno.id.toString(),
        },
        body: turno.toJson(),
        converter: (json) => Turno.fromJson(json));
  }
}
