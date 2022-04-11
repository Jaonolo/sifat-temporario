part of openapi.api;

@JsonSerializable()
class BandeiraCartao {

  int? id;

  int? idEmpresa;

  Empresa? empresa;

  String? codigoBandeira;

  String? bandeira;

  String? descricao;

  String? operacao;

  //enum operacaoEnum {  DEBITO,  CREDITO,  VOUCHER,  };{

  String? tipoTransacao;

  //enum tipoTransacaoEnum {  TEF,  POS,  };{

  String? codificacaoFiscal = 'OUTROS';

  //enum codificacaoFiscalEnum {  VISA,  MASTERCARD,  AMERICAN_EXPRESS,  SOROCRED,  DINERS_CLUB,  ELO,  HIPERCARD,  AURA,  CABAL,  OUTROS,  };{

  @JsonKey(defaultValue: [])
  List<BandeiraCartaoDadosIntegracao> dadosIntegracao = [];

  int? versao;

  String? tipoTEF;

  bool? ativo;

  BandeiraCartao();

  @override
  String toString() {
    return 'BandeiraCartao[id=$id, idEmpresa=$idEmpresa, empresa=$empresa, codigoBandeira=$codigoBandeira, bandeira=$bandeira, descricao=$descricao, operacao=$operacao, tipoTransacao=$tipoTransacao, codificacaoFiscal=$codificacaoFiscal, dadosIntegracao=$dadosIntegracao, versao=$versao, ativo=$ativo, ]';
  }

  factory BandeiraCartao.fromJson(Map<String, dynamic> json) =>
      _$BandeiraCartaoFromJson(json);

  Map<String, dynamic> toJson() => _$BandeiraCartaoToJson(this);

  static List<BandeiraCartao> listFromJson(List<dynamic> json) {
    return json.map((value) => BandeiraCartao.fromJson(value)).toList();
  }

  static Map<String, BandeiraCartao> mapFromJson(Map<String, dynamic> json) {
    Map<String, BandeiraCartao> map = {};
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = BandeiraCartao.fromJson(value));
    }
    return map;
  }
}

