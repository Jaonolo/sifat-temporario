part of openapi.api;

@JsonSerializable()
class Consumo {

  int? id;

  String? modulo;

  //enum moduloEnum {  GERAL,  MESA,  FICHA,  DELIVERY,  CARTAO,  BALCAO,  DRIVE_THRU,  AUTOATENDIMENTO,  };{

  DateTime? dataAbertura;

  DateTime? dataAtualizacao;

  DateTime? dataFechamento;

  DateTime? dataEntrega;

  int? comanda;

  String? senhaAtendimento;

  int? pessoas;

  String? observacao;

  int? mesa;

  String tipoDesconto = "NENHUM";

  //enum tipoDescontoEnum {  NENHUM,  VALOR,  PORCENTAGEM,  };{

  BigDecimal preDesconto = BigDecimal.ZERO();

  @JsonKey(defaultValue: [])
  List<Consumo> consumosJuntados = [];

  int? idConsumoOrigemRecebimento;

  @JsonKey(defaultValue: [])
  List<Consumo> consumosOrigemRecebimentos = [];

  Evento? evento;

  Perfil? perfil;

  Funcionario? promoter;

  BigDecimal? limite;

  String? tipoEntrega;

  //enum tipoEntregaEnum {  NENHUM,  COMUM,  RETIRADA_LOCAL,  };{

  bool? entregue;

  Consumo();

  @override
  String toString() {
    return 'Consumo[id=$id, modulo=$modulo, dataAbertura=$dataAbertura, dataAtualizacao=$dataAtualizacao, dataFechamento=$dataFechamento, dataEntrega$dataEntrega, comanda=$comanda, senhaAtendimento=$senhaAtendimento, pessoas=$pessoas, observacao=$observacao, mesa=$mesa, tipoDesconto=$tipoDesconto, preDesconto=$preDesconto, consumosJuntados=$consumosJuntados, idConsumoOrigemRecebimento=$idConsumoOrigemRecebimento, consumosOrigemRecebimentos=$consumosOrigemRecebimentos, evento=$evento, perfil=$perfil, promoter=$promoter, limite=$limite, tipoEntrega=$tipoEntrega, entregue=$entregue, ]';
  }

  factory Consumo.fromJson(Map<String, dynamic> json) =>
      _$ConsumoFromJson(json);

  Map<String, dynamic> toJson() => _$ConsumoToJson(this);

  static List<Consumo> listFromJson(List<dynamic> json) {
    return json.map((value) => Consumo.fromJson(value)).toList();
  }

  static Map<String, Consumo> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Consumo>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Consumo.fromJson(value));
    }
    return map;
  }

  String get txtModulo {
    switch (this.modulo) {
      case "GERAL":
        return "Geral";
      case "MESA":
        return "MESA";
      case "FICHA":
        return "FICHA";
      case "DELIVERY":
        return "DELIVERY";
      case "CARTAO":
        return "CARTÃO";
      case "BALCAO":
        return "BALCÃO";
      case "DRIVE_THRU":
        return "DRIVE-THRU";
      case "AUTOATENDIMENTO":
        return "AUTOATENDIMENTO";
      default:
        return " ";
    }
  }
}

