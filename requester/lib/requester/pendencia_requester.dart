import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class PendenciaRequester {
  static Future<ResponsePws> existePendencias(
      PWSConfig config, String token) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.getExistePendencia(),
      headerParams: {"token": token},
      queryParams: {"isVFPE": false},
      //Mobile não possui MFE
    );
  }

  static Future<ResponsePws> buscar(
      PWSConfig config, String token, int offSet) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getPendencias(),
        headerParams: {
          'token': token,
        },
        queryParams: {
          'offset': offSet,
          "tipoPendencia": "EMISSAO_NOTA",
        },
        converter: (json) => Pendencia.listFromJson(json));
  }
}
