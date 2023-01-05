import 'package:models/model/enum/request_type.dart';

class UrlPws {
  late String _url;
  late RequestType _type;

  UrlPws.usuarioLogin() {
    _url = "/v1/usuarios/login-pdv";
    _type = RequestType.POST;
  }

  UrlPws.usuarioLogout() {
    _url = "/v1/usuarios/logout-pdv";
    _type = RequestType.DELETE;
  }

  UrlPws.gerenciadorLogin() {
    _url = "/v1/gerenciadores/login";
    _type = RequestType.POST;
  }

  UrlPws.atualizaSessao() {
    _url = "/v1/usuarios/atualizar-sessao";
    _type = RequestType.PUT;
  }

  UrlPws.validarSupervisor() {
    _url = "/v2/usuario";
    _type = RequestType.GET;
  }

  UrlPws.validarInscricaoFederalUsuario() {
    _url = "/v1/usuarios/cadastro/validar-cpf";
    _type = RequestType.GET;
  }

  UrlPws.solicitarEmailConfirmacaoUsuario() {
    _url = "/v1/usuarios/cadastro/solicitar-email-confirmacao";
    _type = RequestType.POST;
  }

  UrlPws.validarCadastroUsuario() {
    _url = "/v1/usuarios/cadastro/validar-cadastro";
    _type = RequestType.POST;
  }

  UrlPws.postCadastrarUsuario() {
    _url = "/v1/usuarios/cadastro/cadastrar-usuario";
    _type = RequestType.POST;
  }

  UrlPws.putAtualizarDadosUsuario() {
    _url = "/v1/usuarios/cadastro/{idUsuario}/atualizar-dados";
    _type = RequestType.PUT;
  }

  UrlPws.getEsqueciSenha() {
    _url = "/v1/usuarios/cadastro/esqueci-senha";
    _type = RequestType.GET;
  }

  UrlPws.putAdicionarEmpresaUsuario() {
    _url = "/v1/usuarios/cadastro/adicionar-empresa";
    _type = RequestType.PUT;
  }

  UrlPws.getEstacoes() {
    _url = "/v1/estacoes";
    _type = RequestType.GET;
  }

  UrlPws.postEstacoes() {
    _url = "/v1/estacoes";
    _type = RequestType.POST;
  }

  UrlPws.getEstacoesSimplificado() {
    _url = "/v1/estacoes/buscar-estacoes-simplificado";
    _type = RequestType.GET;
  }

  UrlPws.putEstacaoNome() {
    _url = "/v1/estacoes/{idEstacao}/alterar-nome";
    _type = RequestType.PUT;
  }

  UrlPws.getPreCadastroEstacao() {
    _url = "/v1/estacoes/pre-cadastro";
    _type = RequestType.GET;
  }

  UrlPws.getMenusCardapio() {
    _url = "/v1/cardapios/{idCardapio}/menus";
    _type = RequestType.GET;
  }

  UrlPws.getConsumos() {
    _url = "/v1/consumos";
    _type = RequestType.GET;
  }

  UrlPws.getConsumo() {
    _url = "/v1/consumos/{idNota}";
    _type = RequestType.GET;
  }

  UrlPws.getConsumosAbertos() {
    _url = "/v1/consumos/consumos-abertos";
    _type = RequestType.GET;
  }

  UrlPws.postConsumos() {
    _url = "/v1/consumos";
    _type = RequestType.POST;
  }

  UrlPws.confirmarConsumo() {
    _url = "/v1/consumos/{idNota}/confirmar";
    _type = RequestType.PUT;
  }

  UrlPws.fecharConsumo() {
    _url = "/v1/consumos/fechar";
    _type = RequestType.PUT;
  }

  UrlPws.reabrirConsumo() {
    _url = "/v1/consumos/{idNota}/reabrir";
    _type = RequestType.PUT;
  }

  UrlPws.cancelarConsumo() {
    _url = "/v1/consumos/{idNota}/cancelar";
    _type = RequestType.PUT;
  }

