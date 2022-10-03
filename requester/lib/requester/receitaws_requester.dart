import 'package:http/http.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:models/model/enum/clients.dart' as c;


class ReceitawsRequester {

  static Future<ResponsePws> buscar(c.Clients app, String cnpj) async {
    var pwsConfig = PWSConfig(
        urlBase: "",
        client: app,
        clientSecret: app.clientKey
    );

    Response response = await RequesterPws(config: pwsConfig).consome(
      urlPws: UrlPws.getReceitawsBuscaCNPJ(),
      pathParams: {
        "{cnpj}": cnpj,
      },
    );
    return ResponsePws(response: response,
        converter: (json) => ReceitawsEmpresa.fromJson(json));
  }
}