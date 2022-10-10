import 'package:models/model/enum/marca_pos.dart';
import 'package:models/model/enum/tipo_estacao.dart';
import 'package:models/model/enum/clients.dart' as c;
import 'package:models/model/models.dart';
import 'package:pos/pos/impressora/impressora_service.dart';
import 'package:requester/config/pws_config.dart';
import 'package:service/permissoes/verifica_permissao_service.dart';

class Application {
  Nota? nota;
  Usuario? user;
  String? pin;
  Turno? turno;
  late String token;
  Modulo? modulo;
  c.Clients? client;
  late Empresa empresa;
  Quest? quest;
  late PWSConfig pwsConfigWaychef;
  late PWSConfig pwsConfigGateway;
  Movimento? movimento;
  Funcionario? vendedor;
  List<NotaItem>? itens;
  bool ctrlF12 = false;
  EstacaoTrabalho? estacao;
  ServicoSitef? servicoSitef;
  CardapioMenu? menuCombinado;
  List<Nota> atendimentos = [];
  UsuarioEmpresa? usuarioEmpresa;
  TransacaoCartao? transacaoCartao;
  List<CardapioMenu>? cardapioMenus;
  CombinadoTamanho? combinadoTamanho;
  List<EstacaoTrabalho> estacoes = [];
  List<BandeiraCartao>? bandeirasCartao;
  List<FinalizadoraEmpresa> finalizadoras = [];
  List<Map<String, String?>?> transacoes = [];
  Map<num, ProdutoEmpresa> produtos = {};
  List<Funcionario> vendedores = [];
  List<Funcionario> entregador = [];
  List<Regiao> regioes = [];
  List<TabelaPreco> tabelaPrecos = [];
  List<CanalVenda> canalVendas = [];
  TabelaPreco? tabelaPreco;
  CanalVenda? canalVenda;

  //######### SERVICES ###############
  late ImpressoraService impressoraService;
  late VerificaPermissaoService verificaPermissaoService;

  final List<Map<String, String>> retornosFiscaisAPI = [
    {"FIS_1": "ICSM não cadastrado"},
    {"FIS_2": "NCM não cadastrado"},
    {"FIS_3": "CEST não cadastrado"},
    {"FIS_4": "Regime estadual não cadastrado"},
    {"FIS_5": "PisCofins não cadastrado"},
    {"FIS_6": "Origem da mercadoria não cadastrado"},
    {"FIS_7": "Tipo do produto não cadastrado"},
    {"FIS_8": "Espécie do produto não cadastrada"},
    {"FIS_9": "Cadastro de IBPT não localizado"},
    {"FIS_10": "NCM fora da vigência"},
    {"FIS_11": "CST Inválido"},
    {"FIS_12": "Empresa sem regime informado"},
    {"FIS_13": "Empresa sem regime informado"},
    {"FIS_14": "Erros impedem a emissão do cupom"},
  ];

  static final Application _instance = Application();

  static Application getInstance() {
    return _instance;
  }

  bool get isCaixa => estacao != null && estacao!.finalidade == "CAIXA";

  bool get isAutoAtendimento =>
      estacao != null && estacao!.finalidade == "AUTOATENDIMENTO";

  bool get isTerminalLancamento =>
      estacao != null && estacao!.finalidade == "PRE_VENDA_LANCAMENTO";

  bool get hasPrinter =>
      estacao != null &&
          (estacao!.tipo == "SMART_POS" ||
              estacao!.tipo == "GTOUCH" ||
              estacao!.tipo == "MINI_PDV");

  bool get hasDelivery =>
      estacao != null &&
          estacao!.modulos.any((modulo) => modulo.tipo == "DELIVERY");

  Modulo? get currentModulo {
    if (nota == null) {
      return null;
    }
    return getModuloFromTipo(nota!.consumo!.modulo);
  }

  Modulo? getModuloFromTipo(String? tipoModulo) {
    return estacao!.modulos.firstWhere((modulo) => modulo.tipo == tipoModulo);
  }

  void setImpressoraService(TipoEstacao tipoEstacao, MarcaPOS marcaPOS) {
    impressoraService = ImpressoraService(tipoEstacao, marcaPOS);
  }

  void setVerificaPermissaoService(UsuarioPerfilEmpresa usuarioPerfilEmpresa) {
    verificaPermissaoService =
        VerificaPermissaoService(pwsConfigWaychef, token, usuarioPerfilEmpresa);
  }
}
