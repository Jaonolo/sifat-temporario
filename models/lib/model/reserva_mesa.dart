part of openapi.api;

@JsonSerializable()
class ReservaMesa {

  int? id;

  int? idEmpresa;

  int? idUsuario;

  int? mesa;

  DateTime? data;

  String? nome;

  int? pessoas;

  String? observacao;

  String? statusReserva;

  //enum statusReservaEnum {  PENDENTE,  CANCELADO,  CONCLUIDO,  };{
  ReservaMesa();

  @override
  String toString() {
    return 'ReservaMesa[id=$id, idEmpresa=$idEmpresa, idUsuario=$idUsuario, mesa=$mesa, data=$data, nome=$nome, pessoas=$pessoas, observacao=$observacao, statusReserva=$statusReserva, ]';
  }

  factory ReservaMesa.fromJson(Map<String, dynamic> json) =>
      _$ReservaMesaFromJson(json);

  Map<String, dynamic> toJson() => _$ReservaMesaToJson(this);

  static List<ReservaMesa> listFromJson(List<dynamic> json) {
    return json.map((value) => ReservaMesa.fromJson(value)).toList();
  }

  static Map<String, ReservaMesa> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, ReservaMesa>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = ReservaMesa.fromJson(value));
    }
    return map;
  }
}

