import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';

class NotaRequester {
  static Future<ResponsePws> cancelar(PWSConfig config, String token, Nota nota,
      String motivoCancelamento) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.putCancelarNota(),
        headerParams: {"token": token},
        pathParams: {"{idNota}": nota.id.toString()},
        queryParams: {"motivo": motivoCancelamento},
        converter: (json) => Nota.fromJson(json));
  }

  static Future<ResponsePws> calcularImpostos(
      PWSConfig config, String token, Nota nota,
      {String consumidorDocumento = "", String consumidorNome = ""}) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.putCalcularImpostosNota(),
        headerParams: {"token": token},
        pathParams: {"{idNota}": nota.id.toString()},
        queryParams: {
          if (consumidorDocumento.isNotEmpty)
            "documentoConsumidor": consumidorDocumento,
          if (consumidorNome.isNotEmpty) "nomeConsumidor": consumidorNome,
        },
        converter: (json) => NotaItem.listFromJson(json));
  }

  static Future<ResponsePws> montarNFCe(
      PWSConfig config, String token, Nota nota) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.putMontarNFCeNota(),
        headerParams: {"token": token},
        pathParams: {"{idNota}": nota.id.toString()},
        converter: (json) => Nota.fromJson(json));
  }

  static Future<ResponsePws> emitirNFCe(
      PWSConfig config, String token, Nota nota,
      {bool gerarImpressao = false}) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.putEmitirNFCeNota(),
        headerParams: {"token": token},
        pathParams: {"{idNota}": nota.id.toString()},
        queryParams: {"gerarImpressao": gerarImpressao},
        converter: (json) => XmlDTO.fromJson(json));
  }

  static Future<ResponsePws> cancelarNFCe(
      PWSConfig config, String token, Nota nota, String motivo,
      {bool gerarImpressao = false}) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.putCancelarNFCeNota(),
        headerParams: {"token": token},
        pathParams: {"{idNota}": nota.id.toString()},
        queryParams: {"motivo": motivo, "gerarImpressao": gerarImpressao},
        converter: (json) => XmlDTO.fromJson(json));
  }

  static Future<ResponsePws> gerarContingencia(
      PWSConfig config, String token, int idNota, bool segundaVia) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.gerarImpressao55mm(),
        headerParams: {"token": token},
        pathParams: {"{idNota}": idNota.toString()},
        queryParams: {"segundaVia": segundaVia},
        converter: (json) => XmlDTO.fromJson(json));
  }

  static Future<ResponsePws> espelho(
      PWSConfig config, String token, Nota nota, bool segundaVia) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getEspelho(),
        headerParams: {"token": token},
        pathParams: {"{idNota}": nota.id.toString()},
        queryParams: {"segundaVia": segundaVia},
        converter: (json) => XmlDTO.fromJson(json));
  }

  static Future<ResponsePws> statusServicoNFCe(
      PWSConfig config, String token) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getStatusServicoNFCe(),
        headerParams: {"token": token},
        converter: (json) => TRetConsStatServ.fromJson(json));
  }

  static Future<ResponsePws> inutilizarNFCe(PWSConfig config, String token,
      String numeroInicial, String numeroFinal, String motivo) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.putInutilizarNFCe(),
      headerParams: {
        "token": token,
      },
      queryParams: {
        "numeroInicial": numeroInicial,
        "numeroFinal": numeroFinal,
        "motivo": motivo,
      },
    );
  }

  static Future<ResponsePws> carregar(
      PWSConfig config, String token, num idNota) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getNota(),
        headerParams: {"token": token},
        pathParams: {"{idNota}": idNota.toString()},
        converter: (json) => Nota.fromJson(json));
  }

  static Future<ResponsePws> registrarDesconto(PWSConfig config, String token,
      int idNota, BigDecimal valorDesconto, String eventoNota) async {
    return await RequesterPws(config: config)
        .consome(urlPws: UrlPws.registrarDesconto(), headerParams: {
      "token": token,
    }, pathParams: {
      "{idNota}": idNota.toString(),
    }, queryParams: {
      "valorDesconto": valorDesconto,
      "EventoNota": eventoNota,
    });
  }

  static Future<ResponsePws> registrarAcrescimo(
      PWSConfig config, String token, int idNota, BigDecimal acrescimo) async {
    return await RequesterPws(config: config)
        .consome(urlPws: UrlPws.registrarAcrescimo(), headerParams: {
      "token": token,
    }, pathParams: {
      "{idNota}": idNota.toString(),
    }, queryParams: {
      "valorAcrescimo": acrescimo,
    });
  }

  static Future<ResponsePws> recebimentoParcial(
      PWSConfig config, String token, int idNotaOrigem) async {
    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.postRecebimentoParcial(),
        headerParams: {
          "token": token,
        },
        pathParams: {
          "{idNotaOrigem}": idNotaOrigem.toString(),
        },
        converter: (json) => Nota.fromJson(json));
  }

  static Future<ResponsePws> atualizarTipoEntrega(
      PWSConfig config,
      String token,
      int idNota,
      String tipoEntrega,
      BigDecimal valorFrete) async {
    return await RequesterPws(config: config)
        .consome(urlPws: UrlPws.putAtulizarTipoEntrega(), headerParams: {
      "token": token,
    }, pathParams: {
      "{idNota}": idNota.toString(),
    }, queryParams: {
      "tipoEntrega": tipoEntrega,
      "valorFrete": valorFrete,
    });
  }

  static Future<ResponsePws> atualizarCliente(PWSConfig config, String token,
      int idNota, int idCliente, int? idAutorizado) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.putAtualizarCliente(),
      headerParams: {
        "token": token,
      },
      pathParams: {
        "{idNota}": idNota.toString(),
      },
      queryParams: {
        "idCliente": idCliente.toString(),
        if (idAutorizado != null) "idAutorizado": idAutorizado.toString(),
      },
    );
  }

  static Future<ResponsePws> isentarServico(
    PWSConfig config,
    String token,
    int idNota,
  ) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.putIsentarServico(),
      headerParams: {
        "token": token,
      },
      pathParams: {
        "{idNota}": idNota.toString(),
      },
    );
  }

  static Future<ResponsePws> aplicaIsencaoTaxaEntrega(
    PWSConfig config,
    String token,
    int idNota,
  ) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.putIsentarFrete(),
      headerParams: {
        "token": token,
      },
      pathParams: {
        "{idNota}": idNota.toString(),
      },
    );
  }

  static Future<ResponsePws> carregarComFiltros(
    PWSConfig config,
    String token, {
    String dataInicialFormated = "",
    String dataFinalFormated = "",
    String idCaixa = "",
    String especie = "",
    String venda = "",
    String pedido = "",
    String notaFiscal = "",
    String cupom = "",
    String cliente = "",
    String produto = "",
    String tipoModulo = "",
    num? idTurno,
    List<String>? statusVenda,
    num? idEmissor,
  }) async {
    Map<String, dynamic> query = {};

    if (dataInicialFormated.isNotEmpty)
      query['dataInicial'] = dataInicialFormated;

    if (dataFinalFormated.isNotEmpty) query['dataFinal'] = dataFinalFormated;

    if (idCaixa.isNotEmpty) query['idCaixa'] = idCaixa;

    if (especie.isNotEmpty) query['operacao'] = especie;

    if (venda.isNotEmpty) query['numero_venda'] = venda;

    if (pedido.isNotEmpty) query['pedido'] = pedido;

    if (cliente.isNotEmpty) query['idCliente'] = cliente;

    if (produto.isNotEmpty) query['idProduto'] = produto;

    if (idTurno != null) query['idTurno'] = idTurno;

    if (tipoModulo.isNotEmpty) query['tipoModulo'] = tipoModulo;

    if (statusVenda != null && statusVenda.isNotEmpty)
      query['status'] = statusVenda;

    if (idEmissor != null) query['idEmissor'] = idEmissor;

    return await RequesterPws(config: config).consome(
        urlPws: UrlPws.getVendas(),
        headerParams: {"token": token},
        queryParams: query,
        converter: (json) => Nota.listFromJson(json));
  }

  static Future<ResponsePws> validarEmissaoNfce(
    PWSConfig config,
    String token,
    int idNota,
  ) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.putValidarEmissaoNFCe(),
      headerParams: {
        "token": token,
      },
      pathParams: {
        "{idNota}": idNota.toString(),
      },
    );
  }

  static Future<ResponsePws> liberarEmissorFiscal(
    PWSConfig config,
    String token,
    int idNota,
  ) async {
    return await RequesterPws(config: config).consome(
      urlPws: UrlPws.putLiberarEmissorFiscal(),
      headerParams: {
        "token": token,
      },
      pathParams: {
        "{idNota}": idNota.toString(),
      },
    );
  }
}
