part of openapi.api;

class GrupoImpressora {

  int? id;

  int? idGrupo;

  String? modulo;

  //enum moduloEnum {  GERAL,  MESA,  FICHA,  DELIVERY,  CARTAO,  BALCAO,  DRIVE_THRU,  };{

  String? relatorio;

  //enum relatorioEnum {  NENHUM,  TICKET_VENDA,  TICKET_VENDA_COPIA,  COMPROVANTE_RECEBIMENTO,  CONFERENCIA_CAIXA,  FICHA_ENCERRAMENTO,  EXTRATO_CLIENTE,  DAV_PEDIDO,  DAV_ORCAMENTO,  DANFE_NFCE,  };{

  LocalProducao? localProducao;

  EquipamentoImpressao? impressora;

  EquipamentoImpressao? impressoraRedirecionamento;

  GrupoImpressora();

  @override
  String toString() {
    return 'GrupoImpressora[id=$id, idGrupo=$idGrupo, modulo=$modulo, relatorio=$relatorio, localProducao=$localProducao, impressora=$impressora, impressoraRedirecionamento=$impressoraRedirecionamento, ]';
  }

  GrupoImpressora.fromJson(Map<String, dynamic> json) {
    if (json['id'] == null) {
      id = null;
    } else {
      id = json['id'];
    }
    if (json['idGrupo'] == null) {
      idGrupo = null;
    } else {
      idGrupo = json['idGrupo'];
    }
    if (json['modulo'] == null) {
      modulo = null;
    } else {
      modulo = json['modulo'];
    }
    if (json['relatorio'] == null) {
      relatorio = null;
    } else {
      relatorio = json['relatorio'];
    }
    if (json['localProducao'] == null) {
      localProducao = null;
    } else {
      localProducao = LocalProducao.fromJson(json['localProducao']);
    }
    if (json['impressora'] == null) {
      impressora = null;
    } else {
      impressora = EquipamentoImpressao.fromJson(json['impressora']);
    }
    if (json['impressoraRedirecionamento'] == null) {
      impressoraRedirecionamento = null;
    } else {
      impressoraRedirecionamento =
          EquipamentoImpressao.fromJson(json['impressoraRedirecionamento']);
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (id != null)
      json['id'] = id;
    if (idGrupo != null)
      json['idGrupo'] = idGrupo;
    if (modulo != null)
      json['modulo'] = modulo;
    if (relatorio != null)
      json['relatorio'] = relatorio;
    if (localProducao != null)
      json['localProducao'] = localProducao;
    if (impressora != null)
      json['impressora'] = impressora;
    if (impressoraRedirecionamento != null)
      json['impressoraRedirecionamento'] = impressoraRedirecionamento;
    return json;
  }

  static List<GrupoImpressora> listFromJson(List<dynamic> json) {
    return json.map((value) => GrupoImpressora.fromJson(value)).toList();
  }

  static Map<String, GrupoImpressora> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, GrupoImpressora>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = GrupoImpressora.fromJson(value));
    }
    return map;
  }
}

