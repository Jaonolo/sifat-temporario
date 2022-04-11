import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:http/http.dart';

class VersionInfoRequester {
  static Future<ResponsePws> buscar(PWSConfig config) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getVersao(),
    );
    return ResponsePws(response: response);
  }
}
