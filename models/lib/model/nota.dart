// part of openapi.api;
//
// @JsonSerializable(explicitToJson: true)
// class Nota implements Cloneable {
//   int? id;
//
//   String? operacao = 'VENDA';
//
//   //enum operacaoEnum {  VENDA,  ENTRADA,  TRANSFERENCIA,  REMESSA,  DEVOLUCAO,  OUTRAS,  };{
//
//   String? modelo = 'NENHUM';
//
//   //enum modeloEnum {  NENHUM,  NFE,  CFE,  NFCE,  };{
//
//   int? idEmpresa;
//
//   Empresa? empresa;
//
//   int? idCaixa;
//
//   EstacaoTrabalho? _caixa;
//
//   int? numero;
//
//   String? serie;
//
//   String? subSerie;
//
//   DateTime? dataEmissao;
//
//   DateTime? dataLancamento;
//
//   DateTime? dataSaida;
//
//   int? idVendedor;
//
//   Funcionario? _vendedor;
//
//   int? idTurno;
//
//   Turno? _turno;
//
//   COP? cop;
//
//   int? idCliente;
//
//   Cliente? _cliente;
//
//   int? idClienteAutorizado;
//
//   ClienteAutorizado? clienteAutorizado;
//
//   int? idFornecedor;
//
//   Fornecedor? fornecedor;
//
//   int? idEndereco;
//
//   Endereco? _endereco;
//
//   BigDecimal? valorSubTotal = BigDecimal.ZERO();
//
//   BigDecimal? valorTotal = BigDecimal.ZERO();
//
//   BigDecimal? valorAcrescimo = BigDecimal.ZERO();
//
//   BigDecimal? valorDesconto = BigDecimal.ZERO();
//
//   BigDecimal? valorDescontoItens = BigDecimal.ZERO();
//
//   BigDecimal? valorTotalServico = BigDecimal.ZERO();
//
//   BigDecimal? valorIsencaoServico = BigDecimal.ZERO();
//
//   BigDecimal? valorFrete = BigDecimal.ZERO();
//
//   BigDecimal? valorDespesaAcessoria = BigDecimal.ZERO();
//
//   BigDecimal? valorIcmsSt = BigDecimal.ZERO();
//
//   @JsonKey(defaultValue: false)
//   bool? descontoPromocao;
//
//   String? status = 'ABERTA';
//
//   //enum statusEnum {  ABERTA,  FECHADA,  JUNTADA,  RECEBIDA,  CANCELADA,  };{
//
//   DateTime? dataStatus;
//
//   String? statusExpedicao = 'NENHUMA';
//
//   //enum statusExpedicaoEnum {  NENHUMA,  PENDENTE,  EXPEDIDA,  ENTREGUE,  };{
//
//   int? idEntregador;
//
//   Funcionario? _entregador;
//
//   DateTime? dataCombinada;
//
//   String? consumidorDocumento;
//
//   String? consumidorNome;
//
//   String? motivoCancelamento;
//
//   Consumo? consumo = Consumo();
//
//   NotaQuest? quest;
//
//   NotaFiscal? notaFiscal;
//
//   String? tokenSessao;
//
//   int? idConcentrador;
//
//   @JsonKey(defaultValue: [])
//   List<NotaItem> itens = [];
//
//   @JsonKey(defaultValue: [])
//   List<NotaFinalizadora> finalizadoras = [];
//
//   @JsonKey(defaultValue: [])
//   List<NotaDadosIntegrador> dadosIntegrador = [];
//
//   @JsonKey(defaultValue: [])
//   List<NotaEvento> eventos = [];
//
//   @JsonKey(defaultValue: [])
//   List<Conta> contas = [];
//
//   @JsonKey(defaultValue: [])
//   List<ClienteConta> clienteContas = [];
//
//   @JsonKey(defaultValue: [])
//   List<Nota> documentosVinculados = [];
//
//   int? idCanalVenda;
//
//   CanalVenda? canalVenda;
//
//   bool? usaConsumo = true;
//
//   DateTime? versao;
//
//   Nota();
//
//
//   @override
//   String toString() {
//     return 'Nota{id: $id, operacao: $operacao, modelo: $modelo, idEmpresa: $idEmpresa, empresa: $empresa, idCaixa: $idCaixa, _caixa: $_caixa, numero: $numero, serie: $serie, subSerie: $subSerie, dataEmissao: $dataEmissao, dataLancamento: $dataLancamento, dataSaida: $dataSaida, idVendedor: $idVendedor, _vendedor: $_vendedor, idTurno: $idTurno, _turno: $_turno, cop: $cop, idCliente: $idCliente, _cliente: $_cliente, idClienteAutorizado: $idClienteAutorizado, clienteAutorizado: $clienteAutorizado, idFornecedor: $idFornecedor, fornecedor: $fornecedor, idEndereco: $idEndereco, _endereco: $_endereco, valorSubTotal: $valorSubTotal, valorTotal: $valorTotal, valorAcrescimo: $valorAcrescimo, valorDesconto: $valorDesconto, valorDescontoItens: $valorDescontoItens, valorTotalServico: $valorTotalServico, valorIsencaoServico: $valorIsencaoServico, valorFrete: $valorFrete, valorDespesaAcessoria: $valorDespesaAcessoria, valorIcmsSt: $valorIcmsSt, descontoPromocao: $descontoPromocao, status: $status, dataStatus: $dataStatus, statusExpedicao: $statusExpedicao, idEntregador: $idEntregador, _entregador: $_entregador, dataCombinada: $dataCombinada, consumidorDocumento: $consumidorDocumento, consumidorNome: $consumidorNome, motivoCancelamento: $motivoCancelamento, consumo: $consumo, quest: $quest, notaFiscal: $notaFiscal, tokenSessao: $tokenSessao, idConcentrador: $idConcentrador, itens: $itens, finalizadoras: $finalizadoras, dadosIntegrador: $dadosIntegrador, eventos: $eventos, contas: $contas, clienteContas: $clienteContas, documentosVinculados: $documentosVinculados, idCanalVenda: $idCanalVenda, canalVenda: $canalVenda, usaConsumo: $usaConsumo, versao: $versao}';
//   }
//
//   factory Nota.fromJson(Map<String, dynamic> json) {
//     Nota n = _$NotaFromJson(json);
//
//     n._caixa = json['caixa'] == null
//         ? null
//         : EstacaoTrabalho.fromJson(json['caixa'] as Map<String, dynamic>);
//
//     n._turno = json['turno'] == null
//         ? null
//         : Turno.fromJson(json['turno'] as Map<String, dynamic>);
//
//     n._vendedor = json['vendedor'] == null
//         ? null
//         : Funcionario.fromJson(json['vendedor'] as Map<String, dynamic>);
//
//     n._cliente = json['cliente'] == null
//         ? null
//         : Cliente.fromJson(json['cliente'] as Map<String, dynamic>);
//
//     n._endereco = json['endereco'] == null
//         ? null
//         : Endereco.fromJson(json['endereco'] as Map<String, dynamic>);
//
//     n._entregador = json['entregador'] == null
//         ? null
//         : Funcionario.fromJson(json['entregador'] as Map<String, dynamic>);
//
//     return n;
//   }
//
//   Map<String, dynamic> toJson() => _$NotaToJson(this);
//
//   static List<Nota> listFromJson(List<dynamic> json) {
//     return json.map((value) => Nota.fromJson(value)).toList();
//   }
//
//   static Map<String, Nota> mapFromJson(Map<String, dynamic> json) {
//     var map = Map<String, Nota>();
//     if (json.isNotEmpty) {
//       json.forEach((String key, dynamic value) =>
//       map[key] = Nota.fromJson(value));
//     }
//     return map;
//   }
//
//   @override
//   clone() {
//     var f = this.finalizadoras;
//     var c = this._caixa;
//     var t = this._turno;
//     var v = this._vendedor;
//     var cli = this._cliente;
//     var e = this._endereco;
//     var ent = this._entregador;
//     Nota n = Nota.fromJson(jsonDecode(jsonEncode(this.toJson())));
//     n.finalizadoras = f;
//     n._caixa = c;
//     n._turno = t;
//     n._vendedor = v;
//     n._cliente = cli;
//     n._endereco = e;
//     n._entregador = ent;
//     return n;
//   }
//
//   EstacaoTrabalho? get caixa => _caixa;
//
//   Turno? get turno => _turno;
//
//   Funcionario? get vendedor => _vendedor;
//
//   Cliente? get cliente => _cliente;
//
//   Endereco? get endereco => _endereco;
//
//   Funcionario? get entregador => _entregador;
//
//   set cliente(Cliente? newCliente) => _cliente = newCliente;
// }
