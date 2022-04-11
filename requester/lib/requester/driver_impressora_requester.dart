import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:http/http.dart';

class DriverImpressoraRequester {


  static Future<ResponsePws> listar(PWSConfig config, String token) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getDriverImpressora(),
      headerParams: {"token": token},
    );
    return ResponsePws(response: response,
        converter: (json) => DriverImpressora.listFromJson(json));
  }
}