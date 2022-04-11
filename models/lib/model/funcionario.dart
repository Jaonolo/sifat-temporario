part of openapi.api;

@JsonSerializable()
class Funcionario {

  int? id;

  int? idPessoa;

  Pessoa? pessoa;

  int? idEmpresa;

  String? numeroPis;

  String? numeroCtps;

  Setor? setor;

  Regiao? regiaoTrabalho;

  String? localTrabalho;

  //enum localTrabalhoEnum {  Interno,  Externo,  WEB,  };{

  String? cargo;

  BigDecimal? valorPisoSalarial = BigDecimal.ZERO();

  BigDecimal? valorSalario = BigDecimal.ZERO();

  BigDecimal? valorTransporte = BigDecimal.ZERO();

  BigDecimal? valorTicket = BigDecimal.ZERO();

  BigDecimal? valorSeguro = BigDecimal.ZERO();

  BigDecimal? valorRendimentos = BigDecimal.ZERO();

  BigDecimal? valorContribuicoes = BigDecimal.ZERO();

  BigDecimal? valorDescontos = BigDecimal.ZERO();

  BigDecimal? percentualAdiantamento;

  int? numeroDependentes;

  DateTime? dataAdmissao;

  DateTime? dataDemissao;

  String? motivoDemissao;

  String? observacao;

  bool? tecnico;

  bool? motorista;

  bool? auxiliarMotorista;

  bool? montador;

  bool? entregador;

  bool? promoter;

  bool? vendedor;

  String? historico;

  int? versao;

  ControleCadastro? controleCadastro;

  Vendedor? dadosVendedor;

  Funcionario();

  @override
  String toString() {
    return 'Funcionario[id=$id, idPessoa=$idPessoa, pessoa=$pessoa, idEmpresa=$idEmpresa, numeroPis=$numeroPis, numeroCtps=$numeroCtps, setor=$setor, regiaoTrabalho=$regiaoTrabalho, localTrabalho=$localTrabalho, cargo=$cargo, valorPisoSalarial=$valorPisoSalarial, valorSalario=$valorSalario, valorTransporte=$valorTransporte, valorTicket=$valorTicket, valorSeguro=$valorSeguro, valorRendimentos=$valorRendimentos, valorContribuicoes=$valorContribuicoes, valorDescontos=$valorDescontos, percentualAdiantamento=$percentualAdiantamento, numeroDependentes=$numeroDependentes, dataAdmissao=$dataAdmissao, dataDemissao=$dataDemissao, motivoDemissao=$motivoDemissao, observacao=$observacao, tecnico=$tecnico, motorista=$motorista, auxiliarMotorista=$auxiliarMotorista, montador=$montador, entregador=$entregador, promoter=$promoter, vendedor=$vendedor, historico=$historico, versao=$versao, controleCadastro=$controleCadastro, dadosVendedor=$dadosVendedor, ]';
  }

  factory Funcionario.fromJson(Map<String, dynamic> json) =>
      _$FuncionarioFromJson(json);

  Map<String, dynamic> toJson() => _$FuncionarioToJson(this);

  static List<Funcionario> listFromJson(List<dynamic> json) {
    return json.map((value) => Funcionario.fromJson(value)).toList();
  }

  static Map<String, Funcionario> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Funcionario>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = Funcionario.fromJson(value));
    }
    return map;
  }
}

