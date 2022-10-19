part of openapi.api;

@JsonSerializable()
class LoteControleCartao {
  int? id;

  int? idEmpresa;

  Empresa? empresa;

  DateTime? data;

  int? idUser;

  Usuario? user;

  String? observacao;

  String? tipoLoteControleCartao = "QUITACAO";

  //enum {DESMEMBRAMENTO, QUITACAO}

  @JsonKey(defaultValue: [])
  List<TransacaoCartao> transacoes = [];

  @JsonKey(defaultValue: [])
  List<Conta> titulosDesmembramento = [];

  @JsonKey(defaultValue: [])
  List<Conta> titulosQuitacao = [];

  LoteControleCartao();

  @override
  String toString() {
    return 'LoteControleCartao{id: $id, idEmpresa: $idEmpresa, empresa: $empresa, data: $data, idUser: $idUser, user: $user, observacao: $observacao, tipoLoteControleCartao: $tipoLoteControleCartao, transacoes: $transacoes, titulosDesmembramento: $titulosDesmembramento, titulosQuitacao: $titulosQuitacao}';
  }

  factory LoteControleCartao.fromJson(Map<String, dynamic> json) =>
      _$LoteControleCartaoFromJson(json);

  Map<String, dynamic> toJson() => _$LoteControleCartaoToJson(this);

  static List<LoteControleCartao> listFromJson(List<dynamic> json) {
    return json.map((value) => LoteControleCartao.fromJson(value)).toList();
  }

  static Map<String, LoteControleCartao> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, LoteControleCartao>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = LoteControleCartao.fromJson(value));
    }
    return map;
  }
}
