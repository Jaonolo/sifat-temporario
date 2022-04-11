part of openapi.api;

@JsonSerializable()
class ExtratoTurnoDTO {
  List<TotalFinalizadoraDTO>? vendasPorFormaDePagamento;

  List<OperacaoDTO>? suprimentos;

  List<OperacaoDTO>? sangrias;

  List<OperacaoDTO>? recebimentos;

  List<TurnoFechamentoDTO>? fechamentos;

  ExtratoTurnoDTO();

  @override
  String toString() {
    return 'ExtratoTurno{vendasPorFormaDePagamento: $vendasPorFormaDePagamento, suprimentos: $suprimentos, sangrias: $sangrias, recebimentos: $recebimentos, fechamentos: $fechamentos, }';
  }

  factory ExtratoTurnoDTO.fromJson(Map<String, dynamic> json) =>
      _$ExtratoTurnoDTOFromJson(json);

  Map<String, dynamic> toJson() => _$ExtratoTurnoDTOToJson(this);

  static List<ExtratoTurnoDTO> listFromJson(List<dynamic> json) {
    return json.map((value) => ExtratoTurnoDTO.fromJson(value)).toList();
  }

  static Map<String, ExtratoTurnoDTO> mapFromJson(Map<String, dynamic> json) {
    Map<String, ExtratoTurnoDTO> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ExtratoTurnoDTO.fromJson(value));
    }
    return map;
  }

  BigDecimal getSaldoCaixa() {
    BigDecimal saldo = BigDecimal.ZERO();
    for (TotalFinalizadoraDTO tf in getTotalFinalizadoras()) {
      saldo = saldo.somar(tf.total);
    }
    return saldo;
  }

  List<TotalFinalizadoraDTO> getTotalFinalizadoras() {
    List<TotalFinalizadoraDTO> totais = [];
    vendasPorFormaDePagamento!.forEach((e) {
      TotalFinalizadoraDTO totalFinalizadoraDTO = TotalFinalizadoraDTO();

      totalFinalizadoraDTO.idFinalizadora = e.idFinalizadora;
      totalFinalizadoraDTO.codigo = e.codigo;
      totalFinalizadoraDTO.descricao = e.descricao;
      totalFinalizadoraDTO.total = e.total;

      totais.add(totalFinalizadoraDTO);
    });

    //SANGRIA
    for (OperacaoDTO sangria in sangrias!) {
      TotalFinalizadoraDTO? first;
      if (totais.isNotEmpty) {
        first = totais
            .firstWhere((t) => t.idFinalizadora == sangria.idFinalizadora);
      }

      if (first != null) {
        first.total = first.total!.subtrair(sangria.valor);
      } else {
        TotalFinalizadoraDTO totalFinalizadoraDTO = TotalFinalizadoraDTO();

        totalFinalizadoraDTO.idFinalizadora = sangria.idFinalizadora;
        totalFinalizadoraDTO.codigo = sangria.codigo;
        totalFinalizadoraDTO.descricao = sangria.descricaoFinalizadora;
        totalFinalizadoraDTO.total =
            sangria.valor!.multiplicar(BigDecimal("-1"));

        totais.add(totalFinalizadoraDTO);
      }
    }

    //SUPRIMENTO
    for (OperacaoDTO suprimento in suprimentos!) {
      TotalFinalizadoraDTO? first;
      if (totais.length > 0) {
        first = totais
            .firstWhere((t) => t.idFinalizadora == suprimento.idFinalizadora);
      }

      if (first != null) {
        first.total = first.total!.somar(suprimento.valor);
      } else {
        TotalFinalizadoraDTO totalFinalizadoraDTO = TotalFinalizadoraDTO();

        totalFinalizadoraDTO.idFinalizadora = suprimento.idFinalizadora;
        totalFinalizadoraDTO.codigo = suprimento.codigo;
        totalFinalizadoraDTO.descricao = suprimento.descricaoFinalizadora;
        totalFinalizadoraDTO.total = suprimento.valor;

        totais.add(totalFinalizadoraDTO);
      }
    }

    //RECEBIMENTOS
    for (OperacaoDTO recebimento in recebimentos!) {
      TotalFinalizadoraDTO? first;
      if (totais.length > 0) {
        first = totais
            .firstWhere((t) => t.idFinalizadora == recebimento.idFinalizadora);
      }

      if (first != null) {
        first.total = first.total!.somar(recebimento.valor);
      } else {
        TotalFinalizadoraDTO totalFinalizadoraDTO = TotalFinalizadoraDTO();

        totalFinalizadoraDTO.idFinalizadora = recebimento.idFinalizadora;
        totalFinalizadoraDTO.codigo = recebimento.codigo;
        totalFinalizadoraDTO.descricao = recebimento.descricaoFinalizadora;
        totalFinalizadoraDTO.total = recebimento.valor;

        totais.add(totalFinalizadoraDTO);
      }
    }
    return totais;
  }
}