  UrlPws.putObservacaoConsumo() {
    _url = "/v1/consumos/{idNota}/observacao";
    _type = RequestType.PUT;
  }

  UrlPws.receberConsumo() {
    _url = "/v1/consumos/{idNota}/receber";
    _type = RequestType.PUT;
  }

  UrlPws.receberConsumoParcial() {
    _url = "/v1/consumos/{idNota}/receber/parcial";
    _type = RequestType.PUT;
  }

  UrlPws.getItensConsumo() {
    _url = "/v1/consumos/{idNota}/itens";
    _type = RequestType.GET;
  }

  UrlPws.postItensConsumo() {
    _url = "/v1/consumos/{idNota}/itens";
    _type = RequestType.POST;
  }

  UrlPws.putItensConsumo() {
    _url = "/v1/consumos/{idNota}/itens";
    _type = RequestType.PUT;
  }

  UrlPws.cancelarItensConsumo() {
    _url = "/v1/consumos/{idNota}/itens/cancelar";
    _type = RequestType.PUT;
  }

  UrlPws.postMensagemProducao() {
    _url = "/v1/consumos/mensagem-producao";
    _type = RequestType.POST;
  }

  UrlPws.putJuntarComanda() {
    _url = "/v1/consumos/{idNota}/juntar";
    _type = RequestType.PUT;
  }

  UrlPws.putDesbloquearFicha() {
    _url = "/v1/consumos/desbloquear-ficha";
    _type = RequestType.PUT;
  }

  UrlPws.putTranferirItens() {
    _url = "/v1/consumos/{idNota}/transferir/{comandaDestino}";
    _type = RequestType.PUT;
  }

  UrlPws.putPreDesconto() {
    _url = "/v1/consumos/{idNota}/pre-desconto";
    _type = RequestType.PUT;
  }

  UrlPws.postSolicitarImpressao() {
    _url = "/v1/consumos/{idNota}/solicitar-impressao";
    _type = RequestType.POST;
  }

  UrlPws.checkout() {
    _url = "/v1/consumos/checkout";
    _type = RequestType.GET;
  }

  UrlPws.getProdutos() {
    _url = "/v1/produtos";
    _type = RequestType.GET;
  }

  UrlPws.getProdutoMenus() {
    _url = "/v1/produto-menus";
    _type = RequestType.GET;
  }

  UrlPws.getProdutoGrupos() {
    _url = "/v1/grupos";
    _type = RequestType.GET;
  }

  UrlPws.getTurnoAtivo() {
    _url = "/v1/turnos/ativo";
    _type = RequestType.GET;
  }

  UrlPws.postTurno() {
    _url = "/v1/turnos";
    _type = RequestType.POST;
  }

  UrlPws.putFecharTurno() {
    _url = "/v1/turnos/{idTurno}/fechar";
    _type = RequestType.PUT;
  }

  UrlPws.getTurnos() {
    _url = "/v1/turnos";
    _type = RequestType.GET;
  }

  UrlPws.getMovimentoAtivo() {
    _url = "/v1/movimentos/ativo";
    _type = RequestType.GET;
  }

  UrlPws.postMovimento() {
    _url = "/v1/movimentos";
    _type = RequestType.POST;
  }

  UrlPws.getFinalizadoras() {
    _url = "/v1/finalizadoras";
    _type = RequestType.GET;
  }

  UrlPws.getBandeirasCartao() {
    _url = "/v1/bandeiras-cartoes";
    _type = RequestType.GET;
  }

  UrlPws.getLocaisProducao() {
    _url = "/v1/locais-producao";
    _type = RequestType.GET;
  }

  UrlPws.getClassificacao() {
    _url = "/v1/classificacoes";
    _type = RequestType.GET;
  }

  UrlPws.getOperacaoConferencia() {
    _url = "/v2/caixa/conferencia-turno";
    _type = RequestType.GET;
  }

