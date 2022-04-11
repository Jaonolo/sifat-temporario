part of openapi.api;

@JsonSerializable()
class Turno {

  int? id;

  int? idEmpresa;

  int? idCaixa;

  EstacaoTrabalho? caixa;

  Movimento? movimento;

  String? chave;

  Usuario? usuario;

  String? status;

  //enum statusEnum {  ABERTO,  FECHADO,  CONFERIDO,  };{

  DateTime? dataAbertura;

  DateTime? dataFechamento;

  DateTime? dataConferencia;

  String? observacao;

  BigDecimal? valorDiferenca = BigDecimal.ZERO();

  int? sequencia;

  int? idConcentrador;

  List<TurnoFechamento> fechamentos = [];

  Turno();

  @override
  String toString() {
    return 'Turno[id=$id, idEmpresa=$idEmpresa, idCaixa=$idCaixa, caixa=$caixa, movimento=$movimento, chave=$chave, usuario=$usuario, status=$status, dataAbertura=$dataAbertura, dataFechamento=$dataFechamento, dataConferencia=$dataConferencia, observacao=$observacao, valorDiferenca=$valorDiferenca, sequencia=$sequencia, idConcentrador=$idConcentrador, fechamentos=$fechamentos, ]';
  }

  factory Turno.fromJson(Map<String, dynamic> json) => _$TurnoFromJson(json);

  Map<String, dynamic> toJson() => _$TurnoToJson(this);

  static List<Turno> listFromJson(List<dynamic> json) {
    return json.map((value) => Turno.fromJson(value)).toList();
  }

  static Map<String, Turno> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Turno>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Turno.fromJson(value));
    }
    return map;
  }
}

