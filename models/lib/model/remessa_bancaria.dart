part of openapi.api;

@JsonSerializable()
class RemessaBancaria {
  int? id;

  int? idEmpresa;

  Empresa? empresa;

  int? idContaCorrente;

  ContaCorrente? contaCorrente;

  int? idContaCorrenteCarteira;

  ContaCorrenteCarteira? contaCorrenteCarteira;

  int? sequencia = 1;

  String? tipoRemessa = "REMESSA";

  //enum {REMESSA ,  RETORNO}

  DateTime? data;

  @JsonKey(defaultValue: [])
  List<Conta> contas = [];

  RemessaBancaria();

  @override
  String toString() {
    return 'RemessaBancaria{id: $id, idEmpresa: $idEmpresa, empresa: $empresa, idContaCorrente: $idContaCorrente, contaCorrente: $contaCorrente, idContaCorrenteCarteira: $idContaCorrenteCarteira, contaCorrenteCarteira: $contaCorrenteCarteira, sequencia: $sequencia, tipoRemessa: $tipoRemessa, data: $data, contas: $contas}';
  }

  factory RemessaBancaria.fromJson(Map<String, dynamic> json) =>
      _$RemessaBancariaFromJson(json);

  Map<String, dynamic> toJson() => _$RemessaBancariaToJson(this);

  static List<RemessaBancaria> listFromJson(List<dynamic> json) {
    return json.map((value) => RemessaBancaria.fromJson(value)).toList();
  }

  static Map<String, RemessaBancaria> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, RemessaBancaria>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = RemessaBancaria.fromJson(value));
    }
    return map;
  }
}
