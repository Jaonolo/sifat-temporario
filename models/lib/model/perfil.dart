part of openapi.api;

@JsonSerializable()
class Perfil {

  int? id;

  int? idEmpresa;

  String? descricao;

  String? checkIn;

  //enum checkInEnum {  SEM_CHECKIN,  CHECKIN_IDENTIFICADO,  CHECKIN_ANONIMO,  };{

  String? genero;

  //enum generoEnum {  FEMININO,  MASCULINO,  AMBOS,  OUTROS,  };{

  int? idadeMinima;

  BigDecimal? valorLimiteCartao = BigDecimal.ZERO();

  BigDecimal? valorConsumacao = BigDecimal.ZERO();

  BigDecimal? taxaEntrada = BigDecimal.ZERO();

  BigDecimal? percentualServico = BigDecimal.ZERO();

  ProdutoEmpresa? produtoServico;

  bool? cartaoPrePago;

  FinalizadoraEmpresa? finalizadoraEmpresaPrePago;

  bool? modoConsumoCumulativo;

  DateTime? validadeInicio;

  DateTime? validadeTermino;

  int? cartaoInicial;

  int? cartaoFinal;

  bool? informarPromoter;

  bool? ativo;

  Perfil();

  @override
  String toString() {
    return 'Perfil[id=$id, idEmpresa=$idEmpresa, descricao=$descricao, checkIn=$checkIn, genero=$genero, idadeMinima=$idadeMinima, valorLimiteCartao=$valorLimiteCartao, valorConsumacao=$valorConsumacao, taxaEntrada=$taxaEntrada, percentualServico=$percentualServico, produtoServico=$produtoServico, cartaoPrePago=$cartaoPrePago, finalizadoraEmpresaPrePago=$finalizadoraEmpresaPrePago, modoConsumoCumulativo=$modoConsumoCumulativo, validadeInicio=$validadeInicio, validadeTermino=$validadeTermino, cartaoInicial=$cartaoInicial, cartaoFinal=$cartaoFinal, informarPromoter=$informarPromoter, ativo=$ativo, ]';
  }

  factory Perfil.fromJson(Map<String, dynamic> json) => _$PerfilFromJson(json);

  Map<String, dynamic> toJson() => _$PerfilToJson(this);

  static List<Perfil> listFromJson(List<dynamic> json) {
    return json.map((value) => Perfil.fromJson(value)).toList();
  }

  static Map<String, Perfil> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Perfil>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Perfil.fromJson(value));
    }
    return map;
  }
}

