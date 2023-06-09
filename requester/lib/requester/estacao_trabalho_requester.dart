import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:utils/utils/string_utils.dart';

class EstacaoTrabalhoRequester {
  static Future<ResponsePws> buscar(PWSConfig config,
      {String token = "", String nomeEstacao = ""}) async {
    Map<String, dynamic> query = {};
    Map<String, String> headers = {};

    if (nomeEstacao.isNotEmpty) query = {"nomeEstacao": nomeEstacao};

    if (token.isNotEmpty) {
      headers["token"] = token;
    } else {
      var timestamp = DateTime.now().millisecond;
      headers["token"] = StringUtils.stringToMd5(
          "${config.clientSecret}${timestamp.toString()}");
      headers["timestamp"] = timestamp.toString();
    }

    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getEstacoes(),
        headerParams: headers,
        queryParams: query,
        converter: (json) => EstacaoTrabalho.listFromJson(json));
  }

  static Future<ResponsePws> listar(PWSConfig config, String token) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getEstacoes(),
        headerParams: {"token": token},
        converter: (json) => EstacaoTrabalho.listFromJson(json));
  }

  static Future<ResponsePws> listarSimplificado(PWSConfig config) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getEstacoesSimplificado(),
        headerParams: {"clientSecret": config.clientSecret},
        converter: (json) => EstacaoTrabalhoSimplificadoDTO.listFromJson(json));
  }

  static Future<ResponsePws> atualizarNome(
      PWSConfig config, num idEstacao, String nome) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.putEstacaoNome(),
      headerParams: {
        "clientSecret": config.clientSecret,
      },
      pathParams: {
        "{idEstacao}": idEstacao.toString(),
      },
      queryParams: {
        "nome": nome,
      },
    );
  }

  static Future<ResponsePws> preCadastro(PWSConfig config) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getPreCadastroEstacao(),
        headerParams: {
          "clientSecret": config.clientSecret,
        },
        converter: (json) => EstacaoPreCadastroDTO.fromJson(json));
  }

  static Future<ResponsePws> inserir(
      PWSConfig config, CadastroEstacaoTrabalhoDTO dto) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.postEstacoes(),
        headerParams: {
          "clientSecret": config.clientSecret,
        },
        body: dto.toJson(),
        converter: (json) => CadastroEstacaoTrabalhoDTO.fromJson(json));
  }

  static Future<ResponsePws> atualizarEstacao(PWSConfig config, String token,
      EstacaoTrabalhoDTO dto, int idEstacao) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.putAtualizarEstacao(),
        headerParams: {"token": token},
        pathParams: {"{idEstacao}": idEstacao.toString()},
        body: dto.toJson(),
        converter: (json) => EstacaoTrabalhoDTO.fromJson(json));
  }
}
