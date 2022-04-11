part of openapi.api;

@JsonSerializable()
class Participante {
  String? cpfCnpjParticipante;

  List<ParticipanteTelefone> telefones = [];

  String? email;

  String? nome;

  BigDecimal? saldoDisponivelPontos = BigDecimal.ZERO();

  BigDecimal? saldoDisponivelValor = BigDecimal.ZERO();

  Participante();

  @override
  String toString() {
    return 'Participante[cpfCnpjParticipante=$cpfCnpjParticipante, telefones=$telefones, email=$email, nome=$nome, saldoDisponivelPontos=$saldoDisponivelPontos, saldoDisponivelValor=$saldoDisponivelValor, ]';
  }

  factory Participante.fromJson(Map<String, dynamic> json) =>
      _$ParticipanteFromJson(json);

  Map<String, dynamic> toJson() => _$ParticipanteToJson(this);

  static List<Participante> listFromJson(List<dynamic> json) {
    return json.map((value) => Participante.fromJson(value)).toList();
  }

  static Map<String, Participante> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Participante>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Participante.fromJson(value));
    }
    return map;
  }
}
