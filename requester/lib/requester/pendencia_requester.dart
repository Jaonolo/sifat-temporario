import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:http/http.dart';

class PendenciaRequester {
  static Future<ResponsePws> existePendencias(PWSConfig config,
      String token) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getExistePendencia(),
      headerParams: {"token": token},
      queryParams: {"isVFPE": false},
      //Mobile não possui MFE
    );
    return ResponsePws(response: response);
  }

  static Future<ResponsePws> buscar(PWSConfig config, String token,
      int offSet) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getPendencias(),
      headerParams: {
        'token': token,
      },
      queryParams: {
        'offset': offSet,
        "tipoPendencia": "EMISSAO_NOTA",
      },
    );
    return ResponsePws(
        response: response, converter: (json) => Pendencia.listFromJson(json));
  }
}
