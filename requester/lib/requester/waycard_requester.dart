import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:http/http.dart';
import 'package:models/model/enum/client.dart';

class WaycardRequester {
  static Future<ResponsePws> inserirUsuario(PWSConfig config,
      Usuario user) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.postUsuarioWaycard(),
      headerParams: {
        "clientKey": config.client.clientKey,
      },
      body: user.toJson(),
    );
    return ResponsePws(
        response: response, converter: (json) => Usuario.fromJson(json));
  }

  static Future<ResponsePws> confirmarUsuario(PWSConfig config, Usuario user,
      String codigo) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.putConfirmarUsuarioWaycard(),
      headerParams: {
        "clientKey": config.client.clientKey,
      },
      queryParams: {
        "cpf": user.cpf,
        "codigo": codigo,
      },
    );
    return ResponsePws(
        response: response, converter: (json) => Usuario.fromJson(json));
  }

  static Future<ResponsePws> reenviarCodigo(PWSConfig config,
      Usuario user) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getReenviarCodigoWaycard(),
      headerParams: {
        "clientKey": config.client.clientKey,
      },
      queryParams: {
        "cpf": user.cpf,
      },
    );
    return ResponsePws(response: response);
  }

  static Future<ResponsePws> login(PWSConfig config, Usuario user) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.postWaycardLogin(),
      headerParams: {
        "clientKey": config.client.clientKey,
      },
      formParams: {
        "login": user.email,
        "password": user.password,
      },
    );
    return ResponsePws(
        response: response, converter: (json) => Usuario.fromJson(json));
  }

  static Future<ResponsePws> listarCartoes(PWSConfig config,
      String token) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.listagemWaycardCartoes(),
      headerParams: {
        "token": token,
      },
    );
    return ResponsePws(response: response,
        converter: (json) => ClienteCartao.listFromJson(json));
  }

  static Future<ResponsePws> listarFaturas(PWSConfig config, String token,
      num idCartao) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.listagemWaycardFaturas(),
      headerParams: {
        "token": token,
      },
      pathParams: {
        "{idCartao}": idCartao.toString(),
      },
    );
    return ResponsePws(response: response,
        converter: (json) => WaycardFatura.listFromJson(json));
  }

  static Future<ResponsePws> listarExtratoFaturas(PWSConfig config,
      String token, num idCartao, num idFatura) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.waycardFaturaExtrato(),
      headerParams: {
        "token": token,
      },
      pathParams: {
        "{idCartao}": idCartao.toString(),
        "{idFatura}": idFatura.toString(),
      },
    );
    return ResponsePws(response: response,
        converter: (json) => WaycardTransacao.listFromJson(json));
  }

  static Future<ResponsePws> gerarToken(PWSConfig config, String token,
      num idCartao) async {
    Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.waycardGerarToken(),
      headerParams: {
        "token": token,
      },
      pathParams: {
        "{idCartao}": idCartao.toString(),
      },
    );
    return ResponsePws(response: response);
  }
}
