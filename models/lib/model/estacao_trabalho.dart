part of openapi.api;

@JsonSerializable()
class EstacaoTrabalho {

  int? id;

  String? nome;

  String? descricao;

  int? idEmpresa;

  int? idSetor;

  Setor? setor;

  GrupoEstacao? grupo;

  String? osName;

  String? osVersion;

  String? javaVersion;

  String? tipo = "MOVEL";

  //enum tipoEnum {  COMPUTADOR,  MOVEL,  MICROTERMINAL,  WEB,  SMART_POS, GTOUCH, MINI_PDV };{

  String? teclado = "TOUCH";

  //enum tecladoEnum {  Padrão,  Touch,  Reduzido,  };{

  String? finalidade = "CAIXA";

  //enum finalidadeEnum {  CAIXA,  PRE_VENDA_LANCAMENTO,  CONSULTA,  RECEBIMENTO,  MONITOR_PRODUCAO,  PESAGEM,  EXPEDICAO_PEDIDOS,  OUTRAS,  AUTOATENDIMENTO,  };{

  String? modoOperacao = "NENHUM";

  //enum modoOperacaoEnum {  NENHUM,  MODO_A,  MODO_B,  AMBOS,  };{

  String? marcaSmartPOS = "NENHUMA";

  //enum marcaSmartPOSEnum {  GERTEC_GPOS_700,  INGENICO_APOS_A8, CIELO_LIO, NENHUMA,  };{

  Cardapio? cardapio;

  String? marcaMicroterminal = "NENHUMA";

  //enum marcaMicroterminalEnum {  NENHUMA,  WILBOR,  GERTEC,  WILLTECH,  };{

  String? ip;

  int? numeroCaixa;

  bool? utilizaGaveta = false;

  String? tipoEmissorFiscal = "NENHUM";

  //enum tipoEmissorFiscalEnum {  Nenhum,  SAT,  NFC-e,  Concentrador Sifat,  };{

  EmissorFiscal? emissorFiscal;

  String? concentradorHost;

  int? concentradorPorta;

  bool? modoHibrido = false;

  String? codigoOTPSitef;

  String? pontoCapturaPayGo;

  String? modoVisualizacaoMapa = "BOTAO_SIMPLES";

  //enum modoVisualizacaoMapaEnum {  NAO_EXIBE,  BOTAO_SIMPLES,  BOTAO_COMPLETO,  };{

  bool? exigirLoginGarcom = false;

  bool? utilizaBiometria = false;

  bool? visualizaMapa = false;

  int? colunasCardapio = 3;

  EstacaoBalanca? balanca = EstacaoBalanca();

  EstacaoLeitor? leitor = EstacaoLeitor();

  @JsonKey(defaultValue: [])
  List<Modulo> modulos = [];

  @JsonKey(defaultValue: [])
  List<EstacaoImpressora> impressoras = [];

  ServicoImpressao? servicoImpressao;

  ServicoIfood? servicoIfood;

  ServicoCatraca? servicoCatraca;

  ServicoFourAll? servicoFourAll;

  int? idContaCorrente;

  ContaCorrente? contaCorrente;

  int? versao;

  String? tipoTEF = 'NENHUM';

  //enum { NENHUM, SITEF, REDE, PAYGO, CIELO }

  String? modoPesquisa = "PADRAO";

  //enum { PADRAO, INCREMENTAL}

  String? tipoPinPad = 'ANDROID_AUTO';

  ControleCadastro? controleCadastro;

  EstacaoTrabalho();


  @override
  String toString() {
    return 'EstacaoTrabalho{id: $id, nome: $nome, descricao: $descricao, idEmpresa: $idEmpresa, idSetor: $idSetor, setor: $setor, grupo: $grupo, osName: $osName, osVersion: $osVersion, javaVersion: $javaVersion, tipo: $tipo, teclado: $teclado, finalidade: $finalidade, modoOperacao: $modoOperacao, marcaSmartPOS: $marcaSmartPOS, cardapio: $cardapio, marcaMicroterminal: $marcaMicroterminal, ip: $ip, numeroCaixa: $numeroCaixa, utilizaGaveta: $utilizaGaveta, tipoEmissorFiscal: $tipoEmissorFiscal, emissorFiscal: $emissorFiscal, concentradorHost: $concentradorHost, concentradorPorta: $concentradorPorta, modoHibrido: $modoHibrido, codigoOTPSitef: $codigoOTPSitef, pontoCapturaPayGo: $pontoCapturaPayGo, modoVisualizacaoMapa: $modoVisualizacaoMapa, exigirLoginGarcom: $exigirLoginGarcom, utilizaBiometria: $utilizaBiometria, visualizaMapa: $visualizaMapa, colunasCardapio: $colunasCardapio, balanca: $balanca, leitor: $leitor, modulos: $modulos, impressoras: $impressoras, servicoImpressao: $servicoImpressao, servicoIfood: $servicoIfood, servicoCatraca: $servicoCatraca, servicoFourAll: $servicoFourAll, idContaCorrente: $idContaCorrente, contaCorrente: $contaCorrente, versao: $versao, tipoTEF: $tipoTEF, modoPesquisa: $modoPesquisa, tipoPinPad: $tipoPinPad, controleCadastro: $controleCadastro}';
  }

  factory EstacaoTrabalho.fromJson(Map<String, dynamic> json) =>
      _$EstacaoTrabalhoFromJson(json);

  Map<String, dynamic> toJson() => _$EstacaoTrabalhoToJson(this);


  static List<EstacaoTrabalho> listFromJson(List<dynamic> json) {
    return json.map((value) => EstacaoTrabalho.fromJson(value)).toList();
  }

  static Map<String, EstacaoTrabalho> mapFromJson(Map<String, dynamic> json) {
    var map = Map<String, EstacaoTrabalho>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = EstacaoTrabalho.fromJson(value));
    }
    return map;
  }
}

