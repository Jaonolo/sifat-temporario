part of openapi.api;

@JsonSerializable()
class ModuloMapeamento {

  int? id;

  int? idModulo;

  int? posicao;

  int? lugares;

  int? praca;

  BigDecimal? taxaServico = BigDecimal.ZERO();

  String? observacao;

  int? assentoInicial;

  int? assentoFinal;

  int? nfc;

  bool? informaMesa;

  bool? informaAssento;

  bool? ativa;

  ModuloMapeamento();

  @override
  String toString() {
    return 'ModuloMapeamento[id=$id, idModulo=$idModulo, posicao=$posicao, lugares=$lugares, praca=$praca, taxaServico=$taxaServico, observacao=$observacao, assentoInicial=$assentoInicial, assentoFinal=$assentoFinal, nfc=$nfc, informaMesa=$informaMesa, informaAssento=$informaAssento, ativa=$ativa, ]';
  }

  factory ModuloMapeamento.fromJson(Map<String, dynamic> json) =>
      _$ModuloMapeamentoFromJson(json);

  Map<String, dynamic> toJson() => _$ModuloMapeamentoToJson(this);

  static List<ModuloMapeamento> listFromJson(List<dynamic> json) {
    return json.map((value) => ModuloMapeamento.fromJson(value)).toList();
  }

  static Map<String, ModuloMapeamento> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ModuloMapeamento>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ModuloMapeamento.fromJson(value));
    }
    return map;
  }
}

