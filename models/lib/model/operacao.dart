part of openapi.api;

@JsonSerializable()
class Operacao {

  int? id;

  int? idEmpresa;

  String? tipo;

  //enum tipoEnum {  SANGRIA,  SUPRIMENTO,  RECEBIMENTO,  };{

  DateTime? data;

  BigDecimal? valor = BigDecimal.ZERO();

  Turno? turno;

  Cliente? cliente;

  String? favorecido;

  @JsonKey(defaultValue: [])
  List<OperacaoFinalizadora> finalizadoras = [];

  int? idConcentrador;

  String? historico;

  ClienteConta? clienteConta;

  int? idNota;

  Nota? nota;

  int? idUsuarioAlteracaoManual;

  Usuario? usuarioAlteracaoManual;

  int? idOrigemDaOperacao;

  Operacao? origemDaOperacao;

  bool? cancelado;

  bool? conferido;

  Operacao();

  @override
  String toString() {
    return 'Operacao[id=$id, idEmpresa=$idEmpresa, tipo=$tipo, data=$data, valor=$valor, turno=$turno, cliente=$cliente, favorecido=$favorecido, finalizadoras=$finalizadoras, idConcentrador=$idConcentrador, historico=$historico, clienteConta=$clienteConta,idNota=$idNota,Nota=$nota,idUsuarioAlteracaoManual=$idUsuarioAlteracaoManual,User=$usuarioAlteracaoManual,idOrigemDaOperacao=$idOrigemDaOperacao,Operacao=$origemDaOperacao,cancelado=$cancelado,conferido=$conferido,]';
  }

  factory Operacao.fromJson(Map<String, dynamic> json) =>
      _$OperacaoFromJson(json);

  Map<String, dynamic> toJson() => _$OperacaoToJson(this);

  static List<Operacao> listFromJson(List<dynamic> json) {
    return json.map((value) => Operacao.fromJson(value)).toList();
  }

  static Map<String, Operacao> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Operacao>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Operacao.fromJson(value));
    }
    return map;
  }
}