  UrlPws.postOperacao() {
    _url = "/v1/operacoes";
    _type = RequestType.POST;
  }

  UrlPws.getEmpresa() {
    _url = "/v1/empresas";
    _type = RequestType.GET;
  }

  UrlPws.getEmpresaSimplificado() {
    _url = "/v1/empresas/{idEmpresa}/simplificado";
    _type = RequestType.GET;
  }

  UrlPws.getServicoSitef() {
    _url = "/v1/servicos/servico-sitef";
    _type = RequestType.GET;
  }

  UrlPws.putCancelarNota() {
    _url = "/v1/notas/{idNota}/cancelar";
    _type = RequestType.PUT;
  }

  UrlPws.putCalcularImpostosNota() {
    _url = "/v1/notas/{idNota}/calcular-imposto";
    _type = RequestType.PUT;
  }

  UrlPws.putMontarNFCeNota() {
    _url = "/v1/notas/{idNota}/montar-nfce";
    _type = RequestType.PUT;
  }

  UrlPws.putEmitirNFCeNota() {
    _url = "/v1/notas/{idNota}/emitir-nfce";
    _type = RequestType.PUT;
  }

  UrlPws.getEspelho() {
    _url = "/v1/notas/{idNota}/espelho";
    _type = RequestType.GET;
  }

  UrlPws.putCancelarNFCeNota() {
    _url = "/v1/notas/{idNota}/cancelar-nfce";
    _type = RequestType.PUT;
  }

  UrlPws.gerarImpressao55mm() {
    _url = "/v1/notas/{idNota}/gerar-impressao-55mm";
    _type = RequestType.PUT;
  }

  UrlPws.getStatusServicoNFCe() {
    _url = "/v1/notas/consultar/status-nfce";
    _type = RequestType.GET;
  }

  UrlPws.getNota() {
    _url = "/v1/notas/{idNota}";
    _type = RequestType.GET;
  }

  UrlPws.registrarDesconto() {
    _url = "/v2/notas/{idNota}/registrar-desconto";
    _type = RequestType.PUT;
  }

  UrlPws.registrarAcrescimo() {
    _url = "/v2/notas/{idNota}/registrar-acrescimo";
    _type = RequestType.PUT;
  }

  UrlPws.getVendas() {
    _url = "/v1/vendas";
    _type = RequestType.GET;
  }

  UrlPws.getPendencias() {
    _url = "/v1/pendencias";
    _type = RequestType.GET;
  }

  UrlPws.getExistePendencia() {
    _url = "/v1/pendencias/existe-pendencias";
    _type = RequestType.GET;
  }

  UrlPws.getVersao() {
    _url = "/v1/versao";
    _type = RequestType.GET;
  }

  UrlPws.getAplicativoVersao() {
    _url = "/v2/versionamento";
    _type = RequestType.GET;
  }

  UrlPws.postEmpresaConfiguracao() {
    _url = "/v1/empresas/configuracao/solicitar";
    _type = RequestType.POST;
  }

  UrlPws.getEmpresaConfiguracao() {
    _url = "/v1/empresas/configuracao/solicitar";
    _type = RequestType.GET;
  }

  UrlPws.getValidarInscricaoFederal() {
    _url = "/v1/empresas/cadastro/validar-inscricao-federal";
    _type = RequestType.GET;
  }

  UrlPws.postCadastrarEmpresa() {
    _url = "/v1/empresas/cadastro/cadastrar-empresa";
    _type = RequestType.POST;
  }

  UrlPws.getUnidadesFederativas() {
    _url = "/v1/unidades-federativas";
    _type = RequestType.GET;
  }

  UrlPws.getCidadesUF() {
    _url = "/v1/cidades/{uf}";
    _type = RequestType.GET;
  }

  UrlPws.getLogradouro() {
    _url = "/v1/logradouros";
    _type = RequestType.GET;
  }

  UrlPws.postUsuarioWaycard() {
    _url = "/v1/waycard";
    _type = RequestType.POST;
  }

