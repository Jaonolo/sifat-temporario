part of openapi.api;

@JsonSerializable()
class ContaCorrente {

  int? id;

  int? idEmpresa;

  Empresa? empresa;

  String? nome;

  bool? interna;

  String? agencia;

  String? agenciaDigito;

  String? conta;

  String? contaDigito;

  bool? ativo;

  int? idBanco;

  Banco? banco;

  BigDecimal? saldo = BigDecimal.ZERO();

  bool? padrao;

  int? versao;

  ContaCorrente();

  @override
  String toString() {
    return 'ContaCorrente[id=$id, idEmpresa=$idEmpresa, empresa=$empresa, nome=$nome, interna=$interna, agencia=$agencia, agenciaDigito=$agenciaDigito, conta=$conta, contaDigito=$contaDigito, ativo=$ativo, idBanco=$idBanco, banco=$banco, saldo=$saldo, padrao=$padrao, versao=$versao, ]';
  }

  factory ContaCorrente.fromJson(Map<String, dynamic> json) =>
      _$ContaCorrenteFromJson(json);

  Map<String, dynamic> toJson() => _$ContaCorrenteToJson(this);

  static List<ContaCorrente> listFromJson(List<dynamic> json) {
    return json.map((value) => ContaCorrente.fromJson(value)).toList();
  }

  static Map<String, ContaCorrente> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ContaCorrente>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ContaCorrente.fromJson(value));
    }
    return map;
  }
}

