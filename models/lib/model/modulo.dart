part of openapi.api;

@JsonSerializable()
class Modulo {
  int? id;

  int? idEmpresa;

  String? tipo;

  //enum tipoEnum {  GERAL,  MESA,  FICHA,  DELIVERY,  CARTAO,  BALCAO,  DRIVE_THRU,  AUTOATENDIMENTO,  };{

  String? comissaoVendedor = 'VENDEDOR_ITEM';

  //enum tipoEnum { VENDEDOR_ITEM, VENDEDOR_FECHAMENTO, };{

  int? sequencia = 0;

  String? moduloPessoas = 'NAO_PERGUNTA';

  //enum moduloPessoasEnum {  NAO_PERGUNTA,  PERGUNTA_ABERTURA,  PERGUNTA_FECHAMENTO,  };{

  int avisoTempoOcioso = 5;

  String? ticketConsumo = 'AGRUPAR';

  //enum ticketConsumoEnum {  AGRUPAR,  INDIVIDUAL,  };{

  String? impressaoVenda = 'IMPRIME';

  //enum impressaoVendaEnum {  NAO_IMPRIME,  PERGUNTA,  IMPRIME,  };{

  int? imprimeVendaVias = 1;

  String? senhaAtendimento = 'NAO_UTILIZA';

  //enum senhaAtendimentoEnum {  NAO_UTILIZA,  SENHA_NUMERICA_ALEATORIA,  SENHA_NUMERICA_SEQUENCIAL,  ALFA_NUMERICA,  };{

  String? dicaVenda;

  int? pedidosCalculoExpedicao = 5;

  String? denominacaoServico;

  ProdutoEmpresa? produtoServico;

  BigDecimal? taxaServico = BigDecimal.ZERO();

  bool? identificaGarcom;

  bool? identificaCliente;

  bool? ticketReduzido;

  bool? informaMotivoCancelamentoPedido;

  bool? informaMotivoCancelamentoItem;

  bool? imprimeItensPagamento;

  bool? imprimeCancelamentoItem;

  bool? imprimeFichaConsumo;

  bool? controlaSequenciaComanda;

  bool? reutilizaFichas;

  bool? permiteSuspender;

  bool? enviaSMS;

  bool? cartaoCampoNascimento;

  bool? cartaoCampoTelefone;

  bool? cartaoCampoEndereco;

  bool? cartaoCampoEstado;

  bool? cartaoCampoCidade;

  bool? cartaoCampoCep;

  bool? cartaoCampoEmail;

  bool? cartaoCampoSMS;

  FinalizadoraEmpresa? finalizadoraDebito;

  FinalizadoraEmpresa? finalizadoraCredito;

  FinalizadoraEmpresa? finalizadoraDinheiro;

  bool? multiplasFinalizadoras = true;

  bool? ativo = true;

  bool? controleTempoProducao = false;

  String? mensagemFinalAtendimento;

  @JsonKey(defaultValue: [])
  List<ModuloMapeamento> listMapeamento = [];

  Modulo();


  @override
  String toString() {
    return 'Modulo{id: $id, idEmpresa: $idEmpresa, tipo: $tipo, comissaoVendedor: $comissaoVendedor, sequencia: $sequencia, moduloPessoas: $moduloPessoas, avisoTempoOcioso: $avisoTempoOcioso, ticketConsumo: $ticketConsumo, impressaoVenda: $impressaoVenda, imprimeVendaVias: $imprimeVendaVias, senhaAtendimento: $senhaAtendimento, dicaVenda: $dicaVenda, pedidosCalculoExpedicao: $pedidosCalculoExpedicao, denominacaoServico: $denominacaoServico, produtoServico: $produtoServico, taxaServico: $taxaServico, identificaGarcom: $identificaGarcom, identificaCliente: $identificaCliente, ticketReduzido: $ticketReduzido, informaMotivoCancelamentoPedido: $informaMotivoCancelamentoPedido, informaMotivoCancelamentoItem: $informaMotivoCancelamentoItem, imprimeItensPagamento: $imprimeItensPagamento, imprimeCancelamentoItem: $imprimeCancelamentoItem, imprimeFichaConsumo: $imprimeFichaConsumo, controlaSequenciaComanda: $controlaSequenciaComanda, reutilizaFichas: $reutilizaFichas, permiteSuspender: $permiteSuspender, enviaSMS: $enviaSMS, cartaoCampoNascimento: $cartaoCampoNascimento, cartaoCampoTelefone: $cartaoCampoTelefone, cartaoCampoEndereco: $cartaoCampoEndereco, cartaoCampoEstado: $cartaoCampoEstado, cartaoCampoCidade: $cartaoCampoCidade, cartaoCampoCep: $cartaoCampoCep, cartaoCampoEmail: $cartaoCampoEmail, cartaoCampoSMS: $cartaoCampoSMS, finalizadoraDebito: $finalizadoraDebito, finalizadoraCredito: $finalizadoraCredito, finalizadoraDinheiro: $finalizadoraDinheiro, multiplasFinalizadoras: $multiplasFinalizadoras, ativo: $ativo, controleTempoProducao: $controleTempoProducao, mensagemFinalAtendimento: $mensagemFinalAtendimento, listMapeamento: $listMapeamento}';
  }

  factory Modulo.fromJson(Map<String, dynamic> json) => _$ModuloFromJson(json);

  Map<String, dynamic> toJson() => _$ModuloToJson(this);

  static List<Modulo> listFromJson(List<dynamic> json) {
    return json.map((value) => Modulo.fromJson(value)).toList();
  }

  static Map<String, Modulo> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, Modulo>();
    if (json.isNotEmpty) {
      json.forEach(
              (String key, dynamic value) => map[key] = Modulo.fromJson(value));
    }
    return map;
  }

  String get txtTipoModulo {
    switch (this.tipo) {
      case "GERAL":
        return "Geral";
      case "MESA":
        return "MESA";
      case "FICHA":
        return "FICHA";
      case "DELIVERY":
        return "DELIVERY";
      case "CARTAO":
        return "CARTAO";
      case "BALCAO":
        return "BALCAO";
      case "DRIVE_THRU":
        return "DRIVE-THRU";
      case "AUTOATENDIMENTO":
        return "AUTOATENDIMENTO";
      default:
        return " ";
    }
  }
}
