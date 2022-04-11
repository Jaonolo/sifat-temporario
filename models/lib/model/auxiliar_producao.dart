part of openapi.api;

@JsonSerializable()
class AuxiliarProducao {

  int? id;

  int? idEmpresa;

  int? idNota;

  Nota? nota;

  int? idEstacao;

  EstacaoTrabalho? estacao;

  int? idLocalProducao;

  LocalProducao? localProducao;

  String? modulo;

  //enum moduloEnum {  GERAL,  MESA,  FICHA,  DELIVERY,  CARTAO,  BALCAO,  DRIVE_THRU,  };{

  int? idUsuarioEmpresa;

  UsuarioEmpresa? usuarioEmpresa;

  bool? fechamento;

  String? mensagem;

  bool? impresso;

  DateTime? data;

  int? tentativasImpressao = 0;

  AuxiliarProducao();

  @override
  String toString() {
    return 'AuxiliarProducao[id=$id, idEmpresa=$idEmpresa, idNota=$idNota, nota=$nota, idEstacao=$idEstacao, estacao=$estacao, idLocalProducao=$idLocalProducao, localProducao=$localProducao, modulo=$modulo, usuarioEmpresa=$usuarioEmpresa, fechamento=$fechamento, mensagem=$mensagem, impresso=$impresso, data=$data, tentativasImpressao=$tentativasImpressao, ]';
  }

  factory AuxiliarProducao.fromJson(Map<String, dynamic> json) =>
      _$AuxiliarProducaoFromJson(json);

  Map<String, dynamic> toJson() => _$AuxiliarProducaoToJson(this);

  static List<AuxiliarProducao> listFromJson(List<dynamic> json) {
    return json.map((value) => AuxiliarProducao.fromJson(value)).toList();
  }

  static Map<String, AuxiliarProducao> mapFromJson(Map<String, dynamic> json) {
    Map<String, AuxiliarProducao> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = AuxiliarProducao.fromJson(value));
    }
    return map;
  }
}

