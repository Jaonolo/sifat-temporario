import 'package:models/model/enum/tipo_modulo.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/requester_pws.dart';
import 'package:requester/response/response_pws.dart';
import 'package:requester/url_pws/url_pws.dart';
import 'package:utils/utils/nota_item_utils.dart';
import 'package:http/http.dart' as http;

class ConsumoRequester {
  static Future<ResponsePws> buscar(PWSConfig config, String token,
      Nota nota) async {
    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getConsumo(),
      headerParams: {
        'token': token,
      },
      pathParams: {"{idNota}": nota.id.toString()},
    );
    return ResponsePws(
        response: response, converter: (json) => Nota.fromJson(json));
  }

  static Future<ResponsePws> buscarConsumos(PWSConfig config, String token,
      {List<Modulo>? modulos, int? comanda, bool validaToken = false}) async {
    Map<String, dynamic> query = {};

    if (modulos != null && modulos.isNotEmpty) {
      query['modulo'] = modulos.map((modulo) => modulo.tipo).toList();
    }

    if (comanda != null) query['comanda'] = comanda;

    if (validaToken) query['validaToken'] = validaToken;

    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getConsumos(),
      headerParams: {
        'token': token,
      },
      queryParams: query,
    );
    return ResponsePws(
        response: response, converter: (json) => Nota.listFromJson(json));
  }

  static Future<ResponsePws> buscarConsumosPorModulo(PWSConfig config,
      String token, Modulo modulo) async {
    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getConsumos(),
      headerParams: {
        'token': token,
      },
      queryParams: {"modulo": modulo.tipo},
    );
    return ResponsePws(
        response: response, converter: (json) => Nota.listFromJson(json));
  }

  static Future<ResponsePws> buscarAbertos(PWSConfig config, String token,
      List<Modulo> modulos) async {
    Map<String, dynamic> query = {
      "modulo": modulos.map((modulo) => modulo.tipo).toList(),
    };

    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getConsumosAbertos(),
      headerParams: {
        'token': token,
      },
      queryParams: query,
    );
    return ResponsePws(
        response: response,
        converter: (json) => MapaComandaDTO.listFromJson(json));
  }

  static Future<ResponsePws> inserir(PWSConfig config, String token,
      Nota nota) async {
    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.postConsumos(),
      headerParams: {"token": token},
      body: nota.toJson(),
    );
    return ResponsePws(
        response: response, converter: (json) => Nota.fromJson(json));
  }

  static Future<ResponsePws> confirmar(PWSConfig config, String token,
      Nota nota) async {
    http.Response response = await RequesterPws(config: config)
        .consome(urlPws: UrlPws.confirmarConsumo(), headerParams: {
      "token": token,
    }, pathParams: {
      "{idNota}": nota.id.toString()
    });

    return ResponsePws(
      response: response,
      converter: (json) => Nota.fromJson(json),
    );
  }

  static Future<ResponsePws> fechar(PWSConfig config, String token, Nota nota,
      bool permissaoLimiteUltrapassado) async {
    Map<String, dynamic> query = {"idNota": nota.id};
    query['permissao-limite-ultrapassado'] = permissaoLimiteUltrapassado;

    if (nota.consumo!.pessoas != null && nota.consumo!.pessoas! > 0)
      query['numeroPessoas'] = nota.consumo!.pessoas;

    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.fecharConsumo(),
      headerParams: {
        "token": token,
      },
      queryParams: query,
      body: nota.toJson(),
    );

    return ResponsePws(
      response: response,
      converter: (json) => Nota.fromJson(json),
    );
  }

  static Future<ResponsePws> reabrir(PWSConfig config, String token,
      Nota nota) async {
    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.reabrirConsumo(),
      headerParams: {
        "token": token,
      },
      pathParams: {
        "{idNota}": nota.id.toString(),
      },
    );

    return ResponsePws(
      response: response,
      converter: (json) => Nota.fromJson(json),
    );
  }

  static Future<ResponsePws> cancelar(PWSConfig config, String token,
      Nota nota) async {
    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.cancelarConsumo(),
      headerParams: {
        "token": token,
      },
      pathParams: {"{idNota}": nota.id.toString()},
      body: nota.toJson(),
    );

    return ResponsePws(
      response: response,
      converter: (json) => Nota.fromJson(json),
    );
  }

  static Future<ResponsePws> inserirObservacao(PWSConfig config, String token,
      Nota nota) async {
    http.Response response = await RequesterPws(config: config)
        .consome(urlPws: UrlPws.putObservacaoConsumo(), headerParams: {
      "token": token,
    }, pathParams: {
      "{idNota}": nota.id.toString()
    }, queryParams: {
      "observacao": nota.consumo!.observacao
    });

    return ResponsePws(
      response: response,
      converter: (json) => Nota.fromJson(json),
    );
  }

  static Future<ResponsePws> receber(PWSConfig config,
      String token,
      Nota nota, bool permissaoLimiteUltrapassado) async {
    http.Response response = await RequesterPws(config: config).consome(
        urlPws: UrlPws.receberConsumo(),
        headerParams: {"token": token},
        pathParams: {"{idNota}": nota.id.toString()},
        queryParams: {
          "permissao-limite-ultrapassado": permissaoLimiteUltrapassado
        },
        body: nota.toJson());
    return ResponsePws(
        response: response, converter: (json) => Nota.fromJson(json));
  }

  static Future<ResponsePws> receberParcial(PWSConfig config,
      String token,
      Nota nota,
      RecebimentoParcial recebimentoParcial,) async {
    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.receberConsumoParcial(),
      headerParams: {
        "token": token,
      },
      pathParams: {
        "{idNota}": nota.id.toString(),
      },
      body: recebimentoParcial.toJson(),
    );
    return ResponsePws(
        response: response,
        converter: (json) => RecebimentoParcial.fromJson(json));
  }

  static Future<ResponsePws> buscarItens(PWSConfig config, String token,
      int idNota,
      {bool somenteConsulta = false}) async {
    http.Response response = await RequesterPws(config: config)
        .consome(urlPws: UrlPws.getItensConsumo(), headerParams: {
      "token": token,
    }, pathParams: {
      "{idNota}": idNota.toString(),
    }, queryParams: {
      "consulta": somenteConsulta
    });
    return ResponsePws(
        response: response, converter: (json) => NotaItem.listFromJson(json));
  }

  static Future<ResponsePws> inserirItem(PWSConfig config, String token,
      NotaItem notaItem) async {
    notaItem = NotaItemUtils.preparaSerializacao(notaItem);

    http.Response response = await RequesterPws(config: config)
        .consome(urlPws: UrlPws.postItensConsumo(), headerParams: {
      "token": token,
    }, pathParams: {
      "{idNota}": notaItem.idNota.toString(),
    }, body: [
      notaItem.toJson()
    ]);
    return ResponsePws(
        response: response, converter: (json) => NotaItem.listFromJson(json));
  }

  static Future<ResponsePws> inserirItens(PWSConfig config, String token,
      List<NotaItem> listItens) async {
    listItens.forEach((item) {
      item = NotaItemUtils.preparaSerializacao(item);
    });

    http.Response response = await RequesterPws(config: config).consome(
        urlPws: UrlPws.postItensConsumo(),
        headerParams: {
          "token": token,
        },
        pathParams: {
          "{idNota}": listItens[0].idNota.toString(),
        },
        body: listItens.map((e) => e.toJson()).toList());
    return ResponsePws(
        response: response, converter: (json) => NotaItem.listFromJson(json));
  }

  static Future<ResponsePws> atualizarItem(PWSConfig config, String token,
      NotaItem notaItem) async {
    notaItem = NotaItemUtils.preparaSerializacao(notaItem);

    http.Response response = await RequesterPws(config: config)
        .consome(urlPws: UrlPws.putItensConsumo(), headerParams: {
      "token": token,
    }, pathParams: {
      "{idNota}": notaItem.idNota.toString(),
    }, body: [
      notaItem.toJson()
    ]);
    return ResponsePws(
        response: response, converter: (json) => NotaItem.listFromJson(json));
  }

  static Future<ResponsePws> cancelarItens(PWSConfig config,
      String token,
      List<NotaItem> itens, {
        String motivo = "",
      }) async {
    Map<String, dynamic> query = {
      "itens": itens.map((item) => item.consumoItem!.id).toList()
    };

    if (motivo != "") query['motivo'] = motivo;

    http.Response response = await RequesterPws(config: config).consome(
        urlPws: UrlPws.cancelarItensConsumo(),
        headerParams: {
          "token": token,
        },
        pathParams: {
          "{idNota}": itens[0].idNota.toString(),
        },
        queryParams: query);
    return ResponsePws(
        response: response, converter: (json) => NotaItem.listFromJson(json));
  }

  static Future<ResponsePws> mensagemProducao(PWSConfig config,
      String token,
      AuxiliarProducao aux,) async {
    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.postMensagemProducao(),
      headerParams: {
        "token": token,
      },
      body: aux.toJson(),
    );
    return ResponsePws(response: response);
  }

  static Future<ResponsePws> solicitarImpressao(PWSConfig config,
      String token,
      AuxiliarProducao aux,) async {
    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.postSolicitarImpressao(),
      headerParams: {
        "token": token,
      },
      pathParams: {
        "{idNota}": aux.idNota.toString(),
      },
      body: aux.toJson(),
    );
    return ResponsePws(response: response);
  }

  static Future<ResponsePws> checkout(PWSConfig config,
      String token,
      Modulo modulo,
      String comanda,) async {
    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.checkout(),
      headerParams: {
        "token": token,
      },
      queryParams: {
        "modulo": modulo.tipo,
        "comanda": comanda,
      },
    );
    return ResponsePws(
        response: response, converter: (json) => PwsAlert.fromJson(json));
  }

  static Future<ResponsePws> juntarComandas(PWSConfig config, String token,
      int idNota, List<int> comandas) async {
    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.putJuntarComanda(),
      headerParams: {
        "token": token,
      },
      pathParams: {
        "{idNota}": idNota.toString(),
      },
      queryParams: {
        "comandas": comandas,
      },
    );
    return ResponsePws(
        response: response, converter: (json) => PwsAlert.fromJson(json));
  }

  static Future<ResponsePws> desbloquearFicha(PWSConfig config, String token,
      int comanda) async {
    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.putDesbloquearFicha(),
      headerParams: {
        "token": token,
      },
      queryParams: {
        "ficha": comanda.toString(),
      },
    );
    return ResponsePws(
        response: response, converter: (json) => PwsAlert.fromJson(json));
  }

  static Future<ResponsePws> transferirItens(PWSConfig config, String token,
      int idNota, List<NotaItem> itens, int comandaDestino,
      String modulo) async {
    List body = [];

    itens.forEach((element) {
      element = NotaItemUtils.preparaSerializacao(element);
    });

    itens.forEach((element) {
      body.add(element.toJson());
    });

    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.putTranferirItens(),
      headerParams: {
        "token": token,
      },
      pathParams: {
        '{idNota}': idNota.toString(),
        '{comandaDestino}': comandaDestino.toString(),
      },
      queryParams: {
        'modulo': modulo,
      },
      body: body,
    );
    return ResponsePws(
        response: response, converter: (json) => NotaItem.listFromJson(json));
  }

  static Future<ResponsePws> preDesconto(PWSConfig config, String token,
      int idNota, String tipoDesconto, BigDecimal valor) async {
    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.putPreDesconto(),
      headerParams: {
        "token": token,
      },
      pathParams: {
        '{idNota}': idNota.toString(),
      },
      queryParams: {
        'tipoDesconto': tipoDesconto,
        'valor': valor.toStringAsFixed(2)
      },
    );
    return ResponsePws(
        response: response, converter: (json) => Nota.fromJson(json));
  }

  static Future<ResponsePws> deletarConsumo(PWSConfig config, String token,
      int idNota) async {
    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.deleteConsumo(),
      headerParams: {
        "token": token,
      },
      pathParams: {"{idNota}": idNota.toString()},
    );
    return ResponsePws(response: response);
  }

  static Future<ResponsePws> cancelarExpedicao(PWSConfig config, String token,
      int idNota) async {
    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.deleteCancelarExpedicao(),
      headerParams: {
        "token": token,
      },
      pathParams: {"{idConsumo}": idNota.toString()},
    );
    return ResponsePws(response: response);
  }

  static Future<ResponsePws> expedirConsumo(PWSConfig config, String token,
      List<Nota> listNota) async {
    List body = [];
    listNota.forEach((element) {
      body.add(element.toJson());
    });

    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.putExpedirPedidos(),
      headerParams: {
        "token": token,
      },
      body: body,
    );

    return ResponsePws(
        response: response, converter: (json) => Nota.listFromJson(json));
  }

  static Future<ResponsePws> receberEntregador(PWSConfig config, String token,
      List<Nota> listNota, int idEntregador) async {
    List body = [];
    listNota.forEach((element) {
      body.add(element.toJson());
    });
    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.putReceberEntregador(),
      headerParams: {
        "token": token,
      },
      pathParams: {
        "{idEntregador}": idEntregador.toString(),
      },
      body: body,
    );
    return ResponsePws(response: response);
  }

  static Future<ResponsePws> carregarUltimoPedido(PWSConfig config,
      String token, int? idClient, String tipoModulo) async {
    http.Response response = await RequesterPws(config: config)
        .consome(urlPws: UrlPws.getUltimoPedido(), headerParams: {
      "token": token,
    }, queryParams: {
      if(idClient != null)
        "idCliente": idClient.toString(),
      "modulo": tipoModulo,
    });
    return ResponsePws(
        response: response, converter: (json) => Nota.fromJson(json));
  }

  //V2
  static Future<ResponsePws> liberarComandas(PWSConfig config,
      String token) async {
    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.putLiberarComandas(),
      headerParams: {
        "token": token,
      },
    );
    return ResponsePws(response: response);
  }

  static Future<ResponsePws> buscarRecebidasPorModulos(PWSConfig config,
      String token,
      bool isEntregue,
      int limit,
      int offSet,
      List<TipoModulo> modulos) async {
    Map<String, dynamic> query = {
      "isEntregue": isEntregue,
      "modulos": modulos.map((modulo) => modulo.name).toList(),
    };

    http.Response response = await RequesterPws(config: config).consome(
      urlPws: UrlPws.getRecebidasBalcao(),
      headerParams: {"token": token},
      queryParams: query,
    );

    return ResponsePws(
        response: response, converter: (json) => Nota.listFromJson(json));
  }

  static Future<ResponsePws> marcarEntregue(PWSConfig config, String token,
      String idNota) async {
    http.Response response = await RequesterPws(config: config).consome(
        urlPws: UrlPws.putMarcarEntregue(),
        headerParams: {"token": token},
        pathParams: {"{idNota}": idNota});
    return ResponsePws(
        response: response, converter: (json) => Nota.fromJson(json));
  }
}
