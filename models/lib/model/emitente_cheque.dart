part of openapi.api;

@JsonSerializable()
class EmitenteCheque {

  int? idPessoa;

  Pessoa? pessoa;

  BigDecimal? limite = BigDecimal.ZERO();

  String? observacao;

  StatusCredito? statusCredito;

  int? versao;

  ControleCadastro? controleCadastro;

  EmitenteCheque();

  @override
  String toString() {
    return 'EmitenteCheque[idPessoa=$idPessoa, pessoa=$pessoa, limite=$limite, observacao=$observacao, statusCredito=$statusCredito, versao=$versao, controleCadastro=$controleCadastro, ]';
  }

  factory EmitenteCheque.fromJson(Map<String, dynamic> json) =>
      _$EmitenteChequeFromJson(json);

  Map<String, dynamic> toJson() => _$EmitenteChequeToJson(this);

  static List<EmitenteCheque> listFromJson(List<dynamic> json) {
    return json.map((value) => EmitenteCheque.fromJson(value)).toList();
  }

  static Map<String, EmitenteCheque> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, EmitenteCheque>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = EmitenteCheque.fromJson(value));
    }
    return map;
  }
}

