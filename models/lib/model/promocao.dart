part of openapi.api;

@JsonSerializable()
class Promocao {
  int? id;

  int? idEmpresa;

  String? descricao;

  DateTime? dataCadastro;

  String? tipo;

  //enum tipoEnum {  LOJISTA,  REDE,  FORNECEDOR,  OUTROS,  };{

  String? modalidade;

  //enum modalidadeEnum {  PRECO_FIXO_UNIDADE,  PRECO_FIXO_PACOTE,  DESCONTO_VARIAVEL,  COMPRE_PAGUE,  };{

  String? periodicidade;

  //enum periodicidadeEnum {  PERIODO_DATA,  SEMANAL,  RELAMPAGO,  HAPPY_HOUR,  };{

  DateTime? dataInicial;

  DateTime? dataFinal;

  String? horaInicial;

  String? horaFinal;

  bool? segundaFeira;

  bool? tercaFeira;

  bool? quartaFeira;

  bool? quintaFeira;

  bool? sextaFeira;

  bool? sabado;

  bool? domingo;

  BigDecimal? percentualDesconto;

  BigDecimal? baseCalculoComissao;

  BigDecimal? valorPacote;

  BigDecimal? compreQuantidade;

  BigDecimal? pagueQuantidade;

  int? quantidadeMaximaItens;

  bool? custoDiferenciado;

  bool? suspensa;

  List<String> modulosWaiter = [];

  //enum modulosWaiterEnum {  GERAL,  MESA,  FICHA,  DELIVERY,  CARTAO,  BALCAO,  DRIVE_THRU,  };{
  Promocao();

  @override
  String toString() {
    return 'Promocao[id=$id, idEmpresa=$idEmpresa, descricao=$descricao, dataCadastro=$dataCadastro, tipo=$tipo, modalidade=$modalidade, periodicidade=$periodicidade, dataInicial=$dataInicial, dataFinal=$dataFinal, horaInicial=$horaInicial, horaFinal=$horaFinal, segundaFeira=$segundaFeira, tercaFeira=$tercaFeira, quartaFeira=$quartaFeira, quintaFeira=$quintaFeira, sextaFeira=$sextaFeira, sabado=$sabado, domingo=$domingo, percentualDesconto=$percentualDesconto, baseCalculoComissao=$baseCalculoComissao, valorPacote=$valorPacote, compreQuantidade=$compreQuantidade, pagueQuantidade=$pagueQuantidade, quantidadeMaximaItens=$quantidadeMaximaItens, custoDiferenciado=$custoDiferenciado, suspensa=$suspensa, modulosWaiter=$modulosWaiter, ]';
  }

  factory Promocao.fromJson(Map<String, dynamic> json) =>
      _$PromocaoFromJson(json);

  Map<String, dynamic> toJson() => _$PromocaoToJson(this);

  static List<Promocao> listFromJson(List<dynamic> json) {
    return json.map((value) => Promocao.fromJson(value)).toList();
  }

  static Map<String, Promocao> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Promocao>();
    if (json.isNotEmpty) {
      json.forEach(
              (String key, dynamic value) =>
          map[key] = Promocao.fromJson(value));
    }
    return map;
  }
}
