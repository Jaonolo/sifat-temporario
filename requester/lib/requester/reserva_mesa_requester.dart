import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class ReservaMesaRequester {
  static Future<ResponsePws> buscar(
      PWSConfig config, String token, String statusReserva) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getReservaMesa(),
        headerParams: {
          'token': token,
        },
        queryParams: {
          "statusReserva": statusReserva,
        },
        converter: (json) => ReservaMesa.listFromJson(json));
  }

  static Future<ResponsePws> atualizar(
      PWSConfig config, String token, ReservaMesa reserva) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.putReservaMesa(),
        headerParams: {
          'token': token,
        },
        pathParams: {
          '{idReserva}': reserva.id.toString(),
        },
        body: reserva.toJson(),
        converter: (json) => ReservaMesa.fromJson(json));
  }

  static Future<ResponsePws> gravar(
      PWSConfig config, String token, ReservaMesa reserva) async {
    print(reserva.toJson());

    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.postReservaMesa(),
        headerParams: {
          'token': token,
        },
        body: reserva.toJson(),
        converter: (json) => ReservaMesa.fromJson(json));
  }
}