  UrlPws.putConfirmarUsuarioWaycard() {
    _url = "/v1/waycard";
    _type = RequestType.PUT;
  }

  UrlPws.getReenviarCodigoWaycard() {
    _url = "/v1/waycard/reenviar-codigo";
    _type = RequestType.GET;
  }

  UrlPws.postWaycardLogin() {
    _url = "/v1/waycard/login";
    _type = RequestType.POST;
  }

  UrlPws.listagemWaycardCartoes() {
    _url = "/v1/waycard/cartoes";
    _type = RequestType.GET;
  }

  UrlPws.listagemWaycardFaturas() {
    _url = "/v1/waycard/cartoes/{idCartao}/faturas";
    _type = RequestType.GET;
  }

  UrlPws.waycardFaturaExtrato() {
    _url = "/v1/waycard/cartoes/{idCartao}/faturas/{idFatura}/extrato";
    _type = RequestType.GET;
  }

  UrlPws.waycardGerarToken() {
    _url = "/v1/waycard/cartoes/{idCartao}/token";
    _type = RequestType.GET;
  }

  UrlPws.getConsultarParticipanteQuest() {
    _url = "/v1/quest/consulta-participante";
    _type = RequestType.GET;
  }

  UrlPws.postPreCadastroParticipanteQuest() {
    _url = "/v1/quest/pre-cadastro";
    _type = RequestType.POST;
  }

  UrlPws.postGerarTokenQuest() {
    _url = "/v1/quest/gerar-token";
    _type = RequestType.POST;
  }

  //Portal Sifat
  UrlPws.getAtualizacaoAppPortalSifat() {
    _url = "/Atualizacao/{idApp}/{baseVersao}/{versao}`";
    _type = RequestType.GET;
  }

  UrlPws.postLog() {
    _url = "/v1/log";
    _type = RequestType.POST;
  }

  UrlPws.getContratoConfiguracao() {
    _url = "/v2/wizard/planos";
    _type = RequestType.GET;
  }

  UrlPws.getWizardBuscarEmpresa() {
    _url = "/v2/wizard/";
    _type = RequestType.GET;
  }

  UrlPws.getWizardValidarMaster() {
    _url = "/v2/wizard/validar-master";
    _type = RequestType.GET;
  }

  UrlPws.postWizardCadastrarEmpresa() {
    _url = "/v2/wizard/cadastrar-empresa";
    _type = RequestType.POST;
  }

  //Autoatendimento

  UrlPws.postAutoatendimentoStartSitef() {
    _url = "/tef/start-sitef";
    _type = RequestType.POST;
  }

  UrlPws.postAutoatendimentoPrintNFCe() {
    _url = "/printer/nfce";
    _type = RequestType.POST;
  }

  UrlPws.postAutoatendimentoPrintVenda() {
    _url = "/printer/venda";
    _type = RequestType.POST;
  }

  UrlPws.postAutoatendimentoPrintComprovanteTef() {
    _url = "/printer/comprovante-tef";
    _type = RequestType.POST;
  }

  UrlPws.postAutoatendimentoPrintConsumo() {
    _url = "/printer/consumo";
    _type = RequestType.POST;
  }

  UrlPws.getAutoatendimentoArquivoProperties() {
    _url = "/config";
    _type = RequestType.GET;
  }

  UrlPws.postAutoatendimentoArquivoProperties() {
    _url = "/config/create";
    _type = RequestType.POST;
  }

  UrlPws.getAutoatendimentoNomeEstacao() {
    _url = "/config/host-name";
    _type = RequestType.GET;
  }

  UrlPws.getBuscarTodosTabelaPreco() {
    _url = "/v2/tabela-preco";
    _type = RequestType.GET;
  }

  UrlPws.getBuscarPorIdTabelaPreco() {
    _url = "/v2/tabela-preco/{idTabela}";
    _type = RequestType.GET;
  }

