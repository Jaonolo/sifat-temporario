import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:http/http.dart';

class ReservaMesaRequester {
  static Future<ResponsePws> buscar(PWSConfig config, String token,
      String statusReserva) async {
    Response response = await RequesterPws(config: config)
        .consome(urlPws: UrlPws.getReservaMesa(), headerParams: {
      'token': token,
    }, queryParams: {
      "statusReserva": statusReserva,
    });
    return ResponsePws(
        response: response,
        converter: (json) => ReservaMesa.listFromJson(json));
  }

  static Future<ResponsePws> atualizar(PWSConfig config, String token,
      ReservaMesa reserva) async {
    Response response = await RequesterPws(config: config).consome(
        urlPws: UrlPws.putReservaMesa(),
        headerParams: {
          'token': token,
        },
        pathParams: {
          '{idReserva}': reserva.id.toString(),
        },
        body: reserva.toJson());
    return ResponsePws(
        response: response, converter: (json) => ReservaMesa.fromJson(json));
  }

  static Future<ResponsePws> gravar(PWSConfig config, String token,
      ReservaMesa reserva) async {
    print(reserva.toJson());

    Response response = await RequesterPws(config: config).consome(
        urlPws: UrlPws.postReservaMesa(),
        headerParams: {
          'token': token,
        },
        body: reserva.toJson());
    return ResponsePws(
        response: response, converter: (json) => ReservaMesa.fromJson(json));
  }
}
