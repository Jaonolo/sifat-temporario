part of openapi.api;

@JsonSerializable()
class Conta {
  int? id;

  int? idEmpresa;

  Empresa? empresa;

  int? idPessoa;

  Pessoa? pessoa;

  String? descricao;

  String? observacao;

  String? codigo;

  String? numeroDocumento;

  DateTime? dataLancamento;

  DateTime? dataEmissao;

  DateTime? dataCompetencia;

  DateTime? dataVencimento;

  int? idBanco;

  Banco? banco;

  int? numeroParcelas = 1;

  String? parcela;

  BigDecimal? descontoAntecipacao = BigDecimal.ZERO();

  BigDecimal? multaAtraso = BigDecimal.ZERO();

  BigDecimal? jurosDiario = BigDecimal.ZERO();

  BigDecimal? valor = BigDecimal.ZERO();

  BigDecimal? desconto = BigDecimal.ZERO();

  BigDecimal? jurosMulta = BigDecimal.ZERO();

  String? tipoConta;

  DateTime? dataPagamento;

  BigDecimal? valorPago = BigDecimal.ZERO();

  int? idFinalizadora;

  Finalizadora? finalizadora;

  int? idContaCorrente;

  ContaCorrente? contaCorrente;

  int? idContaCorrenteCarteira;

  ContaCorrenteCarteira? contaCorrenteCarteira;

  int? nossoNumero;

  int? idContaOrigem;

  Conta? contaOrigem;

  List<Conta>? pagamentosParciais;

  bool? transferencia;

  bool? automatico;

  bool? pago;

  bool? parcial;

  bool? cancelado;

  List<ContaClassificacao> classificacoes = [];

  List<ContaCentroCusto> centroCustos = [];

  int? idNota;

  int? idContaLote;

  Contalote? contaLote;

  Nota? nota;

  int? idClienteFatura;

  ClienteFatura? clienteFatura;

  int? idLoteDesmembramento;

  LoteControleCartao? loteDesmembramento;

  int? idLoteQuitacao;

  LoteControleCartao? loteQuitacao;

  int? idTransacaoCartao;

  TransacaoCartao? transacaoCartao;

  int? idRemessaBancaria;

  RemessaBancaria? remessaBancaria;

  int? idApuracaoRoyalty;

  ApuracaoRoyalty? apuracaoRoyalty;

  int? idTurno;

  Turno? turno;

  int? idOperacaoOrigem;

  Operacao? operacaoOrigem;

  String? tipoApuracao;

  Conta();

  @override
  String toString() {
    return 'Conta{id: $id, idEmpresa: $idEmpresa, empresa: $empresa, idPessoa: $idPessoa, pessoa: $pessoa, descricao: $descricao, observacao: $observacao, codigo: $codigo, numeroDocumento: $numeroDocumento, dataLancamento: $dataLancamento, dataEmissao: $dataEmissao, dataCompetencia: $dataCompetencia, dataVencimento: $dataVencimento, idBanco: $idBanco, banco: $banco, numeroParcelas: $numeroParcelas, parcela: $parcela, descontoAntecipacao: $descontoAntecipacao, multaAtraso: $multaAtraso, jurosDiario: $jurosDiario, valor: $valor, desconto: $desconto, jurosMulta: $jurosMulta, tipoConta: $tipoConta, dataPagamento: $dataPagamento, valorPago: $valorPago, idFinalizadora: $idFinalizadora, finalizadora: $finalizadora, idContaCorrente: $idContaCorrente, contaCorrente: $contaCorrente, idContaCorrenteCarteira: $idContaCorrenteCarteira, contaCorrenteCarteira: $contaCorrenteCarteira, nossoNumero: $nossoNumero, idContaOrigem: $idContaOrigem, contaOrigem: $contaOrigem, pagamentosParciais: $pagamentosParciais, transferencia: $transferencia, automatico: $automatico, pago: $pago, parcial: $parcial, cancelado: $cancelado, classificacoes: $classificacoes, centroCustos: $centroCustos, idNota: $idNota, idContaLote: $idContaLote, contaLote: $contaLote, nota: $nota, idClienteFatura: $idClienteFatura, clienteFatura: $clienteFatura, idLoteDesmembramento: $idLoteDesmembramento, loteDesmembramento: $loteDesmembramento, idLoteQuitacao: $idLoteQuitacao, loteQuitacao: $loteQuitacao, idTransacaoCartao: $idTransacaoCartao, transacaoCartao: $transacaoCartao, idRemessaBancaria: $idRemessaBancaria, remessaBancaria: $remessaBancaria, idApuracaoRoyalty: $idApuracaoRoyalty, apuracaoRoyalty: $apuracaoRoyalty, idTurno: $idTurno, turno: $turno, idOperacaoOrigem: $idOperacaoOrigem, operacaoOrigem: $operacaoOrigem, tipoApuracao: $tipoApuracao}';
  }

//enum {ROYALTY , MARKETING}
  factory Conta.fromJson(Map<String, dynamic> json) => _$ContaFromJson(json);

  Map<String, dynamic> toJson() => _$ContaToJson(this);

  static List<Conta> listFromJson(List<dynamic> json) {
    return json.map((value) => Conta.fromJson(value)).toList();
  }

  static Map<String, Conta> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Conta>();
    if (json.isNotEmpty) {
      json.forEach(
              (String key, dynamic value) => map[key] = Conta.fromJson(value));
    }
    return map;
  }
}