  UrlPws.putAtualizaSessao() {
    _url = "/v1/gerenciadores/atualizar-sessao";
    _type = RequestType.PUT;
  }

  //Externas

  UrlPws.getReceitawsBuscaCNPJ() {
    _url = "https://www.receitaws.com.br/v1/cnpj/{cnpj}";
    _type = RequestType.GET;
  }

  UrlPws.getReservaMesa() {
    _url = "/v1/reservas";
    _type = RequestType.GET;
  }

  UrlPws.putReservaMesa() {
    _url = "/v1/reservas/{idReserva}";
    _type = RequestType.PUT;
  }

  UrlPws.postReservaMesa() {
    _url = "/v1/reservas";
    _type = RequestType.POST;
  }

  UrlPws.postInserirNotaFinalizadora() {
    _url = "/v2/notas/finalizadoras/{idNota}";
    _type = RequestType.POST;
  }

  UrlPws.deleteNotaFinalizadora() {
    _url = "/v2/notas/finalizadoras/{idNota}/{idNotaFinalizadora}";
    _type = RequestType.DELETE;
  }

  UrlPws.postRecebimentoParcial() {
    _url = "/v2/notas/{idNotaOrigem}/recebimento-parcial";
    _type = RequestType.POST;
  }

  UrlPws.deleteConsumo() {
    _url = "/v1/consumos/{idNota}";
    _type = RequestType.DELETE;
  }

  UrlPws.putInutilizarNFCe() {
    _url = "/v1/notas/inutilizar/nfce";
    _type = RequestType.PUT;
  }

  UrlPws.getCarregaFuncionarios() {
    _url = "/v1/funcionarios";
    _type = RequestType.GET;
  }

  UrlPws.getRegioes() {
    _url = "/v1/regioes";
    _type = RequestType.GET;
  }

  UrlPws.deleteCancelarExpedicao() {
    _url = "/v1/consumos/{idConsumo}/cancelar-expedicao";
    _type = RequestType.DELETE;
  }

  UrlPws.putExpedirPedidos() {
    _url = "/v1/consumos/expedir-pedidos";
    _type = RequestType.PUT;
  }

  UrlPws.putReceberEntregador() {
    _url = "/v1/consumos/{idEntregador}/recebimento-entregador";
    _type = RequestType.PUT;
  }

  UrlPws.deleteTodasFinalizadoras() {
    _url = "/v2/notas/finalizadoras/{idNota}";
    _type = RequestType.DELETE;
  }

  UrlPws.putAtulizarTipoEntrega() {
    _url = "/v2/notas/{idNota}/tipo-entrega";
    _type = RequestType.PUT;
  }

  UrlPws.putAtualizarCliente() {
    _url = "/v2/notas/{idNota}/atualizar-cliente";
    _type = RequestType.PUT;
  }

  UrlPws.putIsentarFrete() {
    _url = "/v2/notas/{idNota}/isentar-frete";
    _type = RequestType.PUT;
  }

  UrlPws.putIsentarServico() {
    _url = "/v2/notas/{idNota}/isentar-servico";
    _type = RequestType.PUT;
  }

  UrlPws.getCliente() {
    _url = "/v1/clientes/{idCliente}";
    _type = RequestType.GET;
  }

  UrlPws.getBuscarCadastroSimplificado() {
    _url = "/v2/clientes/cadastro-simplificado";
    _type = RequestType.GET;
  }

  UrlPws.putClienteAtualiza() {
    _url = "/v1/clientes/{idCliente}";
    _type = RequestType.PUT;
  }

  UrlPws.getClienteCarregaOcorrencia() {
    _url = "/v1/clientes/{idCliente}/ocorrencias";
    _type = RequestType.GET;
  }

  UrlPws.postInserirOcorrencia() {
    _url = "/v1/clientes/{idCliente}/ocorrencias";
    _type = RequestType.POST;
  }

  UrlPws.getUltimoPedido() {
    _url = "/v1/consumos/ultimo-pedido";
    _type = RequestType.GET;
  }

