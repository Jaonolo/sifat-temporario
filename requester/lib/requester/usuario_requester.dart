import 'package:models/model/enum/clients.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:utils/utils/string_utils.dart';

class UsuarioRequester {
  static Future<ResponsePws> login(PWSConfig config,
      {required String pin,
      required String nomeEstacao,
      required Usuario user}) async {
    Map<String, dynamic> formParams = {
      "nomeEstacao": nomeEstacao,
      "clientKey": config.client.clientKey,
      "clientSecret": config.clientSecret,
      "versao": config.client.versao
    };

    formParams['pin'] = StringUtils.stringToMd5(pin).toUpperCase();
    formParams['username'] = user.username;
    formParams['password'] =
        StringUtils.stringToMd5(user.password!).toUpperCase();

    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.usuarioLogin(),
        headerParams: {
          'client': config.client.name,
        },
        formParams: formParams,
        converter: (json) => UsuarioEmpresa.fromJson(json));
  }

  static Future<ResponsePws> logout(PWSConfig config, String token) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.usuarioLogout(),
      headerParams: {
        'token': token,
      },
    );
  }

  static Future<ResponsePws> atualizarSessao(
      PWSConfig config, String token) async {
    return await RequesterPws(config: config)
        .consome(urlPws: UrlPws.atualizaSessao(), headerParams: {
      "token": token,
      "clientSecret": config.clientSecret,
    });
  }

  static Future<ResponsePws> validarSupervisor(
      PWSConfig config,
      String token,
      PrivilegioCodigo privilegioCodigo,
      NivelPrivilegio nivelPrivilegio,
      String pin) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.validarSupervisor(),
      headerParams: {
        "token": token,
      },
      queryParams: {
        "pin": pin,
        "nivel-privilegio": nivelPrivilegio.name,
        "permissao": privilegioCodigo.name,
      },
    );
  }

  static Future<ResponsePws> validarInscricaoFederal(
      PWSConfig config, String inscFederal, num idEmpresa) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.validarInscricaoFederalUsuario(),
      headerParams: {
        "clientKey": config.client.clientKey,
      },
      queryParams: {
        "cpf": inscFederal,
        "idEmpresa": idEmpresa.toString(),
      },
    );
  }

  static Future<ResponsePws> adicionarEmpresa(
      PWSConfig config, String inscFederal, num idEmpresa) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.putAdicionarEmpresaUsuario(),
      headerParams: {
        "clientKey": config.client.clientKey,
      },
      queryParams: {
        "cpf": inscFederal,
        "idEmpresa": idEmpresa.toString(),
      },
    );
  }

  static Future<ResponsePws> solicitaEmailConfirmacao(
      PWSConfig config, num idUsuario, num idEmpresa) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.solicitarEmailConfirmacaoUsuario(),
      headerParams: {
        "clientKey": config.client.clientKey,
      },
      queryParams: {
        "idUsuario": idUsuario.toString(),
        "idEmpresa": idEmpresa.toString(),
      },
    );
  }

  static Future<ResponsePws> validarCadastro(
      PWSConfig config, num idUsuario, num idEmpresa, String codigo) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.validarCadastroUsuario(),
        headerParams: {
          "clientKey": config.client.clientKey,
        },
        queryParams: {
          "idUsuario": idUsuario.toString(),
          "idEmpresa": idEmpresa.toString(),
          "codigoValidador": codigo,
        },
        converter: (json) => ClientEmpresa.fromJson(json));
  }

  static Future<ResponsePws> cadastrarUsuario(
      PWSConfig config, Usuario user, num idEmpresa) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.postCadastrarUsuario(),
        headerParams: {
          "clientKey": config.client.clientKey,
        },
        queryParams: {
          "idEmpresa": idEmpresa.toString(),
        },
        body: user.toJson(),
        converter: (json) => Usuario.fromJson(json));
  }

  static Future<ResponsePws> atualizarDados(
      PWSConfig config, Usuario user) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.putAtualizarDadosUsuario(),
        headerParams: {
          "clientKey": config.client.clientKey,
        },
        pathParams: {
          "{idUsuario}": user.id.toString(),
        },
        body: user.toJson(),
        converter: (json) => Usuario.fromJson(json));
  }

  static Future<ResponsePws> esqueciSenha(
      PWSConfig config, String email) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.getEsqueciSenha(),
      headerParams: {
        "clientKey": config.client.clientKey,
      },
      queryParams: {
        "email": email,
      },
    );
  }

  static Future<ResponsePws> buscarUsuarioEmpresaPorId(
      String token, PWSConfig config, int idUsuarioEmpresa) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getBuscarUsuarioEmpresaPorId(),
        headerParams: {
          "token": token,
        },
        pathParams: {
          "{idUsuarioEmpresa}": idUsuarioEmpresa.toString(),
        },
        converter: (json) => UsuarioEmpresa.fromJson(json));
  }

  static Future<ResponsePws> buscarUsuarioById(
      String token, PWSConfig config, int idUsuario) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getBuscarUsuarioById(),
        headerParams: {
          "token": token,
        },
        pathParams: {
          "{idUsuario}": idUsuario.toString(),
        },
        converter: (json) => Usuario.fromJson(json));
  }
}