  UrlPws.putClienteInsere() {
    _url = "/v1/clientes";
    _type = RequestType.POST;
  }

  UrlPws.getBuscarTodosCanalVenda() {
    _url = '/v2/canal-venda';
    _type = RequestType.GET;
  }

  UrlPws.getBuscarPorIdCanalVenda() {
    _url = '/v2/canal-venda/{idCanal}';
    _type = RequestType.GET;
  }

  UrlPws.getTransacoesCartao() {
    _url = "/v2/transacoes-cartao";
    _type = RequestType.GET;
  }

  UrlPws.postCancelarTransacao() {
    _url = '/v2/transacoes-cartao/{idTransacao}/cancelar-transacao';
    _type = RequestType.POST;
  }

  UrlPws.putLiberarComandas() {
    _url = "/v2/consumos/liberar-comandas";
    _type = RequestType.PUT;
  }

  UrlPws.getBuscarHistorico() {
    _url = "/v2/clientes/historico";
    _type = RequestType.GET;
  }

  UrlPws.putValidarEmissaoNFCe() {
    _url = "/v2/notas/{idNota}/validar-emissao-nfce";
    _type = RequestType.PUT;
  }

  UrlPws.putLiberarEmissorFiscal() {
    _url = "/v2/notas/{idNota}/liberar-emissor-fiscal";
    _type = RequestType.PUT;
  }

  UrlPws.putNotaPerdenciaArquivar() {
    _url = "/notas/{idNota}/arquivar-pendencia";
    _type = RequestType.PUT;
  }

  UrlPws.getBuscarIntegrador() {
    _url = "/v2/empresa/integrador/{idIntegrador}";
    _type = RequestType.GET;
  }

  UrlPws.getRecebidasBalcao() {
    _url = "/v2/consumos/recebidas-balcao";
    _type = RequestType.GET;
  }

  UrlPws.putMarcarEntregue() {
    _url = "/v2/consumos/{idNota}/marcar-entregue";
    _type = RequestType.PUT;
  }

  UrlPws.putBuscarConfiguracoesAutoPesagem() {
    _url = "/v2/client-auto-pesagem/buscar-configuracoes";
    _type = RequestType.PUT;
  }

  UrlPws.getLerPeso() {
    _url = "/balanca/capturar-peso";
    _type = RequestType.GET;
  }

  UrlPws.putImprimirAutoPesagem() {
    _url = "/impressao/imprimir-ticket-autopesagem";
    _type = RequestType.POST;
  }


  UrlPws.putAtualizarEstacao() {
    _url = "/v1/estacoes/{idEstacao}";
    _type = RequestType.PUT;
  }

  UrlPws.getBuscarExtrato(){
    _url = "/v2/cliente-contas/{idCliente}/extrato";
    _type = RequestType.GET;
  }

  UrlPws.postInserirDebito(){
    _url = "/v2/cliente-contas/{idCliente}/debito";
    _type = RequestType.POST;
  }

  UrlPws.getDriverImpressora(){
    _url = "/v1/driver-impressoras";
    _type = RequestType.GET;
  }

  UrlPws.putAtualizarLayoutTempo(){
    _url = "/v2/layout-controle-tempo";
    _type = RequestType.PUT;
  }

  UrlPws.putAutoAtendimentoLogin(){
    _url = "/v2/servico-autoatendimento/login";
    _type = RequestType.PUT;
  }

  UrlPws.criarSessao(){
    _url = "/sessao/sessao-client/nova-sessao";
    _type = RequestType.POST;
  }

  UrlPws.atualizarSessao(){
    _url = "/sessao/sessao-client/atualizar-sessao";
    _type = RequestType.POST;
  }

  UrlPws.putNotaFiscalAtualizarErro(){
    _url = "/v1/notas/{idNota}/atualizar-erro-emissao";
    _type = RequestType.PUT;
  }

  RequestType? get type => _type;

  String? get url => _url;
}
