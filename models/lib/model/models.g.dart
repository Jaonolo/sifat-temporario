// GENERATED CODE - DO NOT MODIFY BY HAND

part of openapi.api;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BigDecimal _$BigDecimalFromJson(Map<String, dynamic> json) => BigDecimal(
      json['valor'] as String,
    );

Map<String, dynamic> _$BigDecimalToJson(BigDecimal instance) =>
    <String, dynamic>{
      'valor': instance.valor,
    };

AlfaSync _$AlfaSyncFromJson(Map<String, dynamic> json) => AlfaSync()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..empresa = json['empresa'] == null
      ? null
      : Empresa.fromJson(json['empresa'] as Map<String, dynamic>)
  ..intervaloExecucao = json['intervaloExecucao'] as int?
  ..sincronizaGrupo = json['sincronizaGrupo'] as bool?
  ..sincronizaProduto = json['sincronizaProduto'] as bool?
  ..sincronizaCliente = json['sincronizaCliente'] as bool?
  ..sincronizaFinalizadora = json['sincronizaFinalizadora'] as bool?
  ..sincronizaVenda = json['sincronizaVenda'] as bool?
  ..idGrupoPadraoSistema = json['idGrupoPadraoSistema'] as int?
  ..sincronizarApartirDe = json['sincronizarApartirDe'] == null
      ? null
      : DateTime.parse(json['sincronizarApartirDe'] as String)
  ..ativo = json['ativo'] as bool?;

Map<String, dynamic> _$AlfaSyncToJson(AlfaSync instance) => <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'empresa': instance.empresa,
      'intervaloExecucao': instance.intervaloExecucao,
      'sincronizaGrupo': instance.sincronizaGrupo,
      'sincronizaProduto': instance.sincronizaProduto,
      'sincronizaCliente': instance.sincronizaCliente,
      'sincronizaFinalizadora': instance.sincronizaFinalizadora,
      'sincronizaVenda': instance.sincronizaVenda,
      'idGrupoPadraoSistema': instance.idGrupoPadraoSistema,
      'sincronizarApartirDe': instance.sincronizarApartirDe?.toIso8601String(),
      'ativo': instance.ativo,
    };

AplicativoVersao _$AplicativoVersaoFromJson(Map<String, dynamic> json) =>
    AplicativoVersao()
      ..id = json['id'] as int?
      ..data =
          json['data'] == null ? null : DateTime.parse(json['data'] as String)
      ..client = json['client'] as String?
      ..versao = json['versao'] as String?
      ..link = json['link'] as String?
      ..beta = json['beta'] as bool?
      ..prioritaria = json['prioritaria'] as bool?
      ..dataLancamento = json['dataLancamento'] == null
          ? null
          : DateTime.parse(json['dataLancamento'] as String)
      ..detalhes = (json['detalhes'] as List<dynamic>?)
              ?.map((e) =>
                  AplicativoVersaoDetalhe.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

Map<String, dynamic> _$AplicativoVersaoToJson(AplicativoVersao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'data': instance.data?.toIso8601String(),
      'client': instance.client,
      'versao': instance.versao,
      'link': instance.link,
      'beta': instance.beta,
      'prioritaria': instance.prioritaria,
      'dataLancamento': instance.dataLancamento?.toIso8601String(),
      'detalhes': instance.detalhes,
    };

AplicativoVersaoDetalhe _$AplicativoVersaoDetalheFromJson(
        Map<String, dynamic> json) =>
    AplicativoVersaoDetalhe()
      ..id = json['id'] as int?
      ..idAplicativoVersao = json['idAplicativoVersao'] as int?
      ..aplicativoVersao = json['aplicativoVersao'] == null
          ? null
          : AplicativoVersao.fromJson(
              json['aplicativoVersao'] as Map<String, dynamic>)
      ..detalhes = json['detalhes'] as String?
      ..termoTecnico = json['termoTecnico'] as bool?;

Map<String, dynamic> _$AplicativoVersaoDetalheToJson(
        AplicativoVersaoDetalhe instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idAplicativoVersao': instance.idAplicativoVersao,
      'aplicativoVersao': instance.aplicativoVersao,
      'detalhes': instance.detalhes,
      'termoTecnico': instance.termoTecnico,
    };

AtribuirProdutoEmpresaDTO _$AtribuirProdutoEmpresaDTOFromJson(
        Map<String, dynamic> json) =>
    AtribuirProdutoEmpresaDTO()
      ..cnpj = json['cnpj'] as String?
      ..precoCusto = json['precoCusto'] == null
          ? null
          : BigDecimal.fromJson(json['precoCusto'])
      ..precoVenda = json['precoVenda'] == null
          ? null
          : BigDecimal.fromJson(json['precoVenda'])
      ..idProdutoEmpresa = json['idProdutoEmpresa'] as int?
      ..produtoEmpresa = json['produtoEmpresa'] == null
          ? null
          : ProdutoEmpresa.fromJson(
              json['produtoEmpresa'] as Map<String, dynamic>);

Map<String, dynamic> _$AtribuirProdutoEmpresaDTOToJson(
        AtribuirProdutoEmpresaDTO instance) =>
    <String, dynamic>{
      'cnpj': instance.cnpj,
      'precoCusto': instance.precoCusto,
      'precoVenda': instance.precoVenda,
      'idProdutoEmpresa': instance.idProdutoEmpresa,
      'produtoEmpresa': instance.produtoEmpresa,
    };

ClienteAutorizado _$ClienteAutorizadoFromJson(Map<String, dynamic> json) =>
    ClienteAutorizado()
      ..id = json['id'] as int?
      ..idPessoa = json['idPessoa'] as int?
      ..pessoa = json['pessoa'] == null
          ? null
          : Pessoa.fromJson(json['pessoa'] as Map<String, dynamic>)
      ..idCliente = json['idCliente'] as int?
      ..cliente = json['cliente'] == null
          ? null
          : Cliente.fromJson(json['cliente'] as Map<String, dynamic>)
      ..tipoVinculado = json['tipoVinculado'] as String?
      ..ativo = json['ativo'] as bool?;

Map<String, dynamic> _$ClienteAutorizadoToJson(ClienteAutorizado instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idPessoa': instance.idPessoa,
      'pessoa': instance.pessoa,
      'idCliente': instance.idCliente,
      'cliente': instance.cliente,
      'tipoVinculado': instance.tipoVinculado,
      'ativo': instance.ativo,
    };

AuxiliarProducao _$AuxiliarProducaoFromJson(Map<String, dynamic> json) =>
    AuxiliarProducao()
      ..id = json['id'] as int?
      ..idEmpresa = json['idEmpresa'] as int?
      ..idNota = json['idNota'] as int?
      ..nota = json['nota'] == null
          ? null
          : Nota.fromJson(json['nota'] as Map<String, dynamic>)
      ..idEstacao = json['idEstacao'] as int?
      ..estacao = json['estacao'] == null
          ? null
          : EstacaoTrabalho.fromJson(json['estacao'] as Map<String, dynamic>)
      ..idLocalProducao = json['idLocalProducao'] as int?
      ..localProducao = json['localProducao'] == null
          ? null
          : LocalProducao.fromJson(
              json['localProducao'] as Map<String, dynamic>?)
      ..modulo = json['modulo'] as String?
      ..idUsuarioEmpresa = json['idUsuarioEmpresa'] as int?
      ..usuarioEmpresa = json['usuarioEmpresa'] == null
          ? null
          : UsuarioEmpresa.fromJson(
              json['usuarioEmpresa'] as Map<String, dynamic>)
      ..fechamento = json['fechamento'] as bool?
      ..mensagem = json['mensagem'] as String?
      ..impresso = json['impresso'] as bool?
      ..data =
          json['data'] == null ? null : DateTime.parse(json['data'] as String)
      ..tentativasImpressao = json['tentativasImpressao'] as int?;

Map<String, dynamic> _$AuxiliarProducaoToJson(AuxiliarProducao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'idNota': instance.idNota,
      'nota': instance.nota,
      'idEstacao': instance.idEstacao,
      'estacao': instance.estacao,
      'idLocalProducao': instance.idLocalProducao,
      'localProducao': instance.localProducao,
      'modulo': instance.modulo,
      'idUsuarioEmpresa': instance.idUsuarioEmpresa,
      'usuarioEmpresa': instance.usuarioEmpresa,
      'fechamento': instance.fechamento,
      'mensagem': instance.mensagem,
      'impresso': instance.impresso,
      'data': instance.data?.toIso8601String(),
      'tentativasImpressao': instance.tentativasImpressao,
    };

Bairro _$BairroFromJson(Map<String, dynamic> json) => Bairro()
  ..id = json['id'] as int?
  ..nome = json['nome'] as String?
  ..nomeAbreviado = json['nomeAbreviado'] as String?
  ..cidade = json['cidade'] == null
      ? null
      : Cidade.fromJson(json['cidade'] as Map<String, dynamic>?);

Map<String, dynamic> _$BairroToJson(Bairro instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'nomeAbreviado': instance.nomeAbreviado,
      'cidade': instance.cidade,
    };

Banco _$BancoFromJson(Map<String, dynamic> json) => Banco()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..nome = json['nome'] as String?
  ..codigoBanco = json['codigoBanco'] as String?
  ..site = json['site'] as String?
  ..versao = json['versao'] as int?;

Map<String, dynamic> _$BancoToJson(Banco instance) => <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'nome': instance.nome,
      'codigoBanco': instance.codigoBanco,
      'site': instance.site,
      'versao': instance.versao,
    };

BandeiraCartao _$BandeiraCartaoFromJson(Map<String, dynamic> json) =>
    BandeiraCartao()
      ..id = json['id'] as int?
      ..idEmpresa = json['idEmpresa'] as int?
      ..empresa = json['empresa'] == null
          ? null
          : Empresa.fromJson(json['empresa'] as Map<String, dynamic>)
      ..codigoBandeira = json['codigoBandeira'] as String?
      ..bandeira = json['bandeira'] as String?
      ..descricao = json['descricao'] as String?
      ..operacao = json['operacao'] as String?
      ..tipoTransacao = json['tipoTransacao'] as String?
      ..codificacaoFiscal = json['codificacaoFiscal'] as String?
      ..dadosIntegracao = (json['dadosIntegracao'] as List<dynamic>?)
              ?.map((e) => BandeiraCartaoDadosIntegracao.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          []
      ..versao = json['versao'] as int?
      ..tipoTEF = json['tipoTEF'] as String?
      ..ativo = json['ativo'] as bool?;

Map<String, dynamic> _$BandeiraCartaoToJson(BandeiraCartao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'empresa': instance.empresa,
      'codigoBandeira': instance.codigoBandeira,
      'bandeira': instance.bandeira,
      'descricao': instance.descricao,
      'operacao': instance.operacao,
      'tipoTransacao': instance.tipoTransacao,
      'codificacaoFiscal': instance.codificacaoFiscal,
      'dadosIntegracao': instance.dadosIntegracao,
      'versao': instance.versao,
      'tipoTEF': instance.tipoTEF,
      'ativo': instance.ativo,
    };

BandeiraCartaoDadosIntegracao _$BandeiraCartaoDadosIntegracaoFromJson(
        Map<String, dynamic> json) =>
    BandeiraCartaoDadosIntegracao()
      ..id = json['id'] as int?
      ..idBandeira = json['idBandeira'] as int?
      ..idExterno = json['idExterno'] as String?
      ..versaoClient = json['versaoClient'] as String?
      ..origem = json['origem'] as String?
      ..idClient = json['idClient'] as int?
      ..observacao = json['observacao'] as String?;

Map<String, dynamic> _$BandeiraCartaoDadosIntegracaoToJson(
        BandeiraCartaoDadosIntegracao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idBandeira': instance.idBandeira,
      'idExterno': instance.idExterno,
      'versaoClient': instance.versaoClient,
      'origem': instance.origem,
      'idClient': instance.idClient,
      'observacao': instance.observacao,
    };

CadastroEstacaoTrabalhoDTO _$CadastroEstacaoTrabalhoDTOFromJson(
        Map<String, dynamic> json) =>
    CadastroEstacaoTrabalhoDTO()
      ..estacaoTrabalho = json['estacaoTrabalho'] == null
          ? null
          : EstacaoTrabalho.fromJson(
              json['estacaoTrabalho'] as Map<String, dynamic>)
      ..impressoraGeral = json['impressoraGeral'] == null
          ? null
          : EquipamentoImpressao.fromJson(
              json['impressoraGeral'] as Map<String, dynamic>)
      ..listImpressorasProducao =
          (json['listImpressorasProducao'] as List<dynamic>?)
                  ?.map((e) => CadastroImpressoraProducaoDto.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [];

Map<String, dynamic> _$CadastroEstacaoTrabalhoDTOToJson(
        CadastroEstacaoTrabalhoDTO instance) =>
    <String, dynamic>{
      'estacaoTrabalho': instance.estacaoTrabalho,
      'impressoraGeral': instance.impressoraGeral,
      'listImpressorasProducao': instance.listImpressorasProducao,
    };

CadastroImpressoraProducaoDto _$CadastroImpressoraProducaoDtoFromJson(
        Map<String, dynamic> json) =>
    CadastroImpressoraProducaoDto()
      ..localProducao = json['localProducao'] == null
          ? null
          : LocalProducao.fromJson(
              json['localProducao'] as Map<String, dynamic>?)
      ..impressora = json['impressora'] == null
          ? null
          : EquipamentoImpressao.fromJson(
              json['impressora'] as Map<String, dynamic>);

Map<String, dynamic> _$CadastroImpressoraProducaoDtoToJson(
        CadastroImpressoraProducaoDto instance) =>
    <String, dynamic>{
      'localProducao': instance.localProducao,
      'impressora': instance.impressora,
    };

Campanha _$CampanhaFromJson(Map<String, dynamic> json) => Campanha()
  ..ID = json['ID'] as int?
  ..descricao = json['descricao'] as String?;

Map<String, dynamic> _$CampanhaToJson(Campanha instance) => <String, dynamic>{
      'ID': instance.ID,
      'descricao': instance.descricao,
    };

Cardapio _$CardapioFromJson(Map<String, dynamic> json) => Cardapio()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..descricao = json['descricao'] as String?
  ..versao = json['versao'] as int?;

Map<String, dynamic> _$CardapioToJson(Cardapio instance) => <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'descricao': instance.descricao,
      'versao': instance.versao,
    };

CardapioMenu _$CardapioMenuFromJson(Map<String, dynamic> json) => CardapioMenu()
  ..id = json['id'] as int?
  ..tipo = json['tipo'] as String?
  ..precoCombinado = json['precoCombinado'] as String?
  ..idProdutoEmpresa = json['idProdutoEmpresa'] as int?
  ..produto = json['produto'] == null
      ? null
      : ProdutoEmpresa.fromJson(json['produto'] as Map<String, dynamic>)
  ..idProdutoGrupo = json['idProdutoGrupo'] as int?
  ..grupo = json['grupo'] == null
      ? null
      : ProdutoGrupo.fromJson(json['grupo'] as Map<String, dynamic>)
  ..indice = json['indice'] as int?
  ..descricao = json['descricao'] as String?
  ..backcolor = json['backcolor'] as String?
  ..fontColor = json['fontColor'] as String?
  ..fontBold = json['fontBold'] as bool?
  ..fontItalic = json['fontItalic'] as bool?
  ..fontSize = json['fontSize'] as int?
  ..icon = json['icon'] as String?
  ..tabelaPrecos = (json['tabelaPrecos'] as List<dynamic>?)
          ?.map((e) => TabelaPreco.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..combinadoTamanhos = (json['combinadoTamanhos'] as List<dynamic>?)
          ?.map((e) => CombinadoTamanho.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..combinadoSabores = (json['combinadoSabores'] as List<dynamic>?)
          ?.map((e) => ProdutoEmpresa.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..itens = (json['itens'] as List<dynamic>?)
          ?.map((e) => ProdutoEmpresa.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..icone = json['icone'] == null
      ? null
      : BibliotecaIcone.fromJson(json['icone'] as Map<String, dynamic>);

Map<String, dynamic> _$CardapioMenuToJson(CardapioMenu instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tipo': instance.tipo,
      'precoCombinado': instance.precoCombinado,
      'idProdutoEmpresa': instance.idProdutoEmpresa,
      'produto': instance.produto,
      'idProdutoGrupo': instance.idProdutoGrupo,
      'grupo': instance.grupo,
      'indice': instance.indice,
      'descricao': instance.descricao,
      'backcolor': instance.backcolor,
      'fontColor': instance.fontColor,
      'fontBold': instance.fontBold,
      'fontItalic': instance.fontItalic,
      'fontSize': instance.fontSize,
      'icon': instance.icon,
      'tabelaPrecos': instance.tabelaPrecos,
      'combinadoTamanhos': instance.combinadoTamanhos,
      'combinadoSabores': instance.combinadoSabores,
      'itens': instance.itens,
      'icone': instance.icone,
    };

Classificacao _$ClassificacaoFromJson(Map<String, dynamic> json) =>
    Classificacao()
      ..id = json['id'] as int?
      ..idEmpresa = json['idEmpresa'] as int?
      ..descricao = json['descricao'] as String?
      ..percentualDesconto = json['percentualDesconto'] == null
          ? null
          : BigDecimal.fromJson(json['percentualDesconto'])
      ..tipo = json['tipo'] as String?
      ..versao = json['versao'] as int?;

Map<String, dynamic> _$ClassificacaoToJson(Classificacao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'descricao': instance.descricao,
      'percentualDesconto': instance.percentualDesconto,
      'tipo': instance.tipo,
      'versao': instance.versao,
    };

Client _$ClientFromJson(Map<String, dynamic> json) => Client()
  ..id = json['id'] as int?
  ..nome = json['nome'] as String?
  ..clientKey = json['clientKey'] as String?
  ..descricao = json['descricao'] as String?
  ..servico = json['servico'] as String?
  ..ativo = json['ativo'] as bool?
  ..segmentos =
      (json['segmentos'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          [];

Map<String, dynamic> _$ClientToJson(Client instance) => <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'clientKey': instance.clientKey,
      'descricao': instance.descricao,
      'servico': instance.servico,
      'ativo': instance.ativo,
      'segmentos': instance.segmentos,
    };

ClientEmpresa _$ClientEmpresaFromJson(Map<String, dynamic> json) =>
    ClientEmpresa()
      ..id = json['id'] as int?
      ..clientSecret = json['clientSecret'] as String?
      ..ativo = json['ativo'] as bool?
      ..idEmpresa = json['idEmpresa'] as int?
      ..idClient = json['idClient'] as int?
      ..client = json['client'] == null
          ? null
          : Client.fromJson(json['client'] as Map<String, dynamic>)
      ..ultimaComunicacao = json['ultimaComunicacao'] == null
          ? null
          : DateTime.parse(json['ultimaComunicacao'] as String);

Map<String, dynamic> _$ClientEmpresaToJson(ClientEmpresa instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clientSecret': instance.clientSecret,
      'ativo': instance.ativo,
      'idEmpresa': instance.idEmpresa,
      'idClient': instance.idClient,
      'client': instance.client,
      'ultimaComunicacao': instance.ultimaComunicacao?.toIso8601String(),
    };

Cliente _$ClienteFromJson(Map<String, dynamic> json) => Cliente()
  ..idPessoa = json['idPessoa'] as int?
  ..pessoa = json['pessoa'] == null
      ? null
      : Pessoa.fromJson(json['pessoa'] as Map<String, dynamic>)
  ..senha = json['senha'] as String?
  ..mensagemEletronica = json['mensagemEletronica'] as bool?
  ..restricaoAcesso = json['restricaoAcesso'] as bool?
  ..classificacao = json['classificacao'] == null
      ? null
      : Classificacao.fromJson(json['classificacao'] as Map<String, dynamic>)
  ..observacao = json['observacao'] as String?
  ..historico = json['historico'] as String?
  ..tipoContribuinte = json['tipoContribuinte'] as String?
  ..versao = json['versao'] as int?
  ..autorizados = (json['autorizados'] as List<dynamic>?)
          ?.map((e) => ClienteAutorizado.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..ocorrencias = (json['ocorrencias'] as List<dynamic>?)
          ?.map((e) => ClienteOcorrencia.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..vinculo = json['vinculo'] == null
      ? null
      : ClienteVinculo.fromJson(json['vinculo'] as Map<String, dynamic>?)
  ..crediario = json['crediario'] == null
      ? null
      : ClienteCrediario.fromJson(json['crediario'] as Map<String, dynamic>)
  ..mensalista = json['mensalista'] == null
      ? null
      : ClienteMensalista.fromJson(json['mensalista'] as Map<String, dynamic>?)
  ..controleCadastro = json['controleCadastro'] == null
      ? null
      : ControleCadastro.fromJson(
          json['controleCadastro'] as Map<String, dynamic>?);

Map<String, dynamic> _$ClienteToJson(Cliente instance) => <String, dynamic>{
      'idPessoa': instance.idPessoa,
      'pessoa': instance.pessoa,
      'senha': instance.senha,
      'mensagemEletronica': instance.mensagemEletronica,
      'restricaoAcesso': instance.restricaoAcesso,
      'classificacao': instance.classificacao,
      'observacao': instance.observacao,
      'historico': instance.historico,
      'tipoContribuinte': instance.tipoContribuinte,
      'versao': instance.versao,
      'autorizados': instance.autorizados,
      'ocorrencias': instance.ocorrencias,
      'vinculo': instance.vinculo,
      'crediario': instance.crediario,
      'mensalista': instance.mensalista,
      'controleCadastro': instance.controleCadastro,
    };

ClienteCartao _$ClienteCartaoFromJson(Map<String, dynamic> json) =>
    ClienteCartao()
      ..id = json['id'] as int?
      ..idCliente = json['idCliente'] as int?
      ..numero = json['numero'] as String?
      ..bandeira = json['bandeira'] == null
          ? null
          : BandeiraCartao.fromJson(json['bandeira'] as Map<String, dynamic>)
      ..status = json['status'] as String?
      ..validade = json['validade'] == null
          ? null
          : DateTime.parse(json['validade'] as String)
      ..vencimento = json['vencimento'] as int?
      ..limite =
          json['limite'] == null ? null : BigDecimal.fromJson(json['limite'])
      ..saldo =
          json['saldo'] == null ? null : BigDecimal.fromJson(json['saldo'])
      ..token = json['token'] as int?;

Map<String, dynamic> _$ClienteCartaoToJson(ClienteCartao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idCliente': instance.idCliente,
      'numero': instance.numero,
      'bandeira': instance.bandeira,
      'status': instance.status,
      'validade': instance.validade?.toIso8601String(),
      'vencimento': instance.vencimento,
      'limite': instance.limite,
      'saldo': instance.saldo,
      'token': instance.token,
    };

ClienteCrediario _$ClienteCrediarioFromJson(Map<String, dynamic> json) =>
    ClienteCrediario()
      ..diaVencimento = json['diaVencimento'] as int?
      ..limiteCredito = json['limiteCredito'] == null
          ? null
          : BigDecimal.fromJson(json['limiteCredito'])
      ..limiteDisponivel = json['limiteDisponivel'] == null
          ? null
          : BigDecimal.fromJson(json['limiteDisponivel'])
      ..saldoHaver = json['saldoHaver'] == null
          ? null
          : BigDecimal.fromJson(json['saldoHaver'])
      ..referenciaPessoal = json['referenciaPessoal'] as String?
      ..referenciaComercial = json['referenciaComercial'] as String?
      ..tipoFaturamento = json['tipoFaturamento'] as String?
      ..caucao = json['caucao'] as bool?
      ..contrato = json['contrato'] as String?
      ..idStatusCredito = json['idStatusCredito'] as int?
      ..statusCredito = json['statusCredito'] == null
          ? null
          : StatusCredito.fromJson(
              json['statusCredito'] as Map<String, dynamic>?);

Map<String, dynamic> _$ClienteCrediarioToJson(ClienteCrediario instance) =>
    <String, dynamic>{
      'diaVencimento': instance.diaVencimento,
      'limiteCredito': instance.limiteCredito,
      'limiteDisponivel': instance.limiteDisponivel,
      'saldoHaver': instance.saldoHaver,
      'referenciaPessoal': instance.referenciaPessoal,
      'referenciaComercial': instance.referenciaComercial,
      'tipoFaturamento': instance.tipoFaturamento,
      'caucao': instance.caucao,
      'contrato': instance.contrato,
      'idStatusCredito': instance.idStatusCredito,
      'statusCredito': instance.statusCredito,
    };

ClienteQuestDTO _$ClienteQuestDTOFromJson(Map<String, dynamic> json) =>
    ClienteQuestDTO()
      ..cliente = json['cliente'] == null
          ? null
          : Cliente.fromJson(json['cliente'] as Map<String, dynamic>)
      ..participante = json['participante'] == null
          ? null
          : Participante.fromJson(json['participante'] as Map<String, dynamic>)
      ..notaQuest = json['notaQuest'] == null
          ? null
          : NotaQuest.fromJson(json['notaQuest'] as Map<String, dynamic>)
      ..campanhas = (json['campanhas'] as List<dynamic>?)
              ?.map((e) => Campanha.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..historicoCompras = (json['historicoCompras'] as List<dynamic>?)
              ?.map((e) => HistoricoCompras.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

Map<String, dynamic> _$ClienteQuestDTOToJson(ClienteQuestDTO instance) =>
    <String, dynamic>{
      'cliente': instance.cliente,
      'participante': instance.participante,
      'notaQuest': instance.notaQuest,
      'campanhas': instance.campanhas,
      'historicoCompras': instance.historicoCompras,
    };

CondicaoPagamento _$CondicaoPagamentoFromJson(Map<String, dynamic> json) =>
    CondicaoPagamento()
      ..id = json['id'] as int?
      ..idEmpresa = json['idEmpresa'] as int?
      ..descricao = json['descricao'] as String?
      ..taxaMensal = json['taxaMensal'] == null
          ? null
          : BigDecimal.fromJson(json['taxaMensal'])
      ..valorMinimo = json['valorMinimo'] == null
          ? null
          : BigDecimal.fromJson(json['valorMinimo'])
      ..finalizadoraEmpresa = json['finalizadoraEmpresa'] == null
          ? null
          : FinalizadoraEmpresa.fromJson(
              json['finalizadoraEmpresa'] as Map<String, dynamic>)
      ..operacao = json['operacao'] as String?
      ..acrescimoDesconto = json['acrescimoDesconto'] as String?
      ..percentualAcrescimoDesconto =
          json['percentualAcrescimoDesconto'] == null
              ? null
              : BigDecimal.fromJson(json['percentualAcrescimoDesconto'])
      ..percentualEntradaMinima = json['percentualEntradaMinima'] == null
          ? null
          : BigDecimal.fromJson(json['percentualEntradaMinima'])
      ..exigeAutorizacao = json['exigeAutorizacao'] as bool?
      ..ativo = json['ativo'] as bool?
      ..versao = json['versao'] as int?;

Map<String, dynamic> _$CondicaoPagamentoToJson(CondicaoPagamento instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'descricao': instance.descricao,
      'taxaMensal': instance.taxaMensal,
      'valorMinimo': instance.valorMinimo,
      'finalizadoraEmpresa': instance.finalizadoraEmpresa,
      'operacao': instance.operacao,
      'acrescimoDesconto': instance.acrescimoDesconto,
      'percentualAcrescimoDesconto': instance.percentualAcrescimoDesconto,
      'percentualEntradaMinima': instance.percentualEntradaMinima,
      'exigeAutorizacao': instance.exigeAutorizacao,
      'ativo': instance.ativo,
      'versao': instance.versao,
    };

ConferenciaCaixa _$ConferenciaCaixaFromJson(Map<String, dynamic> json) =>
    ConferenciaCaixa()
      ..turno = json['turno'] == null
          ? null
          : Turno.fromJson(json['turno'] as Map<String, dynamic>)
      ..listaNota = (json['listaNota'] as List<dynamic>?)
              ?.map((e) => Nota.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..finalizadoraVendas =
          (json['finalizadoraVendas'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, BigDecimal.fromJson(e)),
      )
      ..produtosVendidos =
          (json['produtosVendidos'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, BigDecimal.fromJson(e)),
      )
      ..listaOperacoes = (json['listaOperacoes'] as List<dynamic>?)
              ?.map((e) => Operacao.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..desdobramentoGarcom = (json['desdobramentoGarcom'] as List<dynamic>?)
              ?.map((e) =>
                  DesdobramentoGarcom.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..desdobramentoVenda = json['desdobramentoVenda'] == null
          ? null
          : DesdobramentoVenda.fromJson(
              json['desdobramentoVenda'] as Map<String, dynamic>)
      ..desdobramentoModulo = (json['desdobramentoModulo'] as List<dynamic>?)
              ?.map((e) =>
                  DesdobramentoModulo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..saldo =
          json['saldo'] == null ? null : BigDecimal.fromJson(json['saldo'])
      ..totalRecebimentoParcial =
          (json['totalRecebimentoParcial'] as List<dynamic>?)
                  ?.map((e) => TotalRecebimentoParcialDTO.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              [];

Map<String, dynamic> _$ConferenciaCaixaToJson(ConferenciaCaixa instance) =>
    <String, dynamic>{
      'turno': instance.turno,
      'listaNota': instance.listaNota,
      'finalizadoraVendas': instance.finalizadoraVendas,
      'produtosVendidos': instance.produtosVendidos,
      'listaOperacoes': instance.listaOperacoes,
      'desdobramentoGarcom': instance.desdobramentoGarcom,
      'desdobramentoVenda': instance.desdobramentoVenda,
      'desdobramentoModulo': instance.desdobramentoModulo,
      'saldo': instance.saldo,
      'totalRecebimentoParcial': instance.totalRecebimentoParcial,
    };

Consumo _$ConsumoFromJson(Map<String, dynamic> json) => Consumo()
  ..id = json['id'] as int?
  ..modulo = json['modulo'] as String?
  ..dataAbertura = json['dataAbertura'] == null
      ? null
      : DateTime.parse(json['dataAbertura'] as String)
  ..dataAtualizacao = json['dataAtualizacao'] == null
      ? null
      : DateTime.parse(json['dataAtualizacao'] as String)
  ..dataFechamento = json['dataFechamento'] == null
      ? null
      : DateTime.parse(json['dataFechamento'] as String)
  ..dataEntrega = json['dataEntrega'] == null
      ? null
      : DateTime.parse(json['dataEntrega'] as String)
  ..comanda = json['comanda'] as int?
  ..senhaAtendimento = json['senhaAtendimento'] as String?
  ..pessoas = json['pessoas'] as int?
  ..observacao = json['observacao'] as String?
  ..mesa = json['mesa'] as int?
  ..tipoDesconto = json['tipoDesconto'] as String
  ..preDesconto = BigDecimal.fromJson(json['preDesconto'])
  ..consumosJuntados = (json['consumosJuntados'] as List<dynamic>?)
          ?.map((e) => Consumo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..idConsumoOrigemRecebimento = json['idConsumoOrigemRecebimento'] as int?
  ..consumosOrigemRecebimentos =
      (json['consumosOrigemRecebimentos'] as List<dynamic>?)
              ?.map((e) => Consumo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
  ..evento = json['evento'] == null
      ? null
      : Evento.fromJson(json['evento'] as Map<String, dynamic>?)
  ..perfil = json['perfil'] == null
      ? null
      : Perfil.fromJson(json['perfil'] as Map<String, dynamic>)
  ..promoter = json['promoter'] == null
      ? null
      : Funcionario.fromJson(json['promoter'] as Map<String, dynamic>)
  ..limite = json['limite'] == null ? null : BigDecimal.fromJson(json['limite'])
  ..tipoEntrega = json['tipoEntrega'] as String?
  ..entregue = json['entregue'] as bool?;

Map<String, dynamic> _$ConsumoToJson(Consumo instance) => <String, dynamic>{
      'id': instance.id,
      'modulo': instance.modulo,
      'dataAbertura': instance.dataAbertura?.toIso8601String(),
      'dataAtualizacao': instance.dataAtualizacao?.toIso8601String(),
      'dataFechamento': instance.dataFechamento?.toIso8601String(),
      'dataEntrega': instance.dataEntrega?.toIso8601String(),
      'comanda': instance.comanda,
      'senhaAtendimento': instance.senhaAtendimento,
      'pessoas': instance.pessoas,
      'observacao': instance.observacao,
      'mesa': instance.mesa,
      'tipoDesconto': instance.tipoDesconto,
      'preDesconto': instance.preDesconto,
      'consumosJuntados': instance.consumosJuntados,
      'idConsumoOrigemRecebimento': instance.idConsumoOrigemRecebimento,
      'consumosOrigemRecebimentos': instance.consumosOrigemRecebimentos,
      'evento': instance.evento,
      'perfil': instance.perfil,
      'promoter': instance.promoter,
      'limite': instance.limite,
      'tipoEntrega': instance.tipoEntrega,
      'entregue': instance.entregue,
    };

ContaCorrente _$ContaCorrenteFromJson(Map<String, dynamic> json) =>
    ContaCorrente()
      ..id = json['id'] as int?
      ..idEmpresa = json['idEmpresa'] as int?
      ..empresa = json['empresa'] == null
          ? null
          : Empresa.fromJson(json['empresa'] as Map<String, dynamic>)
      ..nome = json['nome'] as String?
      ..interna = json['interna'] as bool?
      ..agencia = json['agencia'] as String?
      ..agenciaDigito = json['agenciaDigito'] as String?
      ..conta = json['conta'] as String?
      ..contaDigito = json['contaDigito'] as String?
      ..ativo = json['ativo'] as bool?
      ..idBanco = json['idBanco'] as int?
      ..banco = json['banco'] == null
          ? null
          : Banco.fromJson(json['banco'] as Map<String, dynamic>)
      ..saldo =
          json['saldo'] == null ? null : BigDecimal.fromJson(json['saldo'])
      ..padrao = json['padrao'] as bool?
      ..versao = json['versao'] as int?;

Map<String, dynamic> _$ContaCorrenteToJson(ContaCorrente instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'empresa': instance.empresa,
      'nome': instance.nome,
      'interna': instance.interna,
      'agencia': instance.agencia,
      'agenciaDigito': instance.agenciaDigito,
      'conta': instance.conta,
      'contaDigito': instance.contaDigito,
      'ativo': instance.ativo,
      'idBanco': instance.idBanco,
      'banco': instance.banco,
      'saldo': instance.saldo,
      'padrao': instance.padrao,
      'versao': instance.versao,
    };

ContratoExtra _$ContratoExtraFromJson(Map<String, dynamic> json) =>
    ContratoExtra()
      ..pacoteExtra = json['pacoteExtra'] as String?
      ..descricao = json['descricao'] as String?
      ..descricaoCompleta = json['descricaoCompleta'] as String?
      ..gratuito = json['gratuito'] as bool?
      ..disponivel = json['disponivel'] as bool?
      ..valor =
          json['valor'] == null ? null : BigDecimal.fromJson(json['valor']);

Map<String, dynamic> _$ContratoExtraToJson(ContratoExtra instance) =>
    <String, dynamic>{
      'pacoteExtra': instance.pacoteExtra,
      'descricao': instance.descricao,
      'descricaoCompleta': instance.descricaoCompleta,
      'gratuito': instance.gratuito,
      'disponivel': instance.disponivel,
      'valor': instance.valor,
    };

DesdobramentoGarcom _$DesdobramentoGarcomFromJson(Map<String, dynamic> json) =>
    DesdobramentoGarcom()
      ..vendedor = json['vendedor'] == null
          ? null
          : Funcionario.fromJson(json['vendedor'] as Map<String, dynamic>)
      ..vendasProduto = json['vendasProduto'] == null
          ? null
          : BigDecimal.fromJson(json['vendasProduto'])
      ..vendasServico = json['vendasServico'] == null
          ? null
          : BigDecimal.fromJson(json['vendasServico']);

Map<String, dynamic> _$DesdobramentoGarcomToJson(
        DesdobramentoGarcom instance) =>
    <String, dynamic>{
      'vendedor': instance.vendedor,
      'vendasProduto': instance.vendasProduto,
      'vendasServico': instance.vendasServico,
    };

DesdobramentoModulo _$DesdobramentoModuloFromJson(Map<String, dynamic> json) =>
    DesdobramentoModulo()
      ..modulo = json['modulo'] as String?
      ..taxaServico = json['taxaServico'] == null
          ? null
          : BigDecimal.fromJson(json['taxaServico'])
      ..vendasProduto = json['vendasProduto'] == null
          ? null
          : BigDecimal.fromJson(json['vendasProduto'])
      ..vendasServico = json['vendasServico'] == null
          ? null
          : BigDecimal.fromJson(json['vendasServico']);

Map<String, dynamic> _$DesdobramentoModuloToJson(
        DesdobramentoModulo instance) =>
    <String, dynamic>{
      'modulo': instance.modulo,
      'taxaServico': instance.taxaServico,
      'vendasProduto': instance.vendasProduto,
      'vendasServico': instance.vendasServico,
    };

DesdobramentoVenda _$DesdobramentoVendaFromJson(Map<String, dynamic> json) =>
    DesdobramentoVenda()
      ..totalAcrescimo = json['totalAcrescimo'] == null
          ? null
          : BigDecimal.fromJson(json['totalAcrescimo'])
      ..acrescimoManual = json['acrescimoManual'] == null
          ? null
          : BigDecimal.fromJson(json['acrescimoManual'])
      ..acrescimoTaxaServico = json['acrescimoTaxaServico'] == null
          ? null
          : BigDecimal.fromJson(json['acrescimoTaxaServico'])
      ..acrescimoTaxaEntrega = json['acrescimoTaxaEntrega'] == null
          ? null
          : BigDecimal.fromJson(json['acrescimoTaxaEntrega'])
      ..totalDesconto = json['totalDesconto'] == null
          ? null
          : BigDecimal.fromJson(json['totalDesconto'])
      ..descontoManual = json['descontoManual'] == null
          ? null
          : BigDecimal.fromJson(json['descontoManual'])
      ..descontoPromocao = json['descontoPromocao'] == null
          ? null
          : BigDecimal.fromJson(json['descontoPromocao'])
      ..isencaoTaxaServico = json['isencaoTaxaServico'] == null
          ? null
          : BigDecimal.fromJson(json['isencaoTaxaServico'])
      ..isencaoTaxaEntrega = json['isencaoTaxaEntrega'] == null
          ? null
          : BigDecimal.fromJson(json['isencaoTaxaEntrega'])
      ..totalDeducao = json['totalDeducao'] == null
          ? null
          : BigDecimal.fromJson(json['totalDeducao'])
      ..cancelamento = json['cancelamento'] == null
          ? null
          : BigDecimal.fromJson(json['cancelamento'])
      ..vendaBruta = json['vendaBruta'] == null
          ? null
          : BigDecimal.fromJson(json['vendaBruta']);

Map<String, dynamic> _$DesdobramentoVendaToJson(DesdobramentoVenda instance) =>
    <String, dynamic>{
      'totalAcrescimo': instance.totalAcrescimo,
      'acrescimoManual': instance.acrescimoManual,
      'acrescimoTaxaServico': instance.acrescimoTaxaServico,
      'acrescimoTaxaEntrega': instance.acrescimoTaxaEntrega,
      'totalDesconto': instance.totalDesconto,
      'descontoManual': instance.descontoManual,
      'descontoPromocao': instance.descontoPromocao,
      'isencaoTaxaServico': instance.isencaoTaxaServico,
      'isencaoTaxaEntrega': instance.isencaoTaxaEntrega,
      'totalDeducao': instance.totalDeducao,
      'cancelamento': instance.cancelamento,
      'vendaBruta': instance.vendaBruta,
    };

DtoNota _$DtoNotaFromJson(Map<String, dynamic> json) => DtoNota()
  ..nota = json['nota'] == null
      ? null
      : Nota.fromJson(json['nota'] as Map<String, dynamic>)
  ..notaItemList = (json['notaItemList'] as List<dynamic>?)
          ?.map((e) => NotaItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..notaFinalizadoraList = (json['notaFinalizadoraList'] as List<dynamic>?)
          ?.map((e) => NotaFinalizadora.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [];

Map<String, dynamic> _$DtoNotaToJson(DtoNota instance) => <String, dynamic>{
      'nota': instance.nota,
      'notaItemList': instance.notaItemList,
      'notaFinalizadoraList': instance.notaFinalizadoraList,
    };

EmitenteCheque _$EmitenteChequeFromJson(Map<String, dynamic> json) =>
    EmitenteCheque()
      ..idPessoa = json['idPessoa'] as int?
      ..pessoa = json['pessoa'] == null
          ? null
          : Pessoa.fromJson(json['pessoa'] as Map<String, dynamic>)
      ..limite =
          json['limite'] == null ? null : BigDecimal.fromJson(json['limite'])
      ..observacao = json['observacao'] as String?
      ..statusCredito = json['statusCredito'] == null
          ? null
          : StatusCredito.fromJson(
              json['statusCredito'] as Map<String, dynamic>?)
      ..versao = json['versao'] as int?
      ..controleCadastro = json['controleCadastro'] == null
          ? null
          : ControleCadastro.fromJson(
              json['controleCadastro'] as Map<String, dynamic>?);

Map<String, dynamic> _$EmitenteChequeToJson(EmitenteCheque instance) =>
    <String, dynamic>{
      'idPessoa': instance.idPessoa,
      'pessoa': instance.pessoa,
      'limite': instance.limite,
      'observacao': instance.observacao,
      'statusCredito': instance.statusCredito,
      'versao': instance.versao,
      'controleCadastro': instance.controleCadastro,
    };

Empresa _$EmpresaFromJson(Map<String, dynamic> json) => Empresa()
  ..id = json['id'] as int?
  ..pessoa = json['pessoa'] == null
      ? null
      : Pessoa.fromJson(json['pessoa'] as Map<String, dynamic>)
  ..numeroLoja = json['numeroLoja'] as int?
  ..codificacaoEAN = json['codificacaoEAN'] as bool?
  ..sugestaoCodigo = json['sugestaoCodigo'] as String?
  ..tipoEmpresa = json['tipoEmpresa'] as String?
  ..idMatriz = json['idMatriz'] as int?
  ..matriz = json['matriz'] == null
      ? null
      : Empresa.fromJson(json['matriz'] as Map<String, dynamic>)
  ..idIntegrador = json['idIntegrador'] as int?
  ..integrador = json['integrador'] == null
      ? null
      : Empresa.fromJson(json['integrador'] as Map<String, dynamic>)
  ..licencaChave = json['licencaChave'] as String?
  ..controleCadastro = json['controleCadastro'] == null
      ? null
      : ControleCadastro.fromJson(
          json['controleCadastro'] as Map<String, dynamic>?)
  ..condicaoPagamentoPadrao = json['condicaoPagamentoPadrao'] == null
      ? null
      : CondicaoPagamento.fromJson(
          json['condicaoPagamentoPadrao'] as Map<String, dynamic>)
  ..statusCreditoPadrao = json['statusCreditoPadrao'] == null
      ? null
      : StatusCredito.fromJson(
          json['statusCreditoPadrao'] as Map<String, dynamic>?)
  ..venda = json['venda'] == null
      ? null
      : EmpresaVenda.fromJson(json['venda'] as Map<String, dynamic>)
  ..fiscal = json['fiscal'] == null
      ? null
      : EmpresaFiscal.fromJson(json['fiscal'] as Map<String, dynamic>?)
  ..empresaIntegrador = json['empresaIntegrador'] == null
      ? null
      : EmpresaIntegrador.fromJson(
          json['empresaIntegrador'] as Map<String, dynamic>)
  ..contadorVenda = json['contadorVenda'] as int?
  ..modoValorizacaoEstoque = json['modoValorizacaoEstoque'] as String?
  ..taxaRoyalty = json['taxaRoyalty'] == null
      ? null
      : BigDecimal.fromJson(json['taxaRoyalty'])
  ..taxaMarketing = json['taxaMarketing'] == null
      ? null
      : BigDecimal.fromJson(json['taxaMarketing'])
  ..versao = json['versao'] as int?
  ..credenciaisIfood = json['credenciaisIfood'] == null
      ? null
      : CredenciaisIfood.fromJson(
          json['credenciaisIfood'] as Map<String, dynamic>?)
  ..segmento = json['segmento'] as String?
  ..mixImportado = json['mixImportado'] as bool?
  ..empresaContratos = (json['empresaContratos'] as List<dynamic>?)
          ?.map((e) => EmpresaContrato.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..fusoHorario = json['fusoHorario'] == null
      ? null
      : EmpresaFusoHorario.fromJson(
          json['fusoHorario'] as Map<String, dynamic>?)
  ..idConsultor = json['idConsultor'] as int?
  ..idRegiao = json['idRegiao'] as int?
  ..confirmado = json['confirmado'] as bool?
  ..testando = json['testando'] as bool?
  ..vencimentoTeste = json['vencimentoTeste'] == null
      ? null
      : DateTime.parse(json['vencimentoTeste'] as String)
  ..idFlowdesk = json['idFlowdesk'] as int?
  ..ondeNosConheceu = json['ondeNosConheceu'] as String?
  ..empresaContrato = json['empresaContrato'] == null
      ? null
      : EmpresaContrato.fromJson(
          json['empresaContrato'] as Map<String, dynamic>)
  ..proximoContrato = json['proximoContrato'] == null
      ? null
      : EmpresaContrato.fromJson(
          json['proximoContrato'] as Map<String, dynamic>)
  ..controleTurno = json['controleTurno'] as String?;

Map<String, dynamic> _$EmpresaToJson(Empresa instance) => <String, dynamic>{
      'id': instance.id,
      'pessoa': instance.pessoa,
      'numeroLoja': instance.numeroLoja,
      'codificacaoEAN': instance.codificacaoEAN,
      'sugestaoCodigo': instance.sugestaoCodigo,
      'tipoEmpresa': instance.tipoEmpresa,
      'idMatriz': instance.idMatriz,
      'matriz': instance.matriz,
      'idIntegrador': instance.idIntegrador,
      'integrador': instance.integrador,
      'licencaChave': instance.licencaChave,
      'controleCadastro': instance.controleCadastro,
      'condicaoPagamentoPadrao': instance.condicaoPagamentoPadrao,
      'statusCreditoPadrao': instance.statusCreditoPadrao,
      'venda': instance.venda,
      'fiscal': instance.fiscal,
      'empresaIntegrador': instance.empresaIntegrador,
      'contadorVenda': instance.contadorVenda,
      'modoValorizacaoEstoque': instance.modoValorizacaoEstoque,
      'taxaRoyalty': instance.taxaRoyalty,
      'taxaMarketing': instance.taxaMarketing,
      'versao': instance.versao,
      'credenciaisIfood': instance.credenciaisIfood,
      'segmento': instance.segmento,
      'mixImportado': instance.mixImportado,
      'empresaContratos': instance.empresaContratos,
      'fusoHorario': instance.fusoHorario,
      'idConsultor': instance.idConsultor,
      'idRegiao': instance.idRegiao,
      'confirmado': instance.confirmado,
      'testando': instance.testando,
      'vencimentoTeste': instance.vencimentoTeste?.toIso8601String(),
      'idFlowdesk': instance.idFlowdesk,
      'ondeNosConheceu': instance.ondeNosConheceu,
      'empresaContrato': instance.empresaContrato,
      'proximoContrato': instance.proximoContrato,
      'controleTurno': instance.controleTurno,
    };

EmpresaContrato _$EmpresaContratoFromJson(Map<String, dynamic> json) =>
    EmpresaContrato()
      ..id = json['id'] as int?
      ..idEmpresa = json['idEmpresa'] as int?
      ..tipoContrato = json['tipoContrato'] as String?
      ..vigenciaInicio = json['vigenciaInicio'] == null
          ? null
          : DateTime.parse(json['vigenciaInicio'] as String)
      ..vigenciaFim = json['vigenciaFim'] == null
          ? null
          : DateTime.parse(json['vigenciaFim'] as String)
      ..diasTrial = json['diasTrial'] as int?
      ..numeroUsuarios = json['numeroUsuarios'] as int?
      ..moduloEstoque = json['moduloEstoque'] as bool?
      ..moduloGrade = json['moduloGrade'] as bool?
      ..moduloPacoteProduto = json['moduloPacoteProduto'] as bool?
      ..moduloObservacaoProduto = json['moduloObservacaoProduto'] as bool?
      ..moduloPromocao = json['moduloPromocao'] as bool?
      ..moduloFinanceiro = json['moduloFinanceiro'] as bool?
      ..moduloFicha = json['moduloFicha'] as bool?
      ..moduloMesa = json['moduloMesa'] as bool?
      ..moduloDelivery = json['moduloDelivery'] as bool?
      ..moduloCartao = json['moduloCartao'] as bool?
      ..moduloBalcao = json['moduloBalcao'] as bool?
      ..moduloDriveThru = json['moduloDriveThru'] as bool?
      ..moduloAutoatendimento = json['moduloAutoatendimento'] as bool?
      ..aplicativoWaychef = json['aplicativoWaychef'] as bool?
      ..servicoImpressao = json['servicoImpressao'] as bool?
      ..integracaoAlfaSync = json['integracaoAlfaSync'] as bool?
      ..integracaoUnicid = json['integracaoUnicid'] as bool?
      ..modoHibrido = json['modoHibrido'] as bool?
      ..venderWaycard = json['venderWaycard'] as bool?
      ..recorrenciaContrato = json['recorrenciaContrato'] as String?
      ..valorContrato = json['valorContrato'] == null
          ? null
          : BigDecimal.fromJson(json['valorContrato'])
      ..valorTotalContrato = json['valorTotalContrato'] == null
          ? null
          : BigDecimal.fromJson(json['valorTotalContrato'])
      ..dataPrimeiraAssinatura = json['dataPrimeiraAssinatura'] == null
          ? null
          : DateTime.parse(json['dataPrimeiraAssinatura'] as String)
      ..vencimentoContrato = json['vencimentoContrato'] == null
          ? null
          : DateTime.parse(json['vencimentoContrato'] as String)
      ..dataContratacao = json['dataContratacao'] == null
          ? null
          : DateTime.parse(json['dataContratacao'] as String)
      ..dataCancelamento = json['dataCancelamento'] == null
          ? null
          : DateTime.parse(json['dataCancelamento'] as String)
      ..contratoCancelado = json['contratoCancelado'] as bool?
      ..exibirAletaVencimento = json['exibirAletaVencimento'] as bool?
      ..contratoExtra = (json['contratoExtra'] as List<dynamic>?)
              ?.map((e) =>
                  EmpresaContratoExtra.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..limiteProdutos = json['limiteProdutos'] as int?
      ..limiteFaturamento = json['limiteFaturamento'] == null
          ? null
          : BigDecimal.fromJson(json['limiteFaturamento'])
      ..limiteContasReceber = json['limiteContasReceber'] == null
          ? null
          : BigDecimal.fromJson(json['limiteContasReceber'])
      ..limiteContasPagar = json['limiteContasPagar'] == null
          ? null
          : BigDecimal.fromJson(json['limiteContasPagar'])
      ..nfeEntrada = json['nfeEntrada'] as bool?
      ..nfeSaida = json['nfeSaida'] as bool?
      ..nfeServico = json['nfeServico'] as bool?
      ..multiplosLocaisEstoque = json['multiplosLocaisEstoque'] as bool?
      ..controleVendaPrazo = json['controleVendaPrazo'] as bool?
      ..cobrancaBancaria = json['cobrancaBancaria'] as bool?
      ..dre = json['dre'] as bool?
      ..controleCartoes = json['controleCartoes'] as bool?
      ..integracaoNapp = json['integracaoNapp'] as bool?
      ..integracaoGig = json['integracaoGig'] as bool?;

Map<String, dynamic> _$EmpresaContratoToJson(EmpresaContrato instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'tipoContrato': instance.tipoContrato,
      'vigenciaInicio': instance.vigenciaInicio?.toIso8601String(),
      'vigenciaFim': instance.vigenciaFim?.toIso8601String(),
      'diasTrial': instance.diasTrial,
      'numeroUsuarios': instance.numeroUsuarios,
      'moduloEstoque': instance.moduloEstoque,
      'moduloGrade': instance.moduloGrade,
      'moduloPacoteProduto': instance.moduloPacoteProduto,
      'moduloObservacaoProduto': instance.moduloObservacaoProduto,
      'moduloPromocao': instance.moduloPromocao,
      'moduloFinanceiro': instance.moduloFinanceiro,
      'moduloFicha': instance.moduloFicha,
      'moduloMesa': instance.moduloMesa,
      'moduloDelivery': instance.moduloDelivery,
      'moduloCartao': instance.moduloCartao,
      'moduloBalcao': instance.moduloBalcao,
      'moduloDriveThru': instance.moduloDriveThru,
      'moduloAutoatendimento': instance.moduloAutoatendimento,
      'aplicativoWaychef': instance.aplicativoWaychef,
      'servicoImpressao': instance.servicoImpressao,
      'integracaoAlfaSync': instance.integracaoAlfaSync,
      'integracaoUnicid': instance.integracaoUnicid,
      'modoHibrido': instance.modoHibrido,
      'venderWaycard': instance.venderWaycard,
      'recorrenciaContrato': instance.recorrenciaContrato,
      'valorContrato': instance.valorContrato,
      'valorTotalContrato': instance.valorTotalContrato,
      'dataPrimeiraAssinatura':
          instance.dataPrimeiraAssinatura?.toIso8601String(),
      'vencimentoContrato': instance.vencimentoContrato?.toIso8601String(),
      'dataContratacao': instance.dataContratacao?.toIso8601String(),
      'dataCancelamento': instance.dataCancelamento?.toIso8601String(),
      'contratoCancelado': instance.contratoCancelado,
      'exibirAletaVencimento': instance.exibirAletaVencimento,
      'contratoExtra': instance.contratoExtra,
      'limiteProdutos': instance.limiteProdutos,
      'limiteFaturamento': instance.limiteFaturamento,
      'limiteContasReceber': instance.limiteContasReceber,
      'limiteContasPagar': instance.limiteContasPagar,
      'nfeEntrada': instance.nfeEntrada,
      'nfeSaida': instance.nfeSaida,
      'nfeServico': instance.nfeServico,
      'multiplosLocaisEstoque': instance.multiplosLocaisEstoque,
      'controleVendaPrazo': instance.controleVendaPrazo,
      'cobrancaBancaria': instance.cobrancaBancaria,
      'dre': instance.dre,
      'controleCartoes': instance.controleCartoes,
      'integracaoNapp': instance.integracaoNapp,
      'integracaoGig': instance.integracaoGig,
    };

EmpresaContratoExtra _$EmpresaContratoExtraFromJson(
        Map<String, dynamic> json) =>
    EmpresaContratoExtra()
      ..id = json['id'] as int?
      ..idEmpresaContrato = json['idEmpresaContrato'] as int?
      ..contratoExtra = json['contratoExtra'] == null
          ? null
          : ContratoExtra.fromJson(
              json['contratoExtra'] as Map<String, dynamic>)
      ..valorUnitario = json['valorUnitario'] == null
          ? null
          : BigDecimal.fromJson(json['valorUnitario'])
      ..quantidade = json['quantidade'] as int?
      ..valorTotal = json['valorTotal'] == null
          ? null
          : BigDecimal.fromJson(json['valorTotal']);

Map<String, dynamic> _$EmpresaContratoExtraToJson(
        EmpresaContratoExtra instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresaContrato': instance.idEmpresaContrato,
      'contratoExtra': instance.contratoExtra,
      'valorUnitario': instance.valorUnitario,
      'quantidade': instance.quantidade,
      'valorTotal': instance.valorTotal,
    };

EmpresaDTO _$EmpresaDTOFromJson(Map<String, dynamic> json) => EmpresaDTO()
  ..id = json['id'] as int?
  ..razaoSocial = json['razaoSocial'] as String?
  ..nomaFantasia = json['nomaFantasia'] as String?
  ..numeroLoja = json['numeroLoja'] as int?
  ..inscricaoFederal = json['inscricaoFederal'] as String?
  ..variacao = json['variacao'] as int?
  ..logo = json['logo'] as String?
  ..empresaContrato = json['empresaContrato'] == null
      ? null
      : EmpresaContrato.fromJson(
          json['empresaContrato'] as Map<String, dynamic>)
  ..testando = json['testando'] as bool?
  ..vencimentoTeste = json['vencimentoTeste'] == null
      ? null
      : DateTime.parse(json['vencimentoTeste'] as String)
  ..empresaVenda = json['empresaVenda'] == null
      ? null
      : EmpresaVenda.fromJson(json['empresaVenda'] as Map<String, dynamic>)
  ..quest = json['quest'] == null
      ? null
      : Quest.fromJson(json['quest'] as Map<String, dynamic>?);

Map<String, dynamic> _$EmpresaDTOToJson(EmpresaDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'razaoSocial': instance.razaoSocial,
      'nomaFantasia': instance.nomaFantasia,
      'numeroLoja': instance.numeroLoja,
      'inscricaoFederal': instance.inscricaoFederal,
      'variacao': instance.variacao,
      'logo': instance.logo,
      'empresaContrato': instance.empresaContrato,
      'testando': instance.testando,
      'vencimentoTeste': instance.vencimentoTeste?.toIso8601String(),
      'empresaVenda': instance.empresaVenda,
      'quest': instance.quest,
    };

EmpresaVenda _$EmpresaVendaFromJson(Map<String, dynamic> json) => EmpresaVenda()
  ..confirmarValorSuperior = json['confirmarValorSuperior'] == null
      ? null
      : BigDecimal.fromJson(json['confirmarValorSuperior'])
  ..confirmarQuantidadeSuperior = json['confirmarQuantidadeSuperior'] == null
      ? null
      : BigDecimal.fromJson(json['confirmarQuantidadeSuperior'])
  ..informarObservacaoItem = json['informarObservacaoItem'] as bool?
  ..impressaoVenda = json['impressaoVenda'] as String?
  ..percentualDescontoVenda = json['percentualDescontoVenda'] == null
      ? null
      : BigDecimal.fromJson(json['percentualDescontoVenda'])
  ..percentualDescontoItem = json['percentualDescontoItem'] == null
      ? null
      : BigDecimal.fromJson(json['percentualDescontoItem'])
  ..descontoExcedenteVenda = json['descontoExcedenteVenda'] as String?
  ..descontoExcedenteItem = json['descontoExcedenteItem'] as String?
  ..origemDesconto = json['origemDesconto'] as String?
  ..imporMaximoDescontoItemSupervisor =
      json['imporMaximoDescontoItemSupervisor'] as bool?
  ..codigoBalanca = json['codigoBalanca'] as String?
  ..digitosProduto = json['digitosProduto'] as int?
  ..vendaPromocao = json['vendaPromocao'] as String?
  ..mensagemRodape = json['mensagemRodape'] as String?;

Map<String, dynamic> _$EmpresaVendaToJson(EmpresaVenda instance) =>
    <String, dynamic>{
      'confirmarValorSuperior': instance.confirmarValorSuperior,
      'confirmarQuantidadeSuperior': instance.confirmarQuantidadeSuperior,
      'informarObservacaoItem': instance.informarObservacaoItem,
      'impressaoVenda': instance.impressaoVenda,
      'percentualDescontoVenda': instance.percentualDescontoVenda,
      'percentualDescontoItem': instance.percentualDescontoItem,
      'descontoExcedenteVenda': instance.descontoExcedenteVenda,
      'descontoExcedenteItem': instance.descontoExcedenteItem,
      'origemDesconto': instance.origemDesconto,
      'imporMaximoDescontoItemSupervisor':
          instance.imporMaximoDescontoItemSupervisor,
      'codigoBalanca': instance.codigoBalanca,
      'digitosProduto': instance.digitosProduto,
      'vendaPromocao': instance.vendaPromocao,
      'mensagemRodape': instance.mensagemRodape,
    };

Endereco _$EnderecoFromJson(Map<String, dynamic> json) => Endereco()
  ..id = json['id'] as int?
  ..idPessoa = json['idPessoa'] as int?
  ..descricao = json['descricao'] as String?
  ..logradouro = json['logradouro'] as String?
  ..numero = json['numero'] as String?
  ..complemento = json['complemento'] as String?
  ..bairro = json['bairro'] as String?
  ..cep = json['cep'] as String?
  ..caixaPostal = json['caixaPostal'] as String?
  ..pontoReferencia = json['pontoReferencia'] as String?
  ..cidade = json['cidade'] == null
      ? null
      : Cidade.fromJson(json['cidade'] as Map<String, dynamic>?)
  ..regiao = json['regiao'] == null
      ? null
      : Regiao.fromJson(json['regiao'] as Map<String, dynamic>)
  ..principal = json['principal'] as bool
  ..idConcentrador = json['idConcentrador'] as int?
  ..versao = json['versao'] as int?
  ..ativo = json['ativo'] as bool
  ..dadosIntegracao = (json['dadosIntegracao'] as List<dynamic>?)
          ?.map((e) =>
              EnderecoDadosIntegracao.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [];

Map<String, dynamic> _$EnderecoToJson(Endereco instance) => <String, dynamic>{
      'id': instance.id,
      'idPessoa': instance.idPessoa,
      'descricao': instance.descricao,
      'logradouro': instance.logradouro,
      'numero': instance.numero,
      'complemento': instance.complemento,
      'bairro': instance.bairro,
      'cep': instance.cep,
      'caixaPostal': instance.caixaPostal,
      'pontoReferencia': instance.pontoReferencia,
      'cidade': instance.cidade,
      'regiao': instance.regiao,
      'principal': instance.principal,
      'idConcentrador': instance.idConcentrador,
      'versao': instance.versao,
      'ativo': instance.ativo,
      'dadosIntegracao': instance.dadosIntegracao,
    };

EquipamentoImpressao _$EquipamentoImpressaoFromJson(
        Map<String, dynamic> json) =>
    EquipamentoImpressao()
      ..id = json['id'] as int?
      ..idEmpresa = json['idEmpresa'] as int?
      ..empresa = json['empresa'] == null
          ? null
          : Empresa.fromJson(json['empresa'] as Map<String, dynamic>)
      ..descricao = json['descricao'] as String?
      ..tipoDispositivo = json['tipoDispositivo'] as String?
      ..driver = json['driver'] == null
          ? null
          : DriverImpressora.fromJson(json['driver'] as Map<String, dynamic>?)
      ..path = json['path'] as String?
      ..ipAddress = json['ipAddress'] as String?;

Map<String, dynamic> _$EquipamentoImpressaoToJson(
        EquipamentoImpressao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'empresa': instance.empresa,
      'descricao': instance.descricao,
      'tipoDispositivo': instance.tipoDispositivo,
      'driver': instance.driver,
      'path': instance.path,
      'ipAddress': instance.ipAddress,
    };

EspecieTitulo _$EspecieTituloFromJson(Map<String, dynamic> json) =>
    EspecieTitulo()
      ..id = json['id'] as int?
      ..idEmpresa = json['idEmpresa'] as int?
      ..descricao = json['descricao'] as String?
      ..tipo = json['tipo'] as String?
      ..taxaJuros = json['taxaJuros'] == null
          ? null
          : BigDecimal.fromJson(json['taxaJuros'])
      ..taxaMulta = json['taxaMulta'] == null
          ? null
          : BigDecimal.fromJson(json['taxaMulta'])
      ..taxaEmissaoTitulo = json['taxaEmissaoTitulo'] == null
          ? null
          : BigDecimal.fromJson(json['taxaEmissaoTitulo'])
      ..diasTolerancia = json['diasTolerancia'] as int?
      ..descontoPgtoAntecipado = json['descontoPgtoAntecipado'] == null
          ? null
          : BigDecimal.fromJson(json['descontoPgtoAntecipado'])
      ..diasPgtoAntecipado = json['diasPgtoAntecipado'] as int?
      ..versao = json['versao'] as int?;

Map<String, dynamic> _$EspecieTituloToJson(EspecieTitulo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'descricao': instance.descricao,
      'tipo': instance.tipo,
      'taxaJuros': instance.taxaJuros,
      'taxaMulta': instance.taxaMulta,
      'taxaEmissaoTitulo': instance.taxaEmissaoTitulo,
      'diasTolerancia': instance.diasTolerancia,
      'descontoPgtoAntecipado': instance.descontoPgtoAntecipado,
      'diasPgtoAntecipado': instance.diasPgtoAntecipado,
      'versao': instance.versao,
    };

EstacaoBalanca _$EstacaoBalancaFromJson(Map<String, dynamic> json) =>
    EstacaoBalanca()
      ..modelo = json['modelo'] as String?
      ..portaSerial = json['portaSerial'] as String?
      ..baudrate = json['baudrate'] as int?
      ..timeout =
          json['timeout'] == null ? null : BigDecimal.fromJson(json['timeout'])
      ..bytesProtocolo = json['bytesProtocolo'] as int?
      ..tentativas = json['tentativas'] as int?;

Map<String, dynamic> _$EstacaoBalancaToJson(EstacaoBalanca instance) =>
    <String, dynamic>{
      'modelo': instance.modelo,
      'portaSerial': instance.portaSerial,
      'baudrate': instance.baudrate,
      'timeout': instance.timeout,
      'bytesProtocolo': instance.bytesProtocolo,
      'tentativas': instance.tentativas,
    };

EstacaoPreCadastroDTO _$EstacaoPreCadastroDTOFromJson(
        Map<String, dynamic> json) =>
    EstacaoPreCadastroDTO()
      ..numeroCaixa = json['numeroCaixa'] as int?
      ..emissorFiscalList = (json['emissorFiscalList'] as List<dynamic>?)
              ?.map((e) => EmissorFiscal.fromJson(e as Map<String, dynamic>?))
              .toList() ??
          []
      ..moduloList = (json['moduloList'] as List<dynamic>?)
              ?.map((e) => Modulo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..equipamentoImpressaoList =
          (json['equipamentoImpressaoList'] as List<dynamic>?)
                  ?.map((e) =>
                      EquipamentoImpressao.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              []
      ..localProducaoList = (json['localProducaoList'] as List<dynamic>?)
              ?.map((e) => LocalProducao.fromJson(e as Map<String, dynamic>?))
              .toList() ??
          []
      ..modoHibrido = json['modoHibrido'] as bool?;

Map<String, dynamic> _$EstacaoPreCadastroDTOToJson(
        EstacaoPreCadastroDTO instance) =>
    <String, dynamic>{
      'numeroCaixa': instance.numeroCaixa,
      'emissorFiscalList': instance.emissorFiscalList,
      'moduloList': instance.moduloList,
      'equipamentoImpressaoList': instance.equipamentoImpressaoList,
      'localProducaoList': instance.localProducaoList,
      'modoHibrido': instance.modoHibrido,
    };

EstacaoTrabalho _$EstacaoTrabalhoFromJson(Map<String, dynamic> json) =>
    EstacaoTrabalho()
      ..id = json['id'] as int?
      ..nome = json['nome'] as String?
      ..descricao = json['descricao'] as String?
      ..idEmpresa = json['idEmpresa'] as int?
      ..idSetor = json['idSetor'] as int?
      ..setor = json['setor'] == null
          ? null
          : Setor.fromJson(json['setor'] as Map<String, dynamic>)
      ..grupo = json['grupo'] == null
          ? null
          : GrupoEstacao.fromJson(json['grupo'] as Map<String, dynamic>)
      ..osName = json['osName'] as String?
      ..osVersion = json['osVersion'] as String?
      ..javaVersion = json['javaVersion'] as String?
      ..tipo = json['tipo'] as String?
      ..teclado = json['teclado'] as String?
      ..finalidade = json['finalidade'] as String?
      ..modoOperacao = json['modoOperacao'] as String?
      ..marcaSmartPOS = json['marcaSmartPOS'] as String?
      ..cardapio = json['cardapio'] == null
          ? null
          : Cardapio.fromJson(json['cardapio'] as Map<String, dynamic>)
      ..marcaMicroterminal = json['marcaMicroterminal'] as String?
      ..ip = json['ip'] as String?
      ..numeroCaixa = json['numeroCaixa'] as int?
      ..utilizaGaveta = json['utilizaGaveta'] as bool?
      ..tipoEmissorFiscal = json['tipoEmissorFiscal'] as String?
      ..emissorFiscal = json['emissorFiscal'] == null
          ? null
          : EmissorFiscal.fromJson(
              json['emissorFiscal'] as Map<String, dynamic>?)
      ..concentradorHost = json['concentradorHost'] as String?
      ..concentradorPorta = json['concentradorPorta'] as int?
      ..modoHibrido = json['modoHibrido'] as bool?
      ..codigoOTPSitef = json['codigoOTPSitef'] as String?
      ..pontoCapturaPayGo = json['pontoCapturaPayGo'] as String?
      ..modoVisualizacaoMapa = json['modoVisualizacaoMapa'] as String?
      ..exigirLoginGarcom = json['exigirLoginGarcom'] as bool?
      ..utilizaBiometria = json['utilizaBiometria'] as bool?
      ..visualizaMapa = json['visualizaMapa'] as bool?
      ..colunasCardapio = json['colunasCardapio'] as int?
      ..balanca = json['balanca'] == null
          ? null
          : EstacaoBalanca.fromJson(json['balanca'] as Map<String, dynamic>)
      ..leitor = json['leitor'] == null
          ? null
          : EstacaoLeitor.fromJson(json['leitor'] as Map<String, dynamic>?)
      ..modulos = (json['modulos'] as List<dynamic>?)
              ?.map((e) => Modulo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..impressoras = (json['impressoras'] as List<dynamic>?)
              ?.map(
                  (e) => EstacaoImpressora.fromJson(e as Map<String, dynamic>?))
              .toList() ??
          []
      ..servicoImpressao = json['servicoImpressao'] == null
          ? null
          : ServicoImpressao.fromJson(
              json['servicoImpressao'] as Map<String, dynamic>?)
      ..servicoIfood = json['servicoIfood'] == null
          ? null
          : ServicoIfood.fromJson(json['servicoIfood'] as Map<String, dynamic>?)
      ..servicoCatraca = json['servicoCatraca'] == null
          ? null
          : ServicoCatraca.fromJson(
              json['servicoCatraca'] as Map<String, dynamic>?)
      ..servicoFourAll = json['servicoFourAll'] == null
          ? null
          : ServicoFourAll.fromJson(
              json['servicoFourAll'] as Map<String, dynamic>?)
      ..idContaCorrente = json['idContaCorrente'] as int?
      ..contaCorrente = json['contaCorrente'] == null
          ? null
          : ContaCorrente.fromJson(
              json['contaCorrente'] as Map<String, dynamic>)
      ..versao = json['versao'] as int?
      ..tipoTEF = json['tipoTEF'] as String?
      ..modoPesquisa = json['modoPesquisa'] as String?
      ..tipoPinPad = json['tipoPinPad'] as String?
      ..controleCadastro = json['controleCadastro'] == null
          ? null
          : ControleCadastro.fromJson(
              json['controleCadastro'] as Map<String, dynamic>?);

Map<String, dynamic> _$EstacaoTrabalhoToJson(EstacaoTrabalho instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'idEmpresa': instance.idEmpresa,
      'idSetor': instance.idSetor,
      'setor': instance.setor,
      'grupo': instance.grupo,
      'osName': instance.osName,
      'osVersion': instance.osVersion,
      'javaVersion': instance.javaVersion,
      'tipo': instance.tipo,
      'teclado': instance.teclado,
      'finalidade': instance.finalidade,
      'modoOperacao': instance.modoOperacao,
      'marcaSmartPOS': instance.marcaSmartPOS,
      'cardapio': instance.cardapio,
      'marcaMicroterminal': instance.marcaMicroterminal,
      'ip': instance.ip,
      'numeroCaixa': instance.numeroCaixa,
      'utilizaGaveta': instance.utilizaGaveta,
      'tipoEmissorFiscal': instance.tipoEmissorFiscal,
      'emissorFiscal': instance.emissorFiscal,
      'concentradorHost': instance.concentradorHost,
      'concentradorPorta': instance.concentradorPorta,
      'modoHibrido': instance.modoHibrido,
      'codigoOTPSitef': instance.codigoOTPSitef,
      'pontoCapturaPayGo': instance.pontoCapturaPayGo,
      'modoVisualizacaoMapa': instance.modoVisualizacaoMapa,
      'exigirLoginGarcom': instance.exigirLoginGarcom,
      'utilizaBiometria': instance.utilizaBiometria,
      'visualizaMapa': instance.visualizaMapa,
      'colunasCardapio': instance.colunasCardapio,
      'balanca': instance.balanca,
      'leitor': instance.leitor,
      'modulos': instance.modulos,
      'impressoras': instance.impressoras,
      'servicoImpressao': instance.servicoImpressao,
      'servicoIfood': instance.servicoIfood,
      'servicoCatraca': instance.servicoCatraca,
      'servicoFourAll': instance.servicoFourAll,
      'idContaCorrente': instance.idContaCorrente,
      'contaCorrente': instance.contaCorrente,
      'versao': instance.versao,
      'tipoTEF': instance.tipoTEF,
      'modoPesquisa': instance.modoPesquisa,
      'tipoPinPad': instance.tipoPinPad,
      'controleCadastro': instance.controleCadastro,
    };

Finalizadora _$FinalizadoraFromJson(Map<String, dynamic> json) => Finalizadora()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..codigo = json['codigo'] as int?
  ..descricao = json['descricao'] as String?
  ..tipo = json['tipo'] as String?
  ..valorMaximo = json['valorMaximo'] == null
      ? null
      : BigDecimal.fromJson(json['valorMaximo'])
  ..tipoPagamento = json['tipoPagamento'] as String?
  ..tipoCartao = json['tipoCartao'] as String?
  ..finalizadoraRFB = json['finalizadoraRFB'] as String?
  ..versao = json['versao'] as int?;

Map<String, dynamic> _$FinalizadoraToJson(Finalizadora instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'codigo': instance.codigo,
      'descricao': instance.descricao,
      'tipo': instance.tipo,
      'valorMaximo': instance.valorMaximo,
      'tipoPagamento': instance.tipoPagamento,
      'tipoCartao': instance.tipoCartao,
      'finalizadoraRFB': instance.finalizadoraRFB,
      'versao': instance.versao,
    };

FinalizadoraEmpresa _$FinalizadoraEmpresaFromJson(Map<String, dynamic> json) =>
    FinalizadoraEmpresa()
      ..id = json['id'] as int?
      ..idFinalizadora = json['idFinalizadora'] as int?
      ..finalizadora = json['finalizadora'] == null
          ? null
          : Finalizadora.fromJson(json['finalizadora'] as Map<String, dynamic>)
      ..idEmpresa = json['idEmpresa'] as int?
      ..ativo = json['ativo'] as bool?
      ..tef = json['tef'] as bool?
      ..waycard = json['waycard'] as bool?
      ..permiteTroco = json['permiteTroco'] as bool?
      ..vinculaCliente = json['vinculaCliente'] as bool?
      ..capturaDados = json['capturaDados'] as bool?
      ..solicitaSupervisor = json['solicitaSupervisor'] as bool?
      ..exigeAutorizacao = json['exigeAutorizacao'] as bool?
      ..comprovanteVinculado = json['comprovanteVinculado'] as bool?
      ..permiteDesconto = json['permiteDesconto'] as bool?
      ..pagaComissao = json['pagaComissao'] as bool?
      ..trocaDevolucao = json['trocaDevolucao'] as bool?
      ..imprimeCupomFiscal = json['imprimeCupomFiscal'] as bool?
      ..chequeTroco = json['chequeTroco'] as bool?
      ..especieTitulo = json['especieTitulo'] == null
          ? null
          : EspecieTitulo.fromJson(
              json['especieTitulo'] as Map<String, dynamic>)
      ..sugestaoDias = json['sugestaoDias'] as int?
      ..sugestaoParcelas = json['sugestaoParcelas'] as int?
      ..maximoParcelas = json['maximoParcelas'] as int?
      ..valorMinimoParcela = json['valorMinimoParcela'] == null
          ? null
          : BigDecimal.fromJson(json['valorMinimoParcela']);

Map<String, dynamic> _$FinalizadoraEmpresaToJson(
        FinalizadoraEmpresa instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idFinalizadora': instance.idFinalizadora,
      'finalizadora': instance.finalizadora,
      'idEmpresa': instance.idEmpresa,
      'ativo': instance.ativo,
      'tef': instance.tef,
      'waycard': instance.waycard,
      'permiteTroco': instance.permiteTroco,
      'vinculaCliente': instance.vinculaCliente,
      'capturaDados': instance.capturaDados,
      'solicitaSupervisor': instance.solicitaSupervisor,
      'exigeAutorizacao': instance.exigeAutorizacao,
      'comprovanteVinculado': instance.comprovanteVinculado,
      'permiteDesconto': instance.permiteDesconto,
      'pagaComissao': instance.pagaComissao,
      'trocaDevolucao': instance.trocaDevolucao,
      'imprimeCupomFiscal': instance.imprimeCupomFiscal,
      'chequeTroco': instance.chequeTroco,
      'especieTitulo': instance.especieTitulo,
      'sugestaoDias': instance.sugestaoDias,
      'sugestaoParcelas': instance.sugestaoParcelas,
      'maximoParcelas': instance.maximoParcelas,
      'valorMinimoParcela': instance.valorMinimoParcela,
    };

FoxConsumo _$FoxConsumoFromJson(Map<String, dynamic> json) => FoxConsumo()
  ..id = json['id'] as int?
  ..modulo = json['modulo'] as String?
  ..valorTotal = json['valorTotal'] == null
      ? null
      : BigDecimal.fromJson(json['valorTotal'])
  ..quantidadeComandas = json['quantidadeComandas'] as int?
  ..dataEnvio = json['dataEnvio'] == null
      ? null
      : DateTime.parse(json['dataEnvio'] as String)
  ..idEmpresa = json['idEmpresa'] as int?;

Map<String, dynamic> _$FoxConsumoToJson(FoxConsumo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modulo': instance.modulo,
      'valorTotal': instance.valorTotal,
      'quantidadeComandas': instance.quantidadeComandas,
      'dataEnvio': instance.dataEnvio?.toIso8601String(),
      'idEmpresa': instance.idEmpresa,
    };

Funcionario _$FuncionarioFromJson(Map<String, dynamic> json) => Funcionario()
  ..id = json['id'] as int?
  ..idPessoa = json['idPessoa'] as int?
  ..pessoa = json['pessoa'] == null
      ? null
      : Pessoa.fromJson(json['pessoa'] as Map<String, dynamic>)
  ..idEmpresa = json['idEmpresa'] as int?
  ..numeroPis = json['numeroPis'] as String?
  ..numeroCtps = json['numeroCtps'] as String?
  ..setor = json['setor'] == null
      ? null
      : Setor.fromJson(json['setor'] as Map<String, dynamic>)
  ..regiaoTrabalho = json['regiaoTrabalho'] == null
      ? null
      : Regiao.fromJson(json['regiaoTrabalho'] as Map<String, dynamic>)
  ..localTrabalho = json['localTrabalho'] as String?
  ..cargo = json['cargo'] as String?
  ..valorPisoSalarial = json['valorPisoSalarial'] == null
      ? null
      : BigDecimal.fromJson(json['valorPisoSalarial'])
  ..valorSalario = json['valorSalario'] == null
      ? null
      : BigDecimal.fromJson(json['valorSalario'])
  ..valorTransporte = json['valorTransporte'] == null
      ? null
      : BigDecimal.fromJson(json['valorTransporte'])
  ..valorTicket = json['valorTicket'] == null
      ? null
      : BigDecimal.fromJson(json['valorTicket'])
  ..valorSeguro = json['valorSeguro'] == null
      ? null
      : BigDecimal.fromJson(json['valorSeguro'])
  ..valorRendimentos = json['valorRendimentos'] == null
      ? null
      : BigDecimal.fromJson(json['valorRendimentos'])
  ..valorContribuicoes = json['valorContribuicoes'] == null
      ? null
      : BigDecimal.fromJson(json['valorContribuicoes'])
  ..valorDescontos = json['valorDescontos'] == null
      ? null
      : BigDecimal.fromJson(json['valorDescontos'])
  ..percentualAdiantamento = json['percentualAdiantamento'] == null
      ? null
      : BigDecimal.fromJson(json['percentualAdiantamento'])
  ..numeroDependentes = json['numeroDependentes'] as int?
  ..dataAdmissao = json['dataAdmissao'] == null
      ? null
      : DateTime.parse(json['dataAdmissao'] as String)
  ..dataDemissao = json['dataDemissao'] == null
      ? null
      : DateTime.parse(json['dataDemissao'] as String)
  ..motivoDemissao = json['motivoDemissao'] as String?
  ..observacao = json['observacao'] as String?
  ..tecnico = json['tecnico'] as bool?
  ..motorista = json['motorista'] as bool?
  ..auxiliarMotorista = json['auxiliarMotorista'] as bool?
  ..montador = json['montador'] as bool?
  ..entregador = json['entregador'] as bool?
  ..promoter = json['promoter'] as bool?
  ..vendedor = json['vendedor'] as bool?
  ..historico = json['historico'] as String?
  ..versao = json['versao'] as int?
  ..controleCadastro = json['controleCadastro'] == null
      ? null
      : ControleCadastro.fromJson(
          json['controleCadastro'] as Map<String, dynamic>?)
  ..dadosVendedor = json['dadosVendedor'] == null
      ? null
      : Vendedor.fromJson(json['dadosVendedor'] as Map<String, dynamic>);

Map<String, dynamic> _$FuncionarioToJson(Funcionario instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idPessoa': instance.idPessoa,
      'pessoa': instance.pessoa,
      'idEmpresa': instance.idEmpresa,
      'numeroPis': instance.numeroPis,
      'numeroCtps': instance.numeroCtps,
      'setor': instance.setor,
      'regiaoTrabalho': instance.regiaoTrabalho,
      'localTrabalho': instance.localTrabalho,
      'cargo': instance.cargo,
      'valorPisoSalarial': instance.valorPisoSalarial,
      'valorSalario': instance.valorSalario,
      'valorTransporte': instance.valorTransporte,
      'valorTicket': instance.valorTicket,
      'valorSeguro': instance.valorSeguro,
      'valorRendimentos': instance.valorRendimentos,
      'valorContribuicoes': instance.valorContribuicoes,
      'valorDescontos': instance.valorDescontos,
      'percentualAdiantamento': instance.percentualAdiantamento,
      'numeroDependentes': instance.numeroDependentes,
      'dataAdmissao': instance.dataAdmissao?.toIso8601String(),
      'dataDemissao': instance.dataDemissao?.toIso8601String(),
      'motivoDemissao': instance.motivoDemissao,
      'observacao': instance.observacao,
      'tecnico': instance.tecnico,
      'motorista': instance.motorista,
      'auxiliarMotorista': instance.auxiliarMotorista,
      'montador': instance.montador,
      'entregador': instance.entregador,
      'promoter': instance.promoter,
      'vendedor': instance.vendedor,
      'historico': instance.historico,
      'versao': instance.versao,
      'controleCadastro': instance.controleCadastro,
      'dadosVendedor': instance.dadosVendedor,
    };

Grade _$GradeFromJson(Map<String, dynamic> json) => Grade()
  ..id = json['id'] as int?
  ..indice = json['indice'] as int?
  ..idProduto = json['idProduto'] as int?
  ..codigoInterno = json['codigoInterno'] as int?
  ..codigo = json['codigo'] as String?
  ..referencia = json['referencia'] as String?
  ..tamanho = json['tamanho'] == null
      ? null
      : Tamanho.fromJson(json['tamanho'] as Map<String, dynamic>?)
  ..cor = json['cor'] == null
      ? null
      : Cor.fromJson(json['cor'] as Map<String, dynamic>?)
  ..colecao = json['colecao'] == null
      ? null
      : Colecao.fromJson(json['colecao'] as Map<String, dynamic>?)
  ..ativo = json['ativo'] as bool?
  ..padrao = json['padrao'] as bool?;

Map<String, dynamic> _$GradeToJson(Grade instance) => <String, dynamic>{
      'id': instance.id,
      'indice': instance.indice,
      'idProduto': instance.idProduto,
      'codigoInterno': instance.codigoInterno,
      'codigo': instance.codigo,
      'referencia': instance.referencia,
      'tamanho': instance.tamanho,
      'cor': instance.cor,
      'colecao': instance.colecao,
      'ativo': instance.ativo,
      'padrao': instance.padrao,
    };

GradeEmpresa _$GradeEmpresaFromJson(Map<String, dynamic> json) => GradeEmpresa()
  ..id = json['id'] as int?
  ..idGrade = json['idGrade'] as int?
  ..grade = json['grade'] == null
      ? null
      : Grade.fromJson(json['grade'] as Map<String, dynamic>)
  ..idProdutoEmpresa = json['idProdutoEmpresa'] as int?
  ..produtoEmpresa = json['produtoEmpresa'] == null
      ? null
      : ProdutoEmpresa.fromJson(json['produtoEmpresa'] as Map<String, dynamic>)
  ..lote = json['lote'] as String?
  ..serie = json['serie'] as String?
  ..promocao = json['promocao'] == null
      ? null
      : Promocao.fromJson(json['promocao'] as Map<String, dynamic>)
  ..precoCustoCompra = json['precoCustoCompra'] == null
      ? null
      : BigDecimal.fromJson(json['precoCustoCompra'])
  ..precoCustoContabil = json['precoCustoContabil'] == null
      ? null
      : BigDecimal.fromJson(json['precoCustoContabil'])
  ..precoCustoFixo = json['precoCustoFixo'] == null
      ? null
      : BigDecimal.fromJson(json['precoCustoFixo'])
  ..precoCMC =
      json['precoCMC'] == null ? null : BigDecimal.fromJson(json['precoCMC'])
  ..precoCustoAnterior = json['precoCustoAnterior'] == null
      ? null
      : BigDecimal.fromJson(json['precoCustoAnterior'])
  ..precoCustoMedio = json['precoCustoMedio'] == null
      ? null
      : BigDecimal.fromJson(json['precoCustoMedio'])
  ..precoCustoPromocional = json['precoCustoPromocional'] == null
      ? null
      : BigDecimal.fromJson(json['precoCustoPromocional'])
  ..precoCustoMontagem = json['precoCustoMontagem'] == null
      ? null
      : BigDecimal.fromJson(json['precoCustoMontagem'])
  ..precoUnitario = json['precoUnitario'] == null
      ? null
      : BigDecimal.fromJson(json['precoUnitario'])
  ..precoPromocional = json['precoPromocional'] == null
      ? null
      : BigDecimal.fromJson(json['precoPromocional'])
  ..percentualComissaoVendedor = json['percentualComissaoVendedor'] == null
      ? null
      : BigDecimal.fromJson(json['percentualComissaoVendedor'])
  ..percentualDesconto = json['percentualDesconto'] == null
      ? null
      : BigDecimal.fromJson(json['percentualDesconto'])
  ..percentualDescontoSupervisor = json['percentualDescontoSupervisor'] == null
      ? null
      : BigDecimal.fromJson(json['percentualDescontoSupervisor'])
  ..estoqueMinimo = json['estoqueMinimo'] == null
      ? null
      : BigDecimal.fromJson(json['estoqueMinimo'])
  ..estoqueMaximo = json['estoqueMaximo'] == null
      ? null
      : BigDecimal.fromJson(json['estoqueMaximo'])
  ..proporcaoBaixa = json['proporcaoBaixa'] == null
      ? null
      : BigDecimal.fromJson(json['proporcaoBaixa'])
  ..percentualQuebra = json['percentualQuebra'] == null
      ? null
      : BigDecimal.fromJson(json['percentualQuebra'])
  ..precos = (json['precos'] as List<dynamic>?)
          ?.map((e) => GradeEmpresaPreco.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..ativo = json['ativo'] as bool?;

Map<String, dynamic> _$GradeEmpresaToJson(GradeEmpresa instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idGrade': instance.idGrade,
      'grade': instance.grade,
      'idProdutoEmpresa': instance.idProdutoEmpresa,
      'produtoEmpresa': instance.produtoEmpresa,
      'lote': instance.lote,
      'serie': instance.serie,
      'promocao': instance.promocao,
      'precoCustoCompra': instance.precoCustoCompra,
      'precoCustoContabil': instance.precoCustoContabil,
      'precoCustoFixo': instance.precoCustoFixo,
      'precoCMC': instance.precoCMC,
      'precoCustoAnterior': instance.precoCustoAnterior,
      'precoCustoMedio': instance.precoCustoMedio,
      'precoCustoPromocional': instance.precoCustoPromocional,
      'precoCustoMontagem': instance.precoCustoMontagem,
      'precoUnitario': instance.precoUnitario,
      'precoPromocional': instance.precoPromocional,
      'percentualComissaoVendedor': instance.percentualComissaoVendedor,
      'percentualDesconto': instance.percentualDesconto,
      'percentualDescontoSupervisor': instance.percentualDescontoSupervisor,
      'estoqueMinimo': instance.estoqueMinimo,
      'estoqueMaximo': instance.estoqueMaximo,
      'proporcaoBaixa': instance.proporcaoBaixa,
      'percentualQuebra': instance.percentualQuebra,
      'precos': instance.precos,
      'ativo': instance.ativo,
    };

GrupoEstacao _$GrupoEstacaoFromJson(Map<String, dynamic> json) => GrupoEstacao()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..descricao = json['descricao'] as String?
  ..modulos = (json['modulos'] as List<dynamic>?)
          ?.map((e) => Modulo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..impressoras = (json['impressoras'] as List<dynamic>?)
          ?.map((e) => GrupoImpressora.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [];

Map<String, dynamic> _$GrupoEstacaoToJson(GrupoEstacao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'descricao': instance.descricao,
      'modulos': instance.modulos,
      'impressoras': instance.impressoras,
    };

HistoricoCompras _$HistoricoComprasFromJson(Map<String, dynamic> json) =>
    HistoricoCompras()
      ..produto = json['produto'] as String?
      ..compras =
          json['compras'] == null ? null : BigDecimal.fromJson(json['compras']);

Map<String, dynamic> _$HistoricoComprasToJson(HistoricoCompras instance) =>
    <String, dynamic>{
      'produto': instance.produto,
      'compras': instance.compras,
    };

Ibpt _$IbptFromJson(Map<String, dynamic> json) => Ibpt()
  ..id = json['id'] as int?
  ..uf = json['uf'] as String?
  ..codigo = json['codigo'] as String?
  ..ex = json['ex'] as int?
  ..tipo = json['tipo'] as int?
  ..descricao = json['descricao'] as String?
  ..nacionalFederal = json['nacionalFederal'] == null
      ? null
      : BigDecimal.fromJson(json['nacionalFederal'])
  ..importadosFederal = json['importadosFederal'] == null
      ? null
      : BigDecimal.fromJson(json['importadosFederal'])
  ..estadual =
      json['estadual'] == null ? null : BigDecimal.fromJson(json['estadual'])
  ..municipal =
      json['municipal'] == null ? null : BigDecimal.fromJson(json['municipal'])
  ..vigenciaInicio = json['vigenciaInicio'] == null
      ? null
      : DateTime.parse(json['vigenciaInicio'] as String)
  ..vigenciaFim = json['vigenciaFim'] == null
      ? null
      : DateTime.parse(json['vigenciaFim'] as String);

Map<String, dynamic> _$IbptToJson(Ibpt instance) => <String, dynamic>{
      'id': instance.id,
      'uf': instance.uf,
      'codigo': instance.codigo,
      'ex': instance.ex,
      'tipo': instance.tipo,
      'descricao': instance.descricao,
      'nacionalFederal': instance.nacionalFederal,
      'importadosFederal': instance.importadosFederal,
      'estadual': instance.estadual,
      'municipal': instance.municipal,
      'vigenciaInicio': instance.vigenciaInicio?.toIso8601String(),
      'vigenciaFim': instance.vigenciaFim?.toIso8601String(),
    };

Icms _$IcmsFromJson(Map<String, dynamic> json) => Icms()
  ..id = json['id'] as int?
  ..ufOrigem = json['ufOrigem'] as String?
  ..ufDestino = json['ufDestino'] as String?
  ..codigoNCM = json['codigoNCM'] as String?
  ..ncm = json['ncm'] == null
      ? null
      : Ncm.fromJson(json['ncm'] as Map<String, dynamic>?)
  ..cstIcms = json['cstIcms'] == null
      ? null
      : CstIcms.fromJson(json['cstIcms'] as Map<String, dynamic>?)
  ..csosnIcms = json['csosnIcms'] == null
      ? null
      : CsosnIcms.fromJson(json['csosnIcms'] as Map<String, dynamic>?)
  ..aliquotaIcms = json['aliquotaIcms'] == null
      ? null
      : BigDecimal.fromJson(json['aliquotaIcms'])
  ..percentualBaseCalculo = json['percentualBaseCalculo'] == null
      ? null
      : BigDecimal.fromJson(json['percentualBaseCalculo'])
  ..aliquotaIcmsFinal = json['aliquotaIcmsFinal'] == null
      ? null
      : BigDecimal.fromJson(json['aliquotaIcmsFinal'])
  ..idEmpresa = json['idEmpresa'] as int?
  ..tipoContribuinte = json['tipoContribuinte'] as String?;

Map<String, dynamic> _$IcmsToJson(Icms instance) => <String, dynamic>{
      'id': instance.id,
      'ufOrigem': instance.ufOrigem,
      'ufDestino': instance.ufDestino,
      'codigoNCM': instance.codigoNCM,
      'ncm': instance.ncm,
      'cstIcms': instance.cstIcms,
      'csosnIcms': instance.csosnIcms,
      'aliquotaIcms': instance.aliquotaIcms,
      'percentualBaseCalculo': instance.percentualBaseCalculo,
      'aliquotaIcmsFinal': instance.aliquotaIcmsFinal,
      'idEmpresa': instance.idEmpresa,
      'tipoContribuinte': instance.tipoContribuinte,
    };

LocalEstocado _$LocalEstocadoFromJson(Map<String, dynamic> json) =>
    LocalEstocado()
      ..id = json['id'] as int?
      ..idGrade = json['idGrade'] as int?
      ..idEndereco = json['idEndereco'] as int?
      ..estoque =
          json['estoque'] == null ? null : BigDecimal.fromJson(json['estoque'])
      ..estoqueAlocado = json['estoqueAlocado'] == null
          ? null
          : BigDecimal.fromJson(json['estoqueAlocado'])
      ..padraoVenda = json['padraoVenda'] as bool?;

Map<String, dynamic> _$LocalEstocadoToJson(LocalEstocado instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idGrade': instance.idGrade,
      'idEndereco': instance.idEndereco,
      'estoque': instance.estoque,
      'estoqueAlocado': instance.estoqueAlocado,
      'padraoVenda': instance.padraoVenda,
    };

Lojista _$LojistaFromJson(Map<String, dynamic> json) => Lojista()
  ..idPessoa = json['idPessoa'] as int?
  ..pessoa = json['pessoa'] == null
      ? null
      : Pessoa.fromJson(json['pessoa'] as Map<String, dynamic>)
  ..bandeiras = (json['bandeiras'] as List<dynamic>?)
          ?.map((e) => BandeiraCartao.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..versao = json['versao'] as int?
  ..controleCadastro = json['controleCadastro'] == null
      ? null
      : ControleCadastro.fromJson(
          json['controleCadastro'] as Map<String, dynamic>?);

Map<String, dynamic> _$LojistaToJson(Lojista instance) => <String, dynamic>{
      'idPessoa': instance.idPessoa,
      'pessoa': instance.pessoa,
      'bandeiras': instance.bandeiras,
      'versao': instance.versao,
      'controleCadastro': instance.controleCadastro,
    };

Modulo _$ModuloFromJson(Map<String, dynamic> json) => Modulo()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..tipo = json['tipo'] as String?
  ..comissaoVendedor = json['comissaoVendedor'] as String?
  ..sequencia = json['sequencia'] as int?
  ..moduloPessoas = json['moduloPessoas'] as String?
  ..avisoTempoOcioso = json['avisoTempoOcioso'] as int
  ..ticketConsumo = json['ticketConsumo'] as String?
  ..impressaoVenda = json['impressaoVenda'] as String?
  ..imprimeVendaVias = json['imprimeVendaVias'] as int?
  ..senhaAtendimento = json['senhaAtendimento'] as String?
  ..dicaVenda = json['dicaVenda'] as String?
  ..pedidosCalculoExpedicao = json['pedidosCalculoExpedicao'] as int?
  ..denominacaoServico = json['denominacaoServico'] as String?
  ..produtoServico = json['produtoServico'] == null
      ? null
      : ProdutoEmpresa.fromJson(json['produtoServico'] as Map<String, dynamic>)
  ..taxaServico = json['taxaServico'] == null
      ? null
      : BigDecimal.fromJson(json['taxaServico'])
  ..identificaGarcom = json['identificaGarcom'] as bool?
  ..identificaCliente = json['identificaCliente'] as bool?
  ..ticketReduzido = json['ticketReduzido'] as bool?
  ..informaMotivoCancelamentoPedido =
      json['informaMotivoCancelamentoPedido'] as bool?
  ..informaMotivoCancelamentoItem =
      json['informaMotivoCancelamentoItem'] as bool?
  ..imprimeItensPagamento = json['imprimeItensPagamento'] as bool?
  ..imprimeCancelamentoItem = json['imprimeCancelamentoItem'] as bool?
  ..imprimeFichaConsumo = json['imprimeFichaConsumo'] as bool?
  ..controlaSequenciaComanda = json['controlaSequenciaComanda'] as bool?
  ..reutilizaFichas = json['reutilizaFichas'] as bool?
  ..permiteSuspender = json['permiteSuspender'] as bool?
  ..enviaSMS = json['enviaSMS'] as bool?
  ..cartaoCampoNascimento = json['cartaoCampoNascimento'] as bool?
  ..cartaoCampoTelefone = json['cartaoCampoTelefone'] as bool?
  ..cartaoCampoEndereco = json['cartaoCampoEndereco'] as bool?
  ..cartaoCampoEstado = json['cartaoCampoEstado'] as bool?
  ..cartaoCampoCidade = json['cartaoCampoCidade'] as bool?
  ..cartaoCampoCep = json['cartaoCampoCep'] as bool?
  ..cartaoCampoEmail = json['cartaoCampoEmail'] as bool?
  ..cartaoCampoSMS = json['cartaoCampoSMS'] as bool?
  ..finalizadoraDebito = json['finalizadoraDebito'] == null
      ? null
      : FinalizadoraEmpresa.fromJson(
          json['finalizadoraDebito'] as Map<String, dynamic>)
  ..finalizadoraCredito = json['finalizadoraCredito'] == null
      ? null
      : FinalizadoraEmpresa.fromJson(
          json['finalizadoraCredito'] as Map<String, dynamic>)
  ..finalizadoraDinheiro = json['finalizadoraDinheiro'] == null
      ? null
      : FinalizadoraEmpresa.fromJson(
          json['finalizadoraDinheiro'] as Map<String, dynamic>)
  ..multiplasFinalizadoras = json['multiplasFinalizadoras'] as bool?
  ..ativo = json['ativo'] as bool?
  ..controleTempoProducao = json['controleTempoProducao'] as bool?
  ..mensagemFinalAtendimento = json['mensagemFinalAtendimento'] as String?
  ..listMapeamento = (json['listMapeamento'] as List<dynamic>?)
          ?.map((e) => ModuloMapeamento.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [];

Map<String, dynamic> _$ModuloToJson(Modulo instance) => <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'tipo': instance.tipo,
      'comissaoVendedor': instance.comissaoVendedor,
      'sequencia': instance.sequencia,
      'moduloPessoas': instance.moduloPessoas,
      'avisoTempoOcioso': instance.avisoTempoOcioso,
      'ticketConsumo': instance.ticketConsumo,
      'impressaoVenda': instance.impressaoVenda,
      'imprimeVendaVias': instance.imprimeVendaVias,
      'senhaAtendimento': instance.senhaAtendimento,
      'dicaVenda': instance.dicaVenda,
      'pedidosCalculoExpedicao': instance.pedidosCalculoExpedicao,
      'denominacaoServico': instance.denominacaoServico,
      'produtoServico': instance.produtoServico,
      'taxaServico': instance.taxaServico,
      'identificaGarcom': instance.identificaGarcom,
      'identificaCliente': instance.identificaCliente,
      'ticketReduzido': instance.ticketReduzido,
      'informaMotivoCancelamentoPedido':
          instance.informaMotivoCancelamentoPedido,
      'informaMotivoCancelamentoItem': instance.informaMotivoCancelamentoItem,
      'imprimeItensPagamento': instance.imprimeItensPagamento,
      'imprimeCancelamentoItem': instance.imprimeCancelamentoItem,
      'imprimeFichaConsumo': instance.imprimeFichaConsumo,
      'controlaSequenciaComanda': instance.controlaSequenciaComanda,
      'reutilizaFichas': instance.reutilizaFichas,
      'permiteSuspender': instance.permiteSuspender,
      'enviaSMS': instance.enviaSMS,
      'cartaoCampoNascimento': instance.cartaoCampoNascimento,
      'cartaoCampoTelefone': instance.cartaoCampoTelefone,
      'cartaoCampoEndereco': instance.cartaoCampoEndereco,
      'cartaoCampoEstado': instance.cartaoCampoEstado,
      'cartaoCampoCidade': instance.cartaoCampoCidade,
      'cartaoCampoCep': instance.cartaoCampoCep,
      'cartaoCampoEmail': instance.cartaoCampoEmail,
      'cartaoCampoSMS': instance.cartaoCampoSMS,
      'finalizadoraDebito': instance.finalizadoraDebito,
      'finalizadoraCredito': instance.finalizadoraCredito,
      'finalizadoraDinheiro': instance.finalizadoraDinheiro,
      'multiplasFinalizadoras': instance.multiplasFinalizadoras,
      'ativo': instance.ativo,
      'controleTempoProducao': instance.controleTempoProducao,
      'mensagemFinalAtendimento': instance.mensagemFinalAtendimento,
      'listMapeamento': instance.listMapeamento,
    };

ModuloMapeamento _$ModuloMapeamentoFromJson(Map<String, dynamic> json) =>
    ModuloMapeamento()
      ..id = json['id'] as int?
      ..idModulo = json['idModulo'] as int?
      ..posicao = json['posicao'] as int?
      ..lugares = json['lugares'] as int?
      ..praca = json['praca'] as int?
      ..taxaServico = json['taxaServico'] == null
          ? null
          : BigDecimal.fromJson(json['taxaServico'])
      ..observacao = json['observacao'] as String?
      ..assentoInicial = json['assentoInicial'] as int?
      ..assentoFinal = json['assentoFinal'] as int?
      ..nfc = json['nfc'] as int?
      ..informaMesa = json['informaMesa'] as bool?
      ..informaAssento = json['informaAssento'] as bool?
      ..ativa = json['ativa'] as bool?;

Map<String, dynamic> _$ModuloMapeamentoToJson(ModuloMapeamento instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idModulo': instance.idModulo,
      'posicao': instance.posicao,
      'lugares': instance.lugares,
      'praca': instance.praca,
      'taxaServico': instance.taxaServico,
      'observacao': instance.observacao,
      'assentoInicial': instance.assentoInicial,
      'assentoFinal': instance.assentoFinal,
      'nfc': instance.nfc,
      'informaMesa': instance.informaMesa,
      'informaAssento': instance.informaAssento,
      'ativa': instance.ativa,
    };

Nota _$NotaFromJson(Map<String, dynamic> json) => Nota()
  ..id = json['id'] as int?
  ..operacao = json['operacao'] as String?
  ..modelo = json['modelo'] as String?
  ..idEmpresa = json['idEmpresa'] as int?
  ..empresa = json['empresa'] == null
      ? null
      : Empresa.fromJson(json['empresa'] as Map<String, dynamic>)
  ..idCaixa = json['idCaixa'] as int?
  ..numero = json['numero'] as int?
  ..serie = json['serie'] as String?
  ..subSerie = json['subSerie'] as String?
  ..dataEmissao = json['dataEmissao'] == null
      ? null
      : DateTime.parse(json['dataEmissao'] as String)
  ..dataLancamento = json['dataLancamento'] == null
      ? null
      : DateTime.parse(json['dataLancamento'] as String)
  ..dataSaida = json['dataSaida'] == null
      ? null
      : DateTime.parse(json['dataSaida'] as String)
  ..idVendedor = json['idVendedor'] as int?
  ..idTurno = json['idTurno'] as int?
  ..cop = json['cop'] == null
      ? null
      : COP.fromJson(json['cop'] as Map<String, dynamic>?)
  ..idCliente = json['idCliente'] as int?
  ..idClienteAutorizado = json['idClienteAutorizado'] as int?
  ..clienteAutorizado = json['clienteAutorizado'] == null
      ? null
      : ClienteAutorizado.fromJson(
          json['clienteAutorizado'] as Map<String, dynamic>)
  ..idFornecedor = json['idFornecedor'] as int?
  ..fornecedor = json['fornecedor'] == null
      ? null
      : Fornecedor.fromJson(json['fornecedor'] as Map<String, dynamic>?)
  ..idEndereco = json['idEndereco'] as int?
  ..valorSubTotal = json['valorSubTotal'] == null
      ? null
      : BigDecimal.fromJson(json['valorSubTotal'])
  ..valorTotal = json['valorTotal'] == null
      ? null
      : BigDecimal.fromJson(json['valorTotal'])
  ..valorAcrescimo = json['valorAcrescimo'] == null
      ? null
      : BigDecimal.fromJson(json['valorAcrescimo'])
  ..valorDesconto = json['valorDesconto'] == null
      ? null
      : BigDecimal.fromJson(json['valorDesconto'])
  ..valorDescontoItens = json['valorDescontoItens'] == null
      ? null
      : BigDecimal.fromJson(json['valorDescontoItens'])
  ..valorTotalServico = json['valorTotalServico'] == null
      ? null
      : BigDecimal.fromJson(json['valorTotalServico'])
  ..valorIsencaoServico = json['valorIsencaoServico'] == null
      ? null
      : BigDecimal.fromJson(json['valorIsencaoServico'])
  ..valorFrete = json['valorFrete'] == null
      ? null
      : BigDecimal.fromJson(json['valorFrete'])
  ..valorDespesaAcessoria = json['valorDespesaAcessoria'] == null
      ? null
      : BigDecimal.fromJson(json['valorDespesaAcessoria'])
  ..valorIcmsSt = json['valorIcmsSt'] == null
      ? null
      : BigDecimal.fromJson(json['valorIcmsSt'])
  ..descontoPromocao = json['descontoPromocao'] as bool? ?? false
  ..status = json['status'] as String?
  ..dataStatus = json['dataStatus'] == null
      ? null
      : DateTime.parse(json['dataStatus'] as String)
  ..statusExpedicao = json['statusExpedicao'] as String?
  ..idEntregador = json['idEntregador'] as int?
  ..dataCombinada = json['dataCombinada'] == null
      ? null
      : DateTime.parse(json['dataCombinada'] as String)
  ..consumidorDocumento = json['consumidorDocumento'] as String?
  ..consumidorNome = json['consumidorNome'] as String?
  ..motivoCancelamento = json['motivoCancelamento'] as String?
  ..consumo = json['consumo'] == null
      ? null
      : Consumo.fromJson(json['consumo'] as Map<String, dynamic>)
  ..quest = json['quest'] == null
      ? null
      : NotaQuest.fromJson(json['quest'] as Map<String, dynamic>)
  ..notaFiscal = json['notaFiscal'] == null
      ? null
      : NotaFiscal.fromJson(json['notaFiscal'] as Map<String, dynamic>)
  ..tokenSessao = json['tokenSessao'] as String?
  ..idConcentrador = json['idConcentrador'] as int?
  ..itens = (json['itens'] as List<dynamic>?)
          ?.map((e) => NotaItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..finalizadoras = (json['finalizadoras'] as List<dynamic>?)
          ?.map((e) => NotaFinalizadora.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..dadosIntegrador = (json['dadosIntegrador'] as List<dynamic>?)
          ?.map((e) => NotaDadosIntegrador.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..eventos = (json['eventos'] as List<dynamic>?)
          ?.map((e) => NotaEvento.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..contas = (json['contas'] as List<dynamic>?)
          ?.map((e) => Conta.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..clienteContas = (json['clienteContas'] as List<dynamic>?)
          ?.map((e) => ClienteConta.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..documentosVinculados = (json['documentosVinculados'] as List<dynamic>?)
          ?.map((e) => Nota.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..idCanalVenda = json['idCanalVenda'] as int?
  ..canalVenda = json['canalVenda'] == null
      ? null
      : CanalVenda.fromJson(json['canalVenda'] as Map<String, dynamic>)
  ..usaConsumo = json['usaConsumo'] as bool?
  ..versao =
      json['versao'] == null ? null : DateTime.parse(json['versao'] as String)
  ..cliente = json['cliente'] == null
      ? null
      : Cliente.fromJson(json['cliente'] as Map<String, dynamic>);

Map<String, dynamic> _$NotaToJson(Nota instance) => <String, dynamic>{
      'id': instance.id,
      'operacao': instance.operacao,
      'modelo': instance.modelo,
      'idEmpresa': instance.idEmpresa,
      'empresa': instance.empresa?.toJson(),
      'idCaixa': instance.idCaixa,
      'numero': instance.numero,
      'serie': instance.serie,
      'subSerie': instance.subSerie,
      'dataEmissao': instance.dataEmissao?.toIso8601String(),
      'dataLancamento': instance.dataLancamento?.toIso8601String(),
      'dataSaida': instance.dataSaida?.toIso8601String(),
      'idVendedor': instance.idVendedor,
      'idTurno': instance.idTurno,
      'cop': instance.cop?.toJson(),
      'idCliente': instance.idCliente,
      'idClienteAutorizado': instance.idClienteAutorizado,
      'clienteAutorizado': instance.clienteAutorizado?.toJson(),
      'idFornecedor': instance.idFornecedor,
      'fornecedor': instance.fornecedor?.toJson(),
      'idEndereco': instance.idEndereco,
      'valorSubTotal': instance.valorSubTotal?.toJson(),
      'valorTotal': instance.valorTotal?.toJson(),
      'valorAcrescimo': instance.valorAcrescimo?.toJson(),
      'valorDesconto': instance.valorDesconto?.toJson(),
      'valorDescontoItens': instance.valorDescontoItens?.toJson(),
      'valorTotalServico': instance.valorTotalServico?.toJson(),
      'valorIsencaoServico': instance.valorIsencaoServico?.toJson(),
      'valorFrete': instance.valorFrete?.toJson(),
      'valorDespesaAcessoria': instance.valorDespesaAcessoria?.toJson(),
      'valorIcmsSt': instance.valorIcmsSt?.toJson(),
      'descontoPromocao': instance.descontoPromocao,
      'status': instance.status,
      'dataStatus': instance.dataStatus?.toIso8601String(),
      'statusExpedicao': instance.statusExpedicao,
      'idEntregador': instance.idEntregador,
      'dataCombinada': instance.dataCombinada?.toIso8601String(),
      'consumidorDocumento': instance.consumidorDocumento,
      'consumidorNome': instance.consumidorNome,
      'motivoCancelamento': instance.motivoCancelamento,
      'consumo': instance.consumo?.toJson(),
      'quest': instance.quest?.toJson(),
      'notaFiscal': instance.notaFiscal?.toJson(),
      'tokenSessao': instance.tokenSessao,
      'idConcentrador': instance.idConcentrador,
      'itens': instance.itens.map((e) => e.toJson()).toList(),
      'finalizadoras': instance.finalizadoras.map((e) => e.toJson()).toList(),
      'dadosIntegrador':
          instance.dadosIntegrador.map((e) => e.toJson()).toList(),
      'eventos': instance.eventos.map((e) => e.toJson()).toList(),
      'contas': instance.contas.map((e) => e.toJson()).toList(),
      'clienteContas': instance.clienteContas.map((e) => e.toJson()).toList(),
      'documentosVinculados':
          instance.documentosVinculados.map((e) => e.toJson()).toList(),
      'idCanalVenda': instance.idCanalVenda,
      'canalVenda': instance.canalVenda?.toJson(),
      'usaConsumo': instance.usaConsumo,
      'versao': instance.versao?.toIso8601String(),
      'cliente': instance.cliente?.toJson(),
    };

NotaDadosIntegrador _$NotaDadosIntegradorFromJson(Map<String, dynamic> json) =>
    NotaDadosIntegrador()
      ..id = json['id'] as int?
      ..idNota = json['idNota'] as int?
      ..idExterno = json['idExterno'] as String?
      ..versaoClient = json['versaoClient'] as String?
      ..origem = $enumDecodeNullable(_$OrigemIntegracaoEnumMap, json['origem'])
      ..idClient = json['idClient'] as int?
      ..observacao = json['observacao'] as String?;

Map<String, dynamic> _$NotaDadosIntegradorToJson(
        NotaDadosIntegrador instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idNota': instance.idNota,
      'idExterno': instance.idExterno,
      'versaoClient': instance.versaoClient,
      'origem': _$OrigemIntegracaoEnumMap[instance.origem],
      'idClient': instance.idClient,
      'observacao': instance.observacao,
    };

const _$OrigemIntegracaoEnumMap = {
  OrigemIntegracao.WAITER: 'WAITER',
  OrigemIntegracao.WAITER_MOBILE: 'WAITER_MOBILE',
  OrigemIntegracao.ALFA_SYNC: 'ALFA_SYNC',
  OrigemIntegracao.IFOOD: 'IFOOD',
  OrigemIntegracao.RAPPI: 'RAPPI',
  OrigemIntegracao.WABIZ: 'WABIZ',
  OrigemIntegracao.FOURALL: 'FOURALL',
  OrigemIntegracao.CONCENTRADOR: 'CONCENTRADOR',
  OrigemIntegracao.WAYMENU: 'WAYMENU',
  OrigemIntegracao.OUTRO: 'OUTRO',
};

NotaFinalizadora _$NotaFinalizadoraFromJson(Map<String, dynamic> json) =>
    NotaFinalizadora()
      ..id = json['id'] as int?
      ..idNota = json['idNota'] as int?
      ..idFinalizadora = json['idFinalizadora'] as int?
      ..valor =
          json['valor'] == null ? null : BigDecimal.fromJson(json['valor'])
      ..troco =
          json['troco'] == null ? null : BigDecimal.fromJson(json['troco'])
      ..transacaoCartao = json['transacaoCartao'] == null
          ? null
          : TransacaoCartao.fromJson(
              json['transacaoCartao'] as Map<String, dynamic>)
      ..cancelada = json['cancelada'] as bool?
      ..lancamentoManual = json['lancamentoManual'] as bool?
      ..alteracaoManual = json['alteracaoManual'] as bool?;

Map<String, dynamic> _$NotaFinalizadoraToJson(NotaFinalizadora instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idNota': instance.idNota,
      'idFinalizadora': instance.idFinalizadora,
      'valor': instance.valor,
      'troco': instance.troco,
      'transacaoCartao': instance.transacaoCartao,
      'cancelada': instance.cancelada,
      'lancamentoManual': instance.lancamentoManual,
      'alteracaoManual': instance.alteracaoManual,
    };

NotaFiscal _$NotaFiscalFromJson(Map<String, dynamic> json) => NotaFiscal()
  ..id = json['id'] as int?
  ..chave = json['chave'] as String?
  ..chaveCancelamento = json['chaveCancelamento'] as String?
  ..protocolo = json['protocolo'] as String?
  ..modeloFiscal = json['modeloFiscal'] as String?
  ..numeroSerie = json['numeroSerie'] as int?
  ..numeroCfe = json['numeroCfe'] as int?
  ..codigoUf = json['codigoUf'] as int?
  ..dataEmissao = json['dataEmissao'] == null
      ? null
      : DateTime.parse(json['dataEmissao'] as String)
  ..idEmissorFiscal = json['idEmissorFiscal'] as int?
  ..qrCode = json['qrCode'] as String?
  ..notaXml = json['notaXml'] == null
      ? null
      : NotaXml.fromJson(json['notaXml'] as Map<String, dynamic>)
  ..contingenciaFiscal = json['contingenciaFiscal'] == null
      ? null
      : ContingenciaFiscal.fromJson(
          json['contingenciaFiscal'] as Map<String, dynamic>)
  ..erroEmissao = json['erroEmissao'] as String?
  ..idNotaXml = json['idNotaXml'] as int?;

Map<String, dynamic> _$NotaFiscalToJson(NotaFiscal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chave': instance.chave,
      'chaveCancelamento': instance.chaveCancelamento,
      'protocolo': instance.protocolo,
      'modeloFiscal': instance.modeloFiscal,
      'numeroSerie': instance.numeroSerie,
      'numeroCfe': instance.numeroCfe,
      'codigoUf': instance.codigoUf,
      'dataEmissao': instance.dataEmissao?.toIso8601String(),
      'idEmissorFiscal': instance.idEmissorFiscal,
      'qrCode': instance.qrCode,
      'notaXml': instance.notaXml,
      'contingenciaFiscal': instance.contingenciaFiscal,
      'erroEmissao': instance.erroEmissao,
      'idNotaXml': instance.idNotaXml,
    };

NotaItem _$NotaItemFromJson(Map<String, dynamic> json) => NotaItem()
  ..id = json['id'] as int?
  ..idItemPai = json['idItemPai'] as int?
  ..idNota = json['idNota'] as int?
  ..nota = json['nota'] == null
      ? null
      : Nota.fromJson(json['nota'] as Map<String, dynamic>)
  ..tipo = json['tipo'] as String?
  ..idEstacao = json['idEstacao'] as int?
  ..idVendedor = json['idVendedor'] as int?
  ..vendedor = json['vendedor'] == null
      ? null
      : Funcionario.fromJson(json['vendedor'] as Map<String, dynamic>)
  ..idUsuario = json['idUsuario'] as int?
  ..usuario = json['usuario'] == null
      ? null
      : Usuario.fromJson(json['usuario'] as Map<String, dynamic>)
  ..dataLancamento = json['dataLancamento'] == null
      ? null
      : DateTime.parse(json['dataLancamento'] as String)
  ..idTurno = json['idTurno'] as int?
  ..idProdutoEmpresa = json['idProdutoEmpresa'] as int?
  ..produtoEmpresa = json['produtoEmpresa'] == null
      ? null
      : ProdutoEmpresa.fromJson(json['produtoEmpresa'] as Map<String, dynamic>)
  ..idGrade = json['idGrade'] as int?
  ..grade = json['grade'] == null
      ? null
      : GradeEmpresa.fromJson(json['grade'] as Map<String, dynamic>)
  ..indice = json['indice'] as int?
  ..descricao = json['descricao'] as String?
  ..quantidade = json['quantidade'] == null
      ? null
      : BigDecimal.fromJson(json['quantidade'])
  ..precoCusto = json['precoCusto'] == null
      ? null
      : BigDecimal.fromJson(json['precoCusto'])
  ..precoCMC =
      json['precoCMC'] == null ? null : BigDecimal.fromJson(json['precoCMC'])
  ..precoUnitario = json['precoUnitario'] == null
      ? null
      : BigDecimal.fromJson(json['precoUnitario'])
  ..precoTotal = json['precoTotal'] == null
      ? null
      : BigDecimal.fromJson(json['precoTotal'])
  ..taxaServico = json['taxaServico'] == null
      ? null
      : BigDecimal.fromJson(json['taxaServico'])
  ..valorServico = json['valorServico'] == null
      ? null
      : BigDecimal.fromJson(json['valorServico'])
  ..valorDesconto = json['valorDesconto'] == null
      ? null
      : BigDecimal.fromJson(json['valorDesconto'])
  ..valorDescontoRateio = json['valorDescontoRateio'] == null
      ? null
      : BigDecimal.fromJson(json['valorDescontoRateio'])
  ..valorLiquido = json['valorLiquido'] == null
      ? null
      : BigDecimal.fromJson(json['valorLiquido'])
  ..valorAcrescimoRateio = json['valorAcrescimoRateio'] == null
      ? null
      : BigDecimal.fromJson(json['valorAcrescimoRateio'])
  ..valorFreteRateio = json['valorFreteRateio'] == null
      ? null
      : BigDecimal.fromJson(json['valorFreteRateio'])
  ..valorDespesaAcessoriaRateio = json['valorDespesaAcessoriaRateio'] == null
      ? null
      : BigDecimal.fromJson(json['valorDespesaAcessoriaRateio'])
  ..promocao = json['promocao'] == null
      ? null
      : Promocao.fromJson(json['promocao'] as Map<String, dynamic>)
  ..quantidadePromocao = json['quantidadePromocao'] as int?
  ..precoPromocao = json['precoPromocao'] == null
      ? null
      : BigDecimal.fromJson(json['precoPromocao'])
  ..valorDescontoPromocao = json['valorDescontoPromocao'] == null
      ? null
      : BigDecimal.fromJson(json['valorDescontoPromocao'])
  ..cancelado = json['cancelado'] as bool? ?? false
  ..motivoCancelamento = json['motivoCancelamento'] as String?
  ..observacao = json['observacao'] as String?
  ..consumoItem = json['consumoItem'] == null
      ? null
      : ConsumoItem.fromJson(json['consumoItem'] as Map<String, dynamic>?)
  ..subitens = (json['subitens'] as List<dynamic>?)
          ?.map((e) => NotaItem.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..idConcentrador = json['idConcentrador'] as int?
  ..idTabelaPreco = json['idTabelaPreco'] as int?
  ..tabelaPreco = json['tabelaPreco'] == null
      ? null
      : TabelaPreco.fromJson(json['tabelaPreco'] as Map<String, dynamic>)
  ..notaItemFiscal = json['notaItemFiscal'] == null
      ? null
      : NotaItemFiscal.fromJson(json['notaItemFiscal'] as Map<String, dynamic>)
  ..dadosIntegracao = (json['dadosIntegracao'] as List<dynamic>?)
          ?.map((e) =>
              NotaItemDadosIntegracao.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..roundingMode = json['roundingMode'] as String?
  ..somaTotal =
      json['somaTotal'] == null ? null : BigDecimal.fromJson(json['somaTotal']);

Map<String, dynamic> _$NotaItemToJson(NotaItem instance) => <String, dynamic>{
      'id': instance.id,
      'idItemPai': instance.idItemPai,
      'idNota': instance.idNota,
      'nota': instance.nota,
      'tipo': instance.tipo,
      'idEstacao': instance.idEstacao,
      'idVendedor': instance.idVendedor,
      'vendedor': instance.vendedor,
      'idUsuario': instance.idUsuario,
      'usuario': instance.usuario,
      'dataLancamento': instance.dataLancamento?.toIso8601String(),
      'idTurno': instance.idTurno,
      'idProdutoEmpresa': instance.idProdutoEmpresa,
      'produtoEmpresa': instance.produtoEmpresa,
      'idGrade': instance.idGrade,
      'grade': instance.grade,
      'indice': instance.indice,
      'descricao': instance.descricao,
      'quantidade': instance.quantidade,
      'precoCusto': instance.precoCusto,
      'precoCMC': instance.precoCMC,
      'precoUnitario': instance.precoUnitario,
      'precoTotal': instance.precoTotal,
      'taxaServico': instance.taxaServico,
      'valorServico': instance.valorServico,
      'valorDesconto': instance.valorDesconto,
      'valorDescontoRateio': instance.valorDescontoRateio,
      'valorLiquido': instance.valorLiquido,
      'valorAcrescimoRateio': instance.valorAcrescimoRateio,
      'valorFreteRateio': instance.valorFreteRateio,
      'valorDespesaAcessoriaRateio': instance.valorDespesaAcessoriaRateio,
      'promocao': instance.promocao,
      'quantidadePromocao': instance.quantidadePromocao,
      'precoPromocao': instance.precoPromocao,
      'valorDescontoPromocao': instance.valorDescontoPromocao,
      'cancelado': instance.cancelado,
      'motivoCancelamento': instance.motivoCancelamento,
      'observacao': instance.observacao,
      'consumoItem': instance.consumoItem,
      'subitens': instance.subitens,
      'idConcentrador': instance.idConcentrador,
      'idTabelaPreco': instance.idTabelaPreco,
      'tabelaPreco': instance.tabelaPreco,
      'notaItemFiscal': instance.notaItemFiscal,
      'dadosIntegracao': instance.dadosIntegracao,
      'roundingMode': instance.roundingMode,
      'somaTotal': instance.somaTotal,
    };

NotaItemFiscal _$NotaItemFiscalFromJson(Map<String, dynamic> json) =>
    NotaItemFiscal()
      ..id = json['id'] as int?
      ..ncm = json['ncm'] as String?
      ..cest = json['cest'] as String?
      ..csosnIcms = json['csosnIcms'] as String?
      ..cstIcms = json['cstIcms'] as String?
      ..cstPis = json['cstPis'] as String?
      ..cstCofins = json['cstCofins'] as String?
      ..aliquotaIcms = json['aliquotaIcms'] == null
          ? null
          : BigDecimal.fromJson(json['aliquotaIcms'])
      ..aliquotaIcmsEfetiva = json['aliquotaIcmsEfetiva'] == null
          ? null
          : BigDecimal.fromJson(json['aliquotaIcmsEfetiva'])
      ..aliquotaPis = json['aliquotaPis'] == null
          ? null
          : BigDecimal.fromJson(json['aliquotaPis'])
      ..aliquotaCofins = json['aliquotaCofins'] == null
          ? null
          : BigDecimal.fromJson(json['aliquotaCofins'])
      ..percReducaoBcIcms = json['percReducaoBcIcms'] == null
          ? null
          : BigDecimal.fromJson(json['percReducaoBcIcms'])
      ..valorBcIcms = json['valorBcIcms'] == null
          ? null
          : BigDecimal.fromJson(json['valorBcIcms'])
      ..valorBcPis = json['valorBcPis'] == null
          ? null
          : BigDecimal.fromJson(json['valorBcPis'])
      ..valorBcCofins = json['valorBcCofins'] == null
          ? null
          : BigDecimal.fromJson(json['valorBcCofins'])
      ..valorIcms = json['valorIcms'] == null
          ? null
          : BigDecimal.fromJson(json['valorIcms'])
      ..valorPis = json['valorPis'] == null
          ? null
          : BigDecimal.fromJson(json['valorPis'])
      ..valorCofins = json['valorCofins'] == null
          ? null
          : BigDecimal.fromJson(json['valorCofins'])
      ..origemMercadoria = json['origemMercadoria'] as String?
      ..cfop = json['cfop'] as String?
      ..impostoFederal = json['impostoFederal'] == null
          ? null
          : BigDecimal.fromJson(json['impostoFederal'])
      ..impostoEstadual = json['impostoEstadual'] == null
          ? null
          : BigDecimal.fromJson(json['impostoEstadual'])
      ..impostoMunicipal = json['impostoMunicipal'] == null
          ? null
          : BigDecimal.fromJson(json['impostoMunicipal']);

Map<String, dynamic> _$NotaItemFiscalToJson(NotaItemFiscal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ncm': instance.ncm,
      'cest': instance.cest,
      'csosnIcms': instance.csosnIcms,
      'cstIcms': instance.cstIcms,
      'cstPis': instance.cstPis,
      'cstCofins': instance.cstCofins,
      'aliquotaIcms': instance.aliquotaIcms,
      'aliquotaIcmsEfetiva': instance.aliquotaIcmsEfetiva,
      'aliquotaPis': instance.aliquotaPis,
      'aliquotaCofins': instance.aliquotaCofins,
      'percReducaoBcIcms': instance.percReducaoBcIcms,
      'valorBcIcms': instance.valorBcIcms,
      'valorBcPis': instance.valorBcPis,
      'valorBcCofins': instance.valorBcCofins,
      'valorIcms': instance.valorIcms,
      'valorPis': instance.valorPis,
      'valorCofins': instance.valorCofins,
      'origemMercadoria': instance.origemMercadoria,
      'cfop': instance.cfop,
      'impostoFederal': instance.impostoFederal,
      'impostoEstadual': instance.impostoEstadual,
      'impostoMunicipal': instance.impostoMunicipal,
    };

NotaQuest _$NotaQuestFromJson(Map<String, dynamic> json) => NotaQuest()
  ..id = json['id'] as int?
  ..idParticipanteQuest = json['idParticipanteQuest'] as int?
  ..participanteQuest = json['participanteQuest'] == null
      ? null
      : Cliente.fromJson(json['participanteQuest'] as Map<String, dynamic>)
  ..idTransacao = json['idTransacao'] as int?
  ..pontos = json['pontos'] == null ? null : BigDecimal.fromJson(json['pontos'])
  ..token = json['token'] as String?
  ..status = json['status'] as String?;

Map<String, dynamic> _$NotaQuestToJson(NotaQuest instance) => <String, dynamic>{
      'id': instance.id,
      'idParticipanteQuest': instance.idParticipanteQuest,
      'participanteQuest': instance.participanteQuest,
      'idTransacao': instance.idTransacao,
      'pontos': instance.pontos,
      'token': instance.token,
      'status': instance.status,
    };

NovaEmpresaDTO _$NovaEmpresaDTOFromJson(Map<String, dynamic> json) =>
    NovaEmpresaDTO()
      ..empresa = json['empresa'] == null
          ? null
          : Empresa.fromJson(json['empresa'] as Map<String, dynamic>)
      ..modulos = (json['modulos'] as List<dynamic>?)
              ?.map((e) => Modulo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..estacaoTrabalho = json['estacaoTrabalho'] == null
          ? null
          : EstacaoTrabalho.fromJson(
              json['estacaoTrabalho'] as Map<String, dynamic>)
      ..contratoConfiguracao = json['contratoConfiguracao'] == null
          ? null
          : ContratoConfiguracao.fromJson(
              json['contratoConfiguracao'] as Map<String, dynamic>);

Map<String, dynamic> _$NovaEmpresaDTOToJson(NovaEmpresaDTO instance) =>
    <String, dynamic>{
      'empresa': instance.empresa,
      'modulos': instance.modulos,
      'estacaoTrabalho': instance.estacaoTrabalho,
      'contratoConfiguracao': instance.contratoConfiguracao,
    };

Operacao _$OperacaoFromJson(Map<String, dynamic> json) => Operacao()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..tipo = json['tipo'] as String?
  ..data = json['data'] == null ? null : DateTime.parse(json['data'] as String)
  ..valor = json['valor'] == null ? null : BigDecimal.fromJson(json['valor'])
  ..turno = json['turno'] == null
      ? null
      : Turno.fromJson(json['turno'] as Map<String, dynamic>)
  ..cliente = json['cliente'] == null
      ? null
      : Cliente.fromJson(json['cliente'] as Map<String, dynamic>)
  ..favorecido = json['favorecido'] as String?
  ..finalizadoras = (json['finalizadoras'] as List<dynamic>?)
          ?.map((e) => OperacaoFinalizadora.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..idConcentrador = json['idConcentrador'] as int?
  ..historico = json['historico'] as String?
  ..clienteConta = json['clienteConta'] == null
      ? null
      : ClienteConta.fromJson(json['clienteConta'] as Map<String, dynamic>)
  ..idNota = json['idNota'] as int?
  ..nota = json['nota'] == null
      ? null
      : Nota.fromJson(json['nota'] as Map<String, dynamic>)
  ..idUsuarioAlteracaoManual = json['idUsuarioAlteracaoManual'] as int?
  ..usuarioAlteracaoManual = json['usuarioAlteracaoManual'] == null
      ? null
      : Usuario.fromJson(json['usuarioAlteracaoManual'] as Map<String, dynamic>)
  ..idOrigemDaOperacao = json['idOrigemDaOperacao'] as int?
  ..origemDaOperacao = json['origemDaOperacao'] == null
      ? null
      : Operacao.fromJson(json['origemDaOperacao'] as Map<String, dynamic>)
  ..cancelado = json['cancelado'] as bool?
  ..conferido = json['conferido'] as bool?;

Map<String, dynamic> _$OperacaoToJson(Operacao instance) => <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'tipo': instance.tipo,
      'data': instance.data?.toIso8601String(),
      'valor': instance.valor,
      'turno': instance.turno,
      'cliente': instance.cliente,
      'favorecido': instance.favorecido,
      'finalizadoras': instance.finalizadoras,
      'idConcentrador': instance.idConcentrador,
      'historico': instance.historico,
      'clienteConta': instance.clienteConta,
      'idNota': instance.idNota,
      'nota': instance.nota,
      'idUsuarioAlteracaoManual': instance.idUsuarioAlteracaoManual,
      'usuarioAlteracaoManual': instance.usuarioAlteracaoManual,
      'idOrigemDaOperacao': instance.idOrigemDaOperacao,
      'origemDaOperacao': instance.origemDaOperacao,
      'cancelado': instance.cancelado,
      'conferido': instance.conferido,
    };

OperacaoFinalizadora _$OperacaoFinalizadoraFromJson(
        Map<String, dynamic> json) =>
    OperacaoFinalizadora()
      ..id = json['id'] == null
          ? null
          : OperacaoFinalizadoraPK.fromJson(json['id'] as Map<String, dynamic>?)
      ..finalizadoraEmpresa = json['finalizadoraEmpresa'] == null
          ? null
          : FinalizadoraEmpresa.fromJson(
              json['finalizadoraEmpresa'] as Map<String, dynamic>)
      ..valor =
          json['valor'] == null ? null : BigDecimal.fromJson(json['valor']);

Map<String, dynamic> _$OperacaoFinalizadoraToJson(
        OperacaoFinalizadora instance) =>
    <String, dynamic>{
      'id': instance.id,
      'finalizadoraEmpresa': instance.finalizadoraEmpresa,
      'valor': instance.valor,
    };

Participante _$ParticipanteFromJson(Map<String, dynamic> json) => Participante()
  ..cpfCnpjParticipante = json['cpfCnpjParticipante'] as String?
  ..telefones = (json['telefones'] as List<dynamic>?)
          ?.map((e) => ParticipanteTelefone.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..email = json['email'] as String?
  ..nome = json['nome'] as String?
  ..saldoDisponivelPontos = json['saldoDisponivelPontos'] == null
      ? null
      : BigDecimal.fromJson(json['saldoDisponivelPontos'])
  ..saldoDisponivelValor = json['saldoDisponivelValor'] == null
      ? null
      : BigDecimal.fromJson(json['saldoDisponivelValor']);

Map<String, dynamic> _$ParticipanteToJson(Participante instance) =>
    <String, dynamic>{
      'cpfCnpjParticipante': instance.cpfCnpjParticipante,
      'telefones': instance.telefones,
      'email': instance.email,
      'nome': instance.nome,
      'saldoDisponivelPontos': instance.saldoDisponivelPontos,
      'saldoDisponivelValor': instance.saldoDisponivelValor,
    };

Perfil _$PerfilFromJson(Map<String, dynamic> json) => Perfil()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..descricao = json['descricao'] as String?
  ..checkIn = json['checkIn'] as String?
  ..genero = json['genero'] as String?
  ..idadeMinima = json['idadeMinima'] as int?
  ..valorLimiteCartao = json['valorLimiteCartao'] == null
      ? null
      : BigDecimal.fromJson(json['valorLimiteCartao'])
  ..valorConsumacao = json['valorConsumacao'] == null
      ? null
      : BigDecimal.fromJson(json['valorConsumacao'])
  ..taxaEntrada = json['taxaEntrada'] == null
      ? null
      : BigDecimal.fromJson(json['taxaEntrada'])
  ..percentualServico = json['percentualServico'] == null
      ? null
      : BigDecimal.fromJson(json['percentualServico'])
  ..produtoServico = json['produtoServico'] == null
      ? null
      : ProdutoEmpresa.fromJson(json['produtoServico'] as Map<String, dynamic>)
  ..cartaoPrePago = json['cartaoPrePago'] as bool?
  ..finalizadoraEmpresaPrePago = json['finalizadoraEmpresaPrePago'] == null
      ? null
      : FinalizadoraEmpresa.fromJson(
          json['finalizadoraEmpresaPrePago'] as Map<String, dynamic>)
  ..modoConsumoCumulativo = json['modoConsumoCumulativo'] as bool?
  ..validadeInicio = json['validadeInicio'] == null
      ? null
      : DateTime.parse(json['validadeInicio'] as String)
  ..validadeTermino = json['validadeTermino'] == null
      ? null
      : DateTime.parse(json['validadeTermino'] as String)
  ..cartaoInicial = json['cartaoInicial'] as int?
  ..cartaoFinal = json['cartaoFinal'] as int?
  ..informarPromoter = json['informarPromoter'] as bool?
  ..ativo = json['ativo'] as bool?;

Map<String, dynamic> _$PerfilToJson(Perfil instance) => <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'descricao': instance.descricao,
      'checkIn': instance.checkIn,
      'genero': instance.genero,
      'idadeMinima': instance.idadeMinima,
      'valorLimiteCartao': instance.valorLimiteCartao,
      'valorConsumacao': instance.valorConsumacao,
      'taxaEntrada': instance.taxaEntrada,
      'percentualServico': instance.percentualServico,
      'produtoServico': instance.produtoServico,
      'cartaoPrePago': instance.cartaoPrePago,
      'finalizadoraEmpresaPrePago': instance.finalizadoraEmpresaPrePago,
      'modoConsumoCumulativo': instance.modoConsumoCumulativo,
      'validadeInicio': instance.validadeInicio?.toIso8601String(),
      'validadeTermino': instance.validadeTermino?.toIso8601String(),
      'cartaoInicial': instance.cartaoInicial,
      'cartaoFinal': instance.cartaoFinal,
      'informarPromoter': instance.informarPromoter,
      'ativo': instance.ativo,
    };

Pessoa _$PessoaFromJson(Map<String, dynamic> json) => Pessoa()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..codigo = json['codigo'] as int?
  ..nome = json['nome'] as String?
  ..apelido = json['apelido'] as String?
  ..inscricaoFederal = json['inscricaoFederal'] as String?
  ..inscricaoEstadual = json['inscricaoEstadual'] as String?
  ..email = json['email'] as String?
  ..site = json['site'] as String?
  ..tipoPessoa = json['tipoPessoa'] as String?
  ..todosEnderecos = (json['todosEnderecos'] as List<dynamic>?)
          ?.map((e) => Endereco.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..telefones = (json['telefones'] as List<dynamic>?)
          ?.map((e) => Telefone.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..pessoaJuridica = json['pessoaJuridica'] == null
      ? null
      : PessoaJuridica.fromJson(json['pessoaJuridica'] as Map<String, dynamic>?)
  ..pessoaFisica = json['pessoaFisica'] == null
      ? null
      : PessoaFisica.fromJson(json['pessoaFisica'] as Map<String, dynamic>)
  ..idConcentrador = json['idConcentrador'] as int?
  ..versao = json['versao'] as int?
  ..dadosIntegracao = (json['dadosIntegracao'] as List<dynamic>?)
          ?.map(
              (e) => PessoaDadosIntegracao.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [];

Map<String, dynamic> _$PessoaToJson(Pessoa instance) => <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'codigo': instance.codigo,
      'nome': instance.nome,
      'apelido': instance.apelido,
      'inscricaoFederal': instance.inscricaoFederal,
      'inscricaoEstadual': instance.inscricaoEstadual,
      'email': instance.email,
      'site': instance.site,
      'tipoPessoa': instance.tipoPessoa,
      'todosEnderecos': instance.todosEnderecos,
      'telefones': instance.telefones,
      'pessoaJuridica': instance.pessoaJuridica,
      'pessoaFisica': instance.pessoaFisica,
      'idConcentrador': instance.idConcentrador,
      'versao': instance.versao,
      'dadosIntegracao': instance.dadosIntegracao,
    };

PessoaFisica _$PessoaFisicaFromJson(Map<String, dynamic> json) => PessoaFisica()
  ..dataNascimento = json['dataNascimento'] == null
      ? null
      : DateTime.parse(json['dataNascimento'] as String)
  ..numeroCnh = json['numeroCnh'] as String?
  ..categoriaCnh = json['categoriaCnh'] as String?
  ..validadeCnh = json['validadeCnh'] == null
      ? null
      : DateTime.parse(json['validadeCnh'] as String)
  ..naturalidade = json['naturalidade'] as String?
  ..nomePai = json['nomePai'] as String?
  ..nomeMae = json['nomeMae'] as String?
  ..genero = json['genero'] as String?
  ..casaPropria = json['casaPropria'] as bool?
  ..tempoMoradia = json['tempoMoradia'] as int?
  ..estadoCivil = json['estadoCivil'] as String?
  ..profissao = json['profissao'] as String?
  ..rendaMensal = json['rendaMensal'] == null
      ? null
      : BigDecimal.fromJson(json['rendaMensal'])
  ..trabalhoEmpresa = json['trabalhoEmpresa'] as String?
  ..trabalhoSetor = json['trabalhoSetor'] as String?
  ..trabalhoEndereco = json['trabalhoEndereco'] as String?
  ..trabalhoTelefone = json['trabalhoTelefone'] as String?
  ..trabalhoAdmissao = json['trabalhoAdmissao'] == null
      ? null
      : DateTime.parse(json['trabalhoAdmissao'] as String)
  ..conjuge = json['conjuge'] == null
      ? null
      : Pessoa.fromJson(json['conjuge'] as Map<String, dynamic>);

Map<String, dynamic> _$PessoaFisicaToJson(PessoaFisica instance) =>
    <String, dynamic>{
      'dataNascimento': instance.dataNascimento?.toIso8601String(),
      'numeroCnh': instance.numeroCnh,
      'categoriaCnh': instance.categoriaCnh,
      'validadeCnh': instance.validadeCnh?.toIso8601String(),
      'naturalidade': instance.naturalidade,
      'nomePai': instance.nomePai,
      'nomeMae': instance.nomeMae,
      'genero': instance.genero,
      'casaPropria': instance.casaPropria,
      'tempoMoradia': instance.tempoMoradia,
      'estadoCivil': instance.estadoCivil,
      'profissao': instance.profissao,
      'rendaMensal': instance.rendaMensal,
      'trabalhoEmpresa': instance.trabalhoEmpresa,
      'trabalhoSetor': instance.trabalhoSetor,
      'trabalhoEndereco': instance.trabalhoEndereco,
      'trabalhoTelefone': instance.trabalhoTelefone,
      'trabalhoAdmissao': instance.trabalhoAdmissao?.toIso8601String(),
      'conjuge': instance.conjuge,
    };

PisCofins _$PisCofinsFromJson(Map<String, dynamic> json) => PisCofins()
  ..id = json['id'] as int?
  ..codigoNCM = json['codigoNCM'] as String?
  ..ncm = json['ncm'] == null
      ? null
      : Ncm.fromJson(json['ncm'] as Map<String, dynamic>?)
  ..cstPis = json['cstPis'] == null
      ? null
      : CstPisCofins.fromJson(json['cstPis'] as Map<String, dynamic>?)
  ..cstCofins = json['cstCofins'] == null
      ? null
      : CstPisCofins.fromJson(json['cstCofins'] as Map<String, dynamic>?)
  ..tipoOperacao = json['tipoOperacao'] as String?
  ..aliquotaPis = json['aliquotaPis'] == null
      ? null
      : BigDecimal.fromJson(json['aliquotaPis'])
  ..baseCalculoPis = json['baseCalculoPis'] == null
      ? null
      : BigDecimal.fromJson(json['baseCalculoPis'])
  ..aliquotaCofins = json['aliquotaCofins'] == null
      ? null
      : BigDecimal.fromJson(json['aliquotaCofins'])
  ..baseCalculoCofins = json['baseCalculoCofins'] == null
      ? null
      : BigDecimal.fromJson(json['baseCalculoCofins'])
  ..idEmpresa = json['idEmpresa'] as int?;

Map<String, dynamic> _$PisCofinsToJson(PisCofins instance) => <String, dynamic>{
      'id': instance.id,
      'codigoNCM': instance.codigoNCM,
      'ncm': instance.ncm,
      'cstPis': instance.cstPis,
      'cstCofins': instance.cstCofins,
      'tipoOperacao': instance.tipoOperacao,
      'aliquotaPis': instance.aliquotaPis,
      'baseCalculoPis': instance.baseCalculoPis,
      'aliquotaCofins': instance.aliquotaCofins,
      'baseCalculoCofins': instance.baseCalculoCofins,
      'idEmpresa': instance.idEmpresa,
    };

Produto _$ProdutoFromJson(Map<String, dynamic> json) => Produto()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..codigoInterno = json['codigoInterno'] as int?
  ..codigo = json['codigo'] as String?
  ..descricao = json['descricao'] as String?
  ..descricaoAbreviada = json['descricaoAbreviada'] as String?
  ..referencia = json['referencia'] as String?
  ..detalhes = json['detalhes'] as String?
  ..mixPreco = json['mixPreco'] as String?
  ..unidade = json['unidade'] as String?
  ..tipo = json['tipo'] as String?
  ..marca = json['marca'] == null
      ? null
      : ProdutoMarca.fromJson(json['marca'] as Map<String, dynamic>?)
  ..idGrupo = json['idGrupo'] as int?
  ..grupo = json['grupo'] == null
      ? null
      : ProdutoGrupo.fromJson(json['grupo'] as Map<String, dynamic>)
  ..familia = json['familia'] == null
      ? null
      : ProdutoFamilia.fromJson(json['familia'] as Map<String, dynamic>?)
  ..unidadeCompra = json['unidadeCompra'] as String?
  ..quantidadeCompra = json['quantidadeCompra'] == null
      ? null
      : BigDecimal.fromJson(json['quantidadeCompra'])
  ..validadeDias = json['validadeDias'] as int?
  ..garantiaDias = json['garantiaDias'] as int?
  ..dataForaLinha = json['dataForaLinha'] == null
      ? null
      : DateTime.parse(json['dataForaLinha'] as String)
  ..largura =
      json['largura'] == null ? null : BigDecimal.fromJson(json['largura'])
  ..altura = json['altura'] == null ? null : BigDecimal.fromJson(json['altura'])
  ..comprimento = json['comprimento'] == null
      ? null
      : BigDecimal.fromJson(json['comprimento'])
  ..cubagem =
      json['cubagem'] == null ? null : BigDecimal.fromJson(json['cubagem'])
  ..volumes = json['volumes'] as int?
  ..pesoBruto =
      json['pesoBruto'] == null ? null : BigDecimal.fromJson(json['pesoBruto'])
  ..pacote = $enumDecodeNullable(_$TipoPacoteEnumMap, json['pacote']) ??
      TipoPacote.NENHUM
  ..grade = json['grade'] as String?
  ..fiscal = json['fiscal'] == null
      ? null
      : ProdutoFiscal.fromJson(json['fiscal'] as Map<String, dynamic>?)
  ..grades = (json['grades'] as List<dynamic>?)
          ?.map((e) => Grade.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..menus = (json['menus'] as List<dynamic>?)
          ?.map((e) => ProdutoMenu.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..arquivos = (json['arquivos'] as List<dynamic>?)
          ?.map((e) => ProdutoArquivo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..versao = json['versao'] as int?;

Map<String, dynamic> _$ProdutoToJson(Produto instance) => <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'codigoInterno': instance.codigoInterno,
      'codigo': instance.codigo,
      'descricao': instance.descricao,
      'descricaoAbreviada': instance.descricaoAbreviada,
      'referencia': instance.referencia,
      'detalhes': instance.detalhes,
      'mixPreco': instance.mixPreco,
      'unidade': instance.unidade,
      'tipo': instance.tipo,
      'marca': instance.marca,
      'idGrupo': instance.idGrupo,
      'grupo': instance.grupo,
      'familia': instance.familia,
      'unidadeCompra': instance.unidadeCompra,
      'quantidadeCompra': instance.quantidadeCompra,
      'validadeDias': instance.validadeDias,
      'garantiaDias': instance.garantiaDias,
      'dataForaLinha': instance.dataForaLinha?.toIso8601String(),
      'largura': instance.largura,
      'altura': instance.altura,
      'comprimento': instance.comprimento,
      'cubagem': instance.cubagem,
      'volumes': instance.volumes,
      'pesoBruto': instance.pesoBruto,
      'pacote': _$TipoPacoteEnumMap[instance.pacote],
      'grade': instance.grade,
      'fiscal': instance.fiscal,
      'grades': instance.grades,
      'menus': instance.menus,
      'arquivos': instance.arquivos,
      'versao': instance.versao,
    };

const _$TipoPacoteEnumMap = {
  TipoPacote.NENHUM: 'NENHUM',
  TipoPacote.COMBO: 'COMBO',
  TipoPacote.COMPOSTO: 'COMPOSTO',
  TipoPacote.RODIZIO: 'RODIZIO',
  TipoPacote.CESTA_KIT: 'CESTA_KIT',
  TipoPacote.ADICIONAIS: 'ADICIONAIS',
};

ProdutoEmpresa _$ProdutoEmpresaFromJson(Map<String, dynamic> json) =>
    ProdutoEmpresa()
      ..id = json['id'] as int?
      ..idEmpresa = json['idEmpresa'] as int?
      ..idProduto = json['idProduto'] as int?
      ..produto = json['produto'] == null
          ? null
          : Produto.fromJson(json['produto'] as Map<String, dynamic>)
      ..controlaLocalEstocado = json['controlaLocalEstocado'] as bool?
      ..localProducao1 = json['localProducao1'] == null
          ? null
          : LocalProducao.fromJson(
              json['localProducao1'] as Map<String, dynamic>?)
      ..localProducao2 = json['localProducao2'] == null
          ? null
          : LocalProducao.fromJson(
              json['localProducao2'] as Map<String, dynamic>?)
      ..producaoDefinidoComponentes =
          json['producaoDefinidoComponentes'] as bool?
      ..controleCadastro = json['controleCadastro'] == null
          ? null
          : ControleCadastro.fromJson(
              json['controleCadastro'] as Map<String, dynamic>?)
      ..informacaoNutricional = json['informacaoNutricional'] == null
          ? null
          : InformacaoNutricional.fromJson(
              json['informacaoNutricional'] as Map<String, dynamic>?)
      ..tabelaPreco = json['tabelaPreco'] as bool?
      ..precoVariavel = json['precoVariavel'] as bool?
      ..multiplicao = json['multiplicao'] as bool?
      ..fracionamento = json['fracionamento'] as bool?
      ..avisaEstoqueMinimo = json['avisaEstoqueMinimo'] as bool?
      ..cobraTaxaServico = json['cobraTaxaServico'] as bool?
      ..imprimeFichaConsumo = json['imprimeFichaConsumo'] as bool?
      ..ecommerce = json['ecommerce'] as bool?
      ..estocado = json['estocado'] as bool?
      ..itemBalanca = json['itemBalanca'] as bool?
      ..itemCotacao = json['itemCotacao'] as bool?
      ..montagem = json['montagem'] as bool?
      ..enviarCarga = json['enviarCarga'] as bool?
      ..grades = (json['grades'] as List<dynamic>?)
              ?.map((e) => GradeEmpresa.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..getId = json['getId'] as int?
      ..versao = json['versao'] as int?;

Map<String, dynamic> _$ProdutoEmpresaToJson(ProdutoEmpresa instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'idProduto': instance.idProduto,
      'produto': instance.produto,
      'controlaLocalEstocado': instance.controlaLocalEstocado,
      'localProducao1': instance.localProducao1,
      'localProducao2': instance.localProducao2,
      'producaoDefinidoComponentes': instance.producaoDefinidoComponentes,
      'controleCadastro': instance.controleCadastro,
      'informacaoNutricional': instance.informacaoNutricional,
      'tabelaPreco': instance.tabelaPreco,
      'precoVariavel': instance.precoVariavel,
      'multiplicao': instance.multiplicao,
      'fracionamento': instance.fracionamento,
      'avisaEstoqueMinimo': instance.avisaEstoqueMinimo,
      'cobraTaxaServico': instance.cobraTaxaServico,
      'imprimeFichaConsumo': instance.imprimeFichaConsumo,
      'ecommerce': instance.ecommerce,
      'estocado': instance.estocado,
      'itemBalanca': instance.itemBalanca,
      'itemCotacao': instance.itemCotacao,
      'montagem': instance.montagem,
      'enviarCarga': instance.enviarCarga,
      'grades': instance.grades,
      'getId': instance.getId,
      'versao': instance.versao,
    };

ProdutoGrupo _$ProdutoGrupoFromJson(Map<String, dynamic> json) => ProdutoGrupo()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..descricao = json['descricao'] as String?
  ..ecommerce = json['ecommerce'] as bool?
  ..idGrupoPai = json['idGrupoPai'] as int?
  ..padraoSistema = json['padraoSistema'] as bool?
  ..subgrupos = (json['subgrupos'] as List<dynamic>?)
          ?.map((e) => ProdutoGrupo.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..produtos = (json['produtos'] as List<dynamic>?)
          ?.map((e) => ProdutoEmpresa.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..versao = json['versao'] as int?;

Map<String, dynamic> _$ProdutoGrupoToJson(ProdutoGrupo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'descricao': instance.descricao,
      'ecommerce': instance.ecommerce,
      'idGrupoPai': instance.idGrupoPai,
      'padraoSistema': instance.padraoSistema,
      'subgrupos': instance.subgrupos,
      'produtos': instance.produtos,
      'versao': instance.versao,
    };

ProdutoMenu _$ProdutoMenuFromJson(Map<String, dynamic> json) => ProdutoMenu()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..descricao = json['descricao'] as String?
  ..compartilhado = json['compartilhado'] as bool?
  ..tipo = json['tipo'] as String?
  ..indice = json['indice'] as int?
  ..quantidadeMinima = json['quantidadeMinima'] as int?
  ..quantidadeMaxima = json['quantidadeMaxima'] as int?
  ..valorTotal = json['valorTotal'] == null
      ? null
      : BigDecimal.fromJson(json['valorTotal'])
  ..componentes = (json['componentes'] as List<dynamic>?)
          ?.map(
              (e) => ProdutoMenuComponente.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..versao = json['versao'] as int?;

Map<String, dynamic> _$ProdutoMenuToJson(ProdutoMenu instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'descricao': instance.descricao,
      'compartilhado': instance.compartilhado,
      'tipo': instance.tipo,
      'indice': instance.indice,
      'quantidadeMinima': instance.quantidadeMinima,
      'quantidadeMaxima': instance.quantidadeMaxima,
      'valorTotal': instance.valorTotal,
      'componentes': instance.componentes,
      'versao': instance.versao,
    };

ProdutoMenuComponente _$ProdutoMenuComponenteFromJson(
        Map<String, dynamic> json) =>
    ProdutoMenuComponente()
      ..id = json['id'] as int?
      ..descricao = json['descricao'] as String?
      ..idMenu = json['idMenu'] as int?
      ..idGrade = json['idGrade'] as int?
      ..grade = json['grade'] == null
          ? null
          : Grade.fromJson(json['grade'] as Map<String, dynamic>)
      ..observacao = json['observacao'] == null
          ? null
          : Observacao.fromJson(json['observacao'] as Map<String, dynamic>?)
      ..quantidade = json['quantidade'] == null
          ? null
          : BigDecimal.fromJson(json['quantidade'])
      ..quantidadeMinima = json['quantidadeMinima'] as int?
      ..quantidadeMaxima = json['quantidadeMaxima'] as int?
      ..componenteEmpresas = (json['componenteEmpresas'] as List<dynamic>)
          .map((e) =>
              ProdutoMenuComponenteEmpresa.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ProdutoMenuComponenteToJson(
        ProdutoMenuComponente instance) =>
    <String, dynamic>{
      'id': instance.id,
      'descricao': instance.descricao,
      'idMenu': instance.idMenu,
      'idGrade': instance.idGrade,
      'grade': instance.grade,
      'observacao': instance.observacao,
      'quantidade': instance.quantidade,
      'quantidadeMinima': instance.quantidadeMinima,
      'quantidadeMaxima': instance.quantidadeMaxima,
      'componenteEmpresas': instance.componenteEmpresas,
    };

ProdutoMenuComponenteEmpresa _$ProdutoMenuComponenteEmpresaFromJson(
        Map<String, dynamic> json) =>
    ProdutoMenuComponenteEmpresa()
      ..id = json['id'] as int?
      ..idProdutoMenuComponente = json['idProdutoMenuComponente'] as int?
      ..idEmpresa = json['idEmpresa'] as int?
      ..idGradeEmpresa = json['idGradeEmpresa'] as int?
      ..gradeEmpresa = json['gradeEmpresa'] == null
          ? null
          : GradeEmpresa.fromJson(json['gradeEmpresa'] as Map<String, dynamic>)
      ..precos = (json['precos'] as List<dynamic>)
          .map((e) => ProdutoMenuComponenteEmpresaPreco.fromJson(
              e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ProdutoMenuComponenteEmpresaToJson(
        ProdutoMenuComponenteEmpresa instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idProdutoMenuComponente': instance.idProdutoMenuComponente,
      'idEmpresa': instance.idEmpresa,
      'idGradeEmpresa': instance.idGradeEmpresa,
      'gradeEmpresa': instance.gradeEmpresa,
      'precos': instance.precos,
    };

Promocao _$PromocaoFromJson(Map<String, dynamic> json) => Promocao()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..descricao = json['descricao'] as String?
  ..dataCadastro = json['dataCadastro'] == null
      ? null
      : DateTime.parse(json['dataCadastro'] as String)
  ..tipo = json['tipo'] as String?
  ..modalidade = json['modalidade'] as String?
  ..periodicidade = json['periodicidade'] as String?
  ..dataInicial = json['dataInicial'] == null
      ? null
      : DateTime.parse(json['dataInicial'] as String)
  ..dataFinal = json['dataFinal'] == null
      ? null
      : DateTime.parse(json['dataFinal'] as String)
  ..horaInicial = json['horaInicial'] as String?
  ..horaFinal = json['horaFinal'] as String?
  ..segundaFeira = json['segundaFeira'] as bool?
  ..tercaFeira = json['tercaFeira'] as bool?
  ..quartaFeira = json['quartaFeira'] as bool?
  ..quintaFeira = json['quintaFeira'] as bool?
  ..sextaFeira = json['sextaFeira'] as bool?
  ..sabado = json['sabado'] as bool?
  ..domingo = json['domingo'] as bool?
  ..percentualDesconto = json['percentualDesconto'] == null
      ? null
      : BigDecimal.fromJson(json['percentualDesconto'])
  ..baseCalculoComissao = json['baseCalculoComissao'] == null
      ? null
      : BigDecimal.fromJson(json['baseCalculoComissao'])
  ..valorPacote = json['valorPacote'] == null
      ? null
      : BigDecimal.fromJson(json['valorPacote'])
  ..compreQuantidade = json['compreQuantidade'] == null
      ? null
      : BigDecimal.fromJson(json['compreQuantidade'])
  ..pagueQuantidade = json['pagueQuantidade'] == null
      ? null
      : BigDecimal.fromJson(json['pagueQuantidade'])
  ..quantidadeMaximaItens = json['quantidadeMaximaItens'] as int?
  ..custoDiferenciado = json['custoDiferenciado'] as bool?
  ..suspensa = json['suspensa'] as bool?
  ..modulosWaiter =
      (json['modulosWaiter'] as List<dynamic>).map((e) => e as String).toList();

Map<String, dynamic> _$PromocaoToJson(Promocao instance) => <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'descricao': instance.descricao,
      'dataCadastro': instance.dataCadastro?.toIso8601String(),
      'tipo': instance.tipo,
      'modalidade': instance.modalidade,
      'periodicidade': instance.periodicidade,
      'dataInicial': instance.dataInicial?.toIso8601String(),
      'dataFinal': instance.dataFinal?.toIso8601String(),
      'horaInicial': instance.horaInicial,
      'horaFinal': instance.horaFinal,
      'segundaFeira': instance.segundaFeira,
      'tercaFeira': instance.tercaFeira,
      'quartaFeira': instance.quartaFeira,
      'quintaFeira': instance.quintaFeira,
      'sextaFeira': instance.sextaFeira,
      'sabado': instance.sabado,
      'domingo': instance.domingo,
      'percentualDesconto': instance.percentualDesconto,
      'baseCalculoComissao': instance.baseCalculoComissao,
      'valorPacote': instance.valorPacote,
      'compreQuantidade': instance.compreQuantidade,
      'pagueQuantidade': instance.pagueQuantidade,
      'quantidadeMaximaItens': instance.quantidadeMaximaItens,
      'custoDiferenciado': instance.custoDiferenciado,
      'suspensa': instance.suspensa,
      'modulosWaiter': instance.modulosWaiter,
    };

RecebimentoParcial _$RecebimentoParcialFromJson(Map<String, dynamic> json) =>
    RecebimentoParcial()
      ..nota = json['nota'] == null
          ? null
          : Nota.fromJson(json['nota'] as Map<String, dynamic>)
      ..tipoRecebimento = json['tipoRecebimento'] as String?
      ..finalizadoras = (json['finalizadoras'] as List<dynamic>?)
              ?.map((e) => NotaFinalizadora.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..itens = (json['itens'] as List<dynamic>?)
              ?.map((e) => NotaItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

Map<String, dynamic> _$RecebimentoParcialToJson(RecebimentoParcial instance) =>
    <String, dynamic>{
      'nota': instance.nota,
      'tipoRecebimento': instance.tipoRecebimento,
      'finalizadoras': instance.finalizadoras,
      'itens': instance.itens,
    };

Regiao _$RegiaoFromJson(Map<String, dynamic> json) => Regiao()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..descricao = json['descricao'] as String?
  ..pontoReferencia = json['pontoReferencia'] as String?
  ..valor = json['valor'] == null ? null : BigDecimal.fromJson(json['valor'])
  ..itinerario = json['itinerario'] as int?
  ..prazoEntregaDias = json['prazoEntregaDias'] as int?
  ..tipoValor = json['tipoValor'] as String?
  ..cidade = json['cidade'] == null
      ? null
      : Cidade.fromJson(json['cidade'] as Map<String, dynamic>?)
  ..regioesEmpresa = (json['regioesEmpresa'] as List<dynamic>?)
          ?.map((e) => RegiaoEmpresa.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..versao = json['versao'] as int?;

Map<String, dynamic> _$RegiaoToJson(Regiao instance) => <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'descricao': instance.descricao,
      'pontoReferencia': instance.pontoReferencia,
      'valor': instance.valor,
      'itinerario': instance.itinerario,
      'prazoEntregaDias': instance.prazoEntregaDias,
      'tipoValor': instance.tipoValor,
      'cidade': instance.cidade,
      'regioesEmpresa': instance.regioesEmpresa,
      'versao': instance.versao,
    };

ReservaMesa _$ReservaMesaFromJson(Map<String, dynamic> json) => ReservaMesa()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..idUsuario = json['idUsuario'] as int?
  ..mesa = json['mesa'] as int?
  ..data = json['data'] == null ? null : DateTime.parse(json['data'] as String)
  ..nome = json['nome'] as String?
  ..pessoas = json['pessoas'] as int?
  ..observacao = json['observacao'] as String?
  ..statusReserva = json['statusReserva'] as String?;

Map<String, dynamic> _$ReservaMesaToJson(ReservaMesa instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'idUsuario': instance.idUsuario,
      'mesa': instance.mesa,
      'data': instance.data?.toIso8601String(),
      'nome': instance.nome,
      'pessoas': instance.pessoas,
      'observacao': instance.observacao,
      'statusReserva': instance.statusReserva,
    };

ServicoImpressaoDTO _$ServicoImpressaoDTOFromJson(Map<String, dynamic> json) =>
    ServicoImpressaoDTO()
      ..tipo = json['tipo'] as String?
      ..cabecalho = json['cabecalho'] == null
          ? null
          : NotaItem.fromJson(json['cabecalho'] as Map<String, dynamic>)
      ..auxiliarProducao = json['auxiliarProducao'] == null
          ? null
          : AuxiliarProducao.fromJson(
              json['auxiliarProducao'] as Map<String, dynamic>)
      ..estacaoImpressora = json['estacaoImpressora'] == null
          ? null
          : EstacaoImpressora.fromJson(
              json['estacaoImpressora'] as Map<String, dynamic>?)
      ..notaItems = (json['notaItems'] as List<dynamic>)
          .map((e) => NotaItem.fromJson(e as Map<String, dynamic>))
          .toList()
      ..modulo = json['modulo'] == null
          ? null
          : Modulo.fromJson(json['modulo'] as Map<String, dynamic>)
      ..estacaoTrabalho = json['estacaoTrabalho'] == null
          ? null
          : EstacaoTrabalho.fromJson(
              json['estacaoTrabalho'] as Map<String, dynamic>);

Map<String, dynamic> _$ServicoImpressaoDTOToJson(
        ServicoImpressaoDTO instance) =>
    <String, dynamic>{
      'tipo': instance.tipo,
      'cabecalho': instance.cabecalho,
      'auxiliarProducao': instance.auxiliarProducao,
      'estacaoImpressora': instance.estacaoImpressora,
      'notaItems': instance.notaItems,
      'modulo': instance.modulo,
      'estacaoTrabalho': instance.estacaoTrabalho,
    };

Setor _$SetorFromJson(Map<String, dynamic> json) => Setor()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..nome = json['nome'] as String?
  ..descricao = json['descricao'] as String?
  ..idLayoutControle = json['idLayoutControle'] as int?
  ..layoutControle = json['layoutControle'] == null
      ? null
      : LayoutControle.fromJson(json['layoutControle'] as Map<String, dynamic>)
  ..percentualComissao = json['percentualComissao'] == null
      ? null
      : BigDecimal.fromJson(json['percentualComissao'])
  ..taxaServico = json['taxaServico'] as bool?
  ..idLocal = json['idLocal'] as int?
  ..ativo = json['ativo'] as bool?
  ..padrao = json['padrao'] as bool?
  ..enderecos = (json['enderecos'] as List<dynamic>?)
          ?.map((e) => EnderecoEstoque.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..versao = json['versao'] as int?;

Map<String, dynamic> _$SetorToJson(Setor instance) => <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'nome': instance.nome,
      'descricao': instance.descricao,
      'idLayoutControle': instance.idLayoutControle,
      'layoutControle': instance.layoutControle,
      'percentualComissao': instance.percentualComissao,
      'taxaServico': instance.taxaServico,
      'idLocal': instance.idLocal,
      'ativo': instance.ativo,
      'padrao': instance.padrao,
      'enderecos': instance.enderecos,
      'versao': instance.versao,
    };

TabelaPreco _$TabelaPrecoFromJson(Map<String, dynamic> json) => TabelaPreco()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..empresa = json['empresa'] == null
      ? null
      : Empresa.fromJson(json['empresa'] as Map<String, dynamic>)
  ..codigo = json['codigo'] as int?
  ..descricao = json['descricao'] as String?
  ..padrao = json['padrao'] as bool? ?? false
  ..ativo = json['ativo'] as bool? ?? true
  ..empresas = (json['empresas'] as List<dynamic>?)
          ?.map((e) => Empresa.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [];

Map<String, dynamic> _$TabelaPrecoToJson(TabelaPreco instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'empresa': instance.empresa,
      'codigo': instance.codigo,
      'descricao': instance.descricao,
      'padrao': instance.padrao,
      'ativo': instance.ativo,
      'empresas': instance.empresas,
    };

TransacaoCartao _$TransacaoCartaoFromJson(Map<String, dynamic> json) =>
    TransacaoCartao()
      ..id = json['id'] as int?
      ..idEmpresa = json['idEmpresa'] as int?
      ..data =
          json['data'] == null ? null : DateTime.parse(json['data'] as String)
      ..valor =
          json['valor'] == null ? null : BigDecimal.fromJson(json['valor'])
      ..numeroParcelas = json['numeroParcelas'] as int?
      ..codigoAutorizacao = json['codigoAutorizacao'] as String?
      ..nsu = json['nsu'] as String?
      ..sucesso = json['sucesso'] as bool?
      ..idBandeira = json['idBandeira'] as int?
      ..viaCliente = json['viaCliente'] as String?
      ..viaCaixa = json['viaCaixa'] as String?
      ..bandeira = json['bandeira'] == null
          ? null
          : BandeiraCartao.fromJson(json['bandeira'] as Map<String, dynamic>)
      ..transacaoSituacao = json['transacaoSituacao'] as String?
      ..idTransacaoCancelamento = json['idTransacaoCancelamento'] as int?
      ..hashUnica = json['hashUnica'] as String?
      ..orderId = json['orderId'] as String?;

Map<String, dynamic> _$TransacaoCartaoToJson(TransacaoCartao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'data': instance.data?.toIso8601String(),
      'valor': instance.valor,
      'numeroParcelas': instance.numeroParcelas,
      'codigoAutorizacao': instance.codigoAutorizacao,
      'nsu': instance.nsu,
      'sucesso': instance.sucesso,
      'idBandeira': instance.idBandeira,
      'viaCliente': instance.viaCliente,
      'viaCaixa': instance.viaCaixa,
      'bandeira': instance.bandeira,
      'transacaoSituacao': instance.transacaoSituacao,
      'idTransacaoCancelamento': instance.idTransacaoCancelamento,
      'hashUnica': instance.hashUnica,
      'orderId': instance.orderId,
    };

Turno _$TurnoFromJson(Map<String, dynamic> json) => Turno()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..idCaixa = json['idCaixa'] as int?
  ..caixa = json['caixa'] == null
      ? null
      : EstacaoTrabalho.fromJson(json['caixa'] as Map<String, dynamic>)
  ..movimento = json['movimento'] == null
      ? null
      : Movimento.fromJson(json['movimento'] as Map<String, dynamic>?)
  ..chave = json['chave'] as String?
  ..usuario = json['usuario'] == null
      ? null
      : Usuario.fromJson(json['usuario'] as Map<String, dynamic>)
  ..status = json['status'] as String?
  ..dataAbertura = json['dataAbertura'] == null
      ? null
      : DateTime.parse(json['dataAbertura'] as String)
  ..dataFechamento = json['dataFechamento'] == null
      ? null
      : DateTime.parse(json['dataFechamento'] as String)
  ..dataConferencia = json['dataConferencia'] == null
      ? null
      : DateTime.parse(json['dataConferencia'] as String)
  ..observacao = json['observacao'] as String?
  ..valorDiferenca = json['valorDiferenca'] == null
      ? null
      : BigDecimal.fromJson(json['valorDiferenca'])
  ..sequencia = json['sequencia'] as int?
  ..idConcentrador = json['idConcentrador'] as int?
  ..fechamentos = (json['fechamentos'] as List<dynamic>)
      .map((e) => TurnoFechamento.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$TurnoToJson(Turno instance) => <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'idCaixa': instance.idCaixa,
      'caixa': instance.caixa,
      'movimento': instance.movimento,
      'chave': instance.chave,
      'usuario': instance.usuario,
      'status': instance.status,
      'dataAbertura': instance.dataAbertura?.toIso8601String(),
      'dataFechamento': instance.dataFechamento?.toIso8601String(),
      'dataConferencia': instance.dataConferencia?.toIso8601String(),
      'observacao': instance.observacao,
      'valorDiferenca': instance.valorDiferenca,
      'sequencia': instance.sequencia,
      'idConcentrador': instance.idConcentrador,
      'fechamentos': instance.fechamentos,
    };

TurnoFechamento _$TurnoFechamentoFromJson(Map<String, dynamic> json) =>
    TurnoFechamento()
      ..id = json['id'] == null
          ? null
          : TurnoFechamentoPK.fromJson(json['id'] as Map<String, dynamic>?)
      ..controleRegistro = json['controleRegistro'] == null
          ? null
          : ControleRegistro.fromJson(
              json['controleRegistro'] as Map<String, dynamic>?)
      ..finalizadoraEmpresa = json['finalizadoraEmpresa'] == null
          ? null
          : FinalizadoraEmpresa.fromJson(
              json['finalizadoraEmpresa'] as Map<String, dynamic>)
      ..valorDigitado = json['valorDigitado'] == null
          ? null
          : BigDecimal.fromJson(json['valorDigitado'])
      ..valorApurado = json['valorApurado'] == null
          ? null
          : BigDecimal.fromJson(json['valorApurado']);

Map<String, dynamic> _$TurnoFechamentoToJson(TurnoFechamento instance) =>
    <String, dynamic>{
      'id': instance.id,
      'controleRegistro': instance.controleRegistro,
      'finalizadoraEmpresa': instance.finalizadoraEmpresa,
      'valorDigitado': instance.valorDigitado,
      'valorApurado': instance.valorApurado,
    };

UnidadeFederativa _$UnidadeFederativaFromJson(Map<String, dynamic> json) =>
    UnidadeFederativa()
      ..uf = json['uf'] as String?
      ..codigo = json['codigo'] as int?
      ..nome = json['nome'] as String?
      ..aliquotaIcmsFcp = json['aliquotaIcmsFcp'] == null
          ? null
          : BigDecimal.fromJson(json['aliquotaIcmsFcp'])
      ..percentualPartilhaIcms = json['percentualPartilhaIcms'] as int?
      ..pafEcf = json['pafEcf'] as bool?
      ..pais = json['pais'] == null
          ? null
          : Pais.fromJson(json['pais'] as Map<String, dynamic>?);

Map<String, dynamic> _$UnidadeFederativaToJson(UnidadeFederativa instance) =>
    <String, dynamic>{
      'uf': instance.uf,
      'codigo': instance.codigo,
      'nome': instance.nome,
      'aliquotaIcmsFcp': instance.aliquotaIcmsFcp,
      'percentualPartilhaIcms': instance.percentualPartilhaIcms,
      'pafEcf': instance.pafEcf,
      'pais': instance.pais,
    };

Usuario _$UsuarioFromJson(Map<String, dynamic> json) => Usuario()
  ..id = json['id'] as int?
  ..uid = json['uid'] as String?
  ..nome = json['nome'] as String?
  ..cpf = json['cpf'] as String?
  ..email = json['email'] as String?
  ..telefone = json['telefone'] as String?
  ..username = json['username'] as String?
  ..password = json['password'] as String?
  ..pin = json['pin'] as int?
  ..confirmado = json['confirmado'] as bool?
  ..tentativasLogin = json['tentativasLogin'] as int?
  ..dataBloqueio = json['dataBloqueio'] == null
      ? null
      : DateTime.parse(json['dataBloqueio'] as String)
  ..controleCadastro = json['controleCadastro'] == null
      ? null
      : ControleCadastro.fromJson(
          json['controleCadastro'] as Map<String, dynamic>?)
  ..genero = json['genero'] as String?
  ..dataNascimento = json['dataNascimento'] == null
      ? null
      : DateTime.parse(json['dataNascimento'] as String);

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'nome': instance.nome,
      'cpf': instance.cpf,
      'email': instance.email,
      'telefone': instance.telefone,
      'username': instance.username,
      'password': instance.password,
      'pin': instance.pin,
      'confirmado': instance.confirmado,
      'tentativasLogin': instance.tentativasLogin,
      'dataBloqueio': instance.dataBloqueio?.toIso8601String(),
      'controleCadastro': instance.controleCadastro,
      'genero': instance.genero,
      'dataNascimento': instance.dataNascimento?.toIso8601String(),
    };

UsuarioEmpresa _$UsuarioEmpresaFromJson(Map<String, dynamic> json) =>
    UsuarioEmpresa()
      ..id = json['id'] as int?
      ..usuario = json['usuario'] == null
          ? null
          : Usuario.fromJson(json['usuario'] as Map<String, dynamic>)
      ..idEmpresa = json['idEmpresa'] as int?
      ..empresa = json['empresa'] == null
          ? null
          : Empresa.fromJson(json['empresa'] as Map<String, dynamic>)
      ..perfil = json['perfil'] as String?
      ..idVendedor = json['idVendedor'] as int?
      ..vendedor = json['vendedor'] == null
          ? null
          : Funcionario.fromJson(json['vendedor'] as Map<String, dynamic>)
      ..padrao = json['padrao'] as bool?
      ..usuarioPerfilEmpresa = json['usuarioPerfilEmpresa'] == null
          ? null
          : UsuarioPerfilEmpresa.fromJson(
              json['usuarioPerfilEmpresa'] as Map<String, dynamic>)
      ..ativo = json['ativo'] as bool?;

Map<String, dynamic> _$UsuarioEmpresaToJson(UsuarioEmpresa instance) =>
    <String, dynamic>{
      'id': instance.id,
      'usuario': instance.usuario,
      'idEmpresa': instance.idEmpresa,
      'empresa': instance.empresa,
      'perfil': instance.perfil,
      'idVendedor': instance.idVendedor,
      'vendedor': instance.vendedor,
      'padrao': instance.padrao,
      'usuarioPerfilEmpresa': instance.usuarioPerfilEmpresa,
      'ativo': instance.ativo,
    };

Vendedor _$VendedorFromJson(Map<String, dynamic> json) => Vendedor()
  ..codigoVenda = json['codigoVenda'] as int?
  ..identfid = json['identfid'] as String?
  ..percentualComissao = json['percentualComissao'] == null
      ? null
      : BigDecimal.fromJson(json['percentualComissao'])
  ..tabelaPreco = json['tabelaPreco'] == null
      ? null
      : TabelaPreco.fromJson(json['tabelaPreco'] as Map<String, dynamic>)
  ..tipoComissao = json['tipoComissao'] as String?;

Map<String, dynamic> _$VendedorToJson(Vendedor instance) => <String, dynamic>{
      'codigoVenda': instance.codigoVenda,
      'identfid': instance.identfid,
      'percentualComissao': instance.percentualComissao,
      'tabelaPreco': instance.tabelaPreco,
      'tipoComissao': instance.tipoComissao,
    };

WaycardAutorizacaoPgtoDTO _$WaycardAutorizacaoPgtoDTOFromJson(
        Map<String, dynamic> json) =>
    WaycardAutorizacaoPgtoDTO()
      ..idEmpresa = json['idEmpresa'] as int?
      ..codigoAutorizacao = json['codigoAutorizacao'] as String?
      ..numeroVenda = json['numeroVenda'] as String?
      ..valor =
          json['valor'] == null ? null : BigDecimal.fromJson(json['valor']);

Map<String, dynamic> _$WaycardAutorizacaoPgtoDTOToJson(
        WaycardAutorizacaoPgtoDTO instance) =>
    <String, dynamic>{
      'idEmpresa': instance.idEmpresa,
      'codigoAutorizacao': instance.codigoAutorizacao,
      'numeroVenda': instance.numeroVenda,
      'valor': instance.valor,
    };

WaycardFatura _$WaycardFaturaFromJson(Map<String, dynamic> json) =>
    WaycardFatura()
      ..id = json['id'] as int?
      ..idBandeira = json['idBandeira'] as int?
      ..valor =
          json['valor'] == null ? null : BigDecimal.fromJson(json['valor'])
      ..dataAbertura = json['dataAbertura'] == null
          ? null
          : DateTime.parse(json['dataAbertura'] as String)
      ..dataFechamento = json['dataFechamento'] == null
          ? null
          : DateTime.parse(json['dataFechamento'] as String)
      ..dataPagamento = json['dataPagamento'] == null
          ? null
          : DateTime.parse(json['dataPagamento'] as String)
      ..status = json['status'] as String?;

Map<String, dynamic> _$WaycardFaturaToJson(WaycardFatura instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idBandeira': instance.idBandeira,
      'valor': instance.valor,
      'dataAbertura': instance.dataAbertura?.toIso8601String(),
      'dataFechamento': instance.dataFechamento?.toIso8601String(),
      'dataPagamento': instance.dataPagamento?.toIso8601String(),
      'status': instance.status,
    };

WaycardTransacao _$WaycardTransacaoFromJson(Map<String, dynamic> json) =>
    WaycardTransacao()
      ..id = json['id'] as int?
      ..idFatura = json['idFatura'] as int?
      ..fatura = json['fatura'] == null
          ? null
          : WaycardFatura.fromJson(json['fatura'] as Map<String, dynamic>)
      ..idCartao = json['idCartao'] as int?
      ..idLojista = json['idLojista'] as int?
      ..lojista = json['lojista'] == null
          ? null
          : Lojista.fromJson(json['lojista'] as Map<String, dynamic>)
      ..valor =
          json['valor'] == null ? null : BigDecimal.fromJson(json['valor'])
      ..numeroVenda = json['numeroVenda'] as String?
      ..data =
          json['data'] == null ? null : DateTime.parse(json['data'] as String)
      ..status = json['status'] as String?
      ..nsu = json['nsu'] as String?;

Map<String, dynamic> _$WaycardTransacaoToJson(WaycardTransacao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idFatura': instance.idFatura,
      'fatura': instance.fatura,
      'idCartao': instance.idCartao,
      'idLojista': instance.idLojista,
      'lojista': instance.lojista,
      'valor': instance.valor,
      'numeroVenda': instance.numeroVenda,
      'data': instance.data?.toIso8601String(),
      'status': instance.status,
      'nsu': instance.nsu,
    };

ContratoConfiguracao _$ContratoConfiguracaoFromJson(
        Map<String, dynamic> json) =>
    ContratoConfiguracao()
      ..tipoContrato = json['tipoContrato'] as String?
      ..diasTrial = json['diasTrial'] as int?
      ..numeroUsuarios = json['numeroUsuarios'] as int?
      ..moduloEstoque = json['moduloEstoque'] as bool?
      ..moduloGrade = json['moduloGrade'] as bool?
      ..moduloPacoteProduto = json['moduloPacoteProduto'] as bool?
      ..moduloObservacaoProduto = json['moduloObservacaoProduto'] as bool?
      ..moduloPromocao = json['moduloPromocao'] as bool?
      ..moduloFinanceiro = json['moduloFinanceiro'] as bool?
      ..moduloFicha = json['moduloFicha'] as bool?
      ..moduloMesa = json['moduloMesa'] as bool?
      ..moduloDelivery = json['moduloDelivery'] as bool?
      ..moduloCartao = json['moduloCartao'] as bool?
      ..moduloBalcao = json['moduloBalcao'] as bool?
      ..moduloDriveThru = json['moduloDriveThru'] as bool?
      ..moduloAutoatendimento = json['moduloAutoatendimento'] as bool?
      ..aplicativoWaychef = json['aplicativoWaychef'] as bool?
      ..servicoImpressao = json['servicoImpressao'] as bool?
      ..ativo = json['ativo'] as bool?
      ..indice = json['indice'] as int?
      ..valorMensal = json['valorMensal'] == null
          ? null
          : BigDecimal.fromJson(json['valorMensal'])
      ..valorTrimestral = json['valorTrimestral'] == null
          ? null
          : BigDecimal.fromJson(json['valorTrimestral'])
      ..valorSemestral = json['valorSemestral'] == null
          ? null
          : BigDecimal.fromJson(json['valorSemestral'])
      ..valorAnual = json['valorAnual'] == null
          ? null
          : BigDecimal.fromJson(json['valorAnual'])
      ..valorUsuarioAdicional = json['valorUsuarioAdicional'] == null
          ? null
          : BigDecimal.fromJson(json['valorUsuarioAdicional'])
      ..limiteProdutos = json['limiteProdutos'] as int?
      ..limiteFaturamento = json['limiteFaturamento'] == null
          ? null
          : BigDecimal.fromJson(json['limiteFaturamento'])
      ..limiteContasReceber = json['limiteContasReceber'] == null
          ? null
          : BigDecimal.fromJson(json['limiteContasReceber'])
      ..limiteContasPagar = json['limiteContasPagar'] == null
          ? null
          : BigDecimal.fromJson(json['limiteContasPagar'])
      ..limiteNfeSaida = json['limiteNfeSaida'] as int?
      ..nfeEntrada = json['nfeEntrada'] as bool?;

Map<String, dynamic> _$ContratoConfiguracaoToJson(
        ContratoConfiguracao instance) =>
    <String, dynamic>{
      'tipoContrato': instance.tipoContrato,
      'diasTrial': instance.diasTrial,
      'numeroUsuarios': instance.numeroUsuarios,
      'moduloEstoque': instance.moduloEstoque,
      'moduloGrade': instance.moduloGrade,
      'moduloPacoteProduto': instance.moduloPacoteProduto,
      'moduloObservacaoProduto': instance.moduloObservacaoProduto,
      'moduloPromocao': instance.moduloPromocao,
      'moduloFinanceiro': instance.moduloFinanceiro,
      'moduloFicha': instance.moduloFicha,
      'moduloMesa': instance.moduloMesa,
      'moduloDelivery': instance.moduloDelivery,
      'moduloCartao': instance.moduloCartao,
      'moduloBalcao': instance.moduloBalcao,
      'moduloDriveThru': instance.moduloDriveThru,
      'moduloAutoatendimento': instance.moduloAutoatendimento,
      'aplicativoWaychef': instance.aplicativoWaychef,
      'servicoImpressao': instance.servicoImpressao,
      'ativo': instance.ativo,
      'indice': instance.indice,
      'valorMensal': instance.valorMensal,
      'valorTrimestral': instance.valorTrimestral,
      'valorSemestral': instance.valorSemestral,
      'valorAnual': instance.valorAnual,
      'valorUsuarioAdicional': instance.valorUsuarioAdicional,
      'limiteProdutos': instance.limiteProdutos,
      'limiteFaturamento': instance.limiteFaturamento,
      'limiteContasReceber': instance.limiteContasReceber,
      'limiteContasPagar': instance.limiteContasPagar,
      'limiteNfeSaida': instance.limiteNfeSaida,
      'nfeEntrada': instance.nfeEntrada,
    };

WizardBuscarPlanosEnvelop _$WizardBuscarPlanosEnvelopFromJson(
        Map<String, dynamic> json) =>
    WizardBuscarPlanosEnvelop()
      ..contratoConfiguracaoList = (json['contratoConfiguracaoList']
              as List<dynamic>?)
          ?.map((e) => ContratoConfiguracao.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$WizardBuscarPlanosEnvelopToJson(
        WizardBuscarPlanosEnvelop instance) =>
    <String, dynamic>{
      'contratoConfiguracaoList': instance.contratoConfiguracaoList,
    };

WizardBuscarEmpresaEnvelop _$WizardBuscarEmpresaEnvelopFromJson(
        Map<String, dynamic> json) =>
    WizardBuscarEmpresaEnvelop()
      ..buscarEmpresaDTOList = (json['buscarEmpresaDTOList'] as List<dynamic>?)
          ?.map(
              (e) => WizardBuscarEmpresaDTO.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$WizardBuscarEmpresaEnvelopToJson(
        WizardBuscarEmpresaEnvelop instance) =>
    <String, dynamic>{
      'buscarEmpresaDTOList': instance.buscarEmpresaDTOList,
    };

WizardBuscarEmpresaDTO _$WizardBuscarEmpresaDTOFromJson(
        Map<String, dynamic> json) =>
    WizardBuscarEmpresaDTO()
      ..empresaDTO = json['empresaDTO'] == null
          ? null
          : EmpresaDTO.fromJson(json['empresaDTO'] as Map<String, dynamic>)
      ..emailMaster = json['emailMaster'] as String?
      ..usaConcentrador = json['usaConcentrador'] as bool?;

Map<String, dynamic> _$WizardBuscarEmpresaDTOToJson(
        WizardBuscarEmpresaDTO instance) =>
    <String, dynamic>{
      'empresaDTO': instance.empresaDTO,
      'emailMaster': instance.emailMaster,
      'usaConcentrador': instance.usaConcentrador,
    };

WizardValidarMasterDTO _$WizardValidarMasterDTOFromJson(
        Map<String, dynamic> json) =>
    WizardValidarMasterDTO()
      ..user = json['user'] == null
          ? null
          : Usuario.fromJson(json['user'] as Map<String, dynamic>)
      ..clientSecret = json['clientSecret'] as String?;

Map<String, dynamic> _$WizardValidarMasterDTOToJson(
        WizardValidarMasterDTO instance) =>
    <String, dynamic>{
      'user': instance.user,
      'clientSecret': instance.clientSecret,
    };

ReceitawsEmpresa _$ReceitawsEmpresaFromJson(Map<String, dynamic> json) =>
    ReceitawsEmpresa()
      ..nome = json['nome'] as String?
      ..uf = json['uf'] as String?
      ..telefone = json['telefone'] as String?
      ..bairro = json['bairro'] as String?
      ..logradouro = json['logradouro'] as String?
      ..numero = json['numero'] as String?
      ..cep = json['cep'] as String?
      ..municipio = json['municipio'] as String?
      ..fantasia = json['fantasia'] as String?
      ..cnpj = json['cnpj'] as String?
      ..complemento = json['complemento'] as String?;

Map<String, dynamic> _$ReceitawsEmpresaToJson(ReceitawsEmpresa instance) =>
    <String, dynamic>{
      'nome': instance.nome,
      'uf': instance.uf,
      'telefone': instance.telefone,
      'bairro': instance.bairro,
      'logradouro': instance.logradouro,
      'numero': instance.numero,
      'cep': instance.cep,
      'municipio': instance.municipio,
      'fantasia': instance.fantasia,
      'cnpj': instance.cnpj,
      'complemento': instance.complemento,
    };

CanalVenda _$CanalVendaFromJson(Map<String, dynamic> json) => CanalVenda()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..empresa = json['empresa'] == null
      ? null
      : Empresa.fromJson(json['empresa'] as Map<String, dynamic>)
  ..descricao = json['descricao'] as String?
  ..idTabelaPreco = json['idTabelaPreco'] as int?
  ..tabelaPreco = json['tabelaPreco'] == null
      ? null
      : TabelaPreco.fromJson(json['tabelaPreco'] as Map<String, dynamic>)
  ..padrao = json['padrao'] as bool
  ..empresas = (json['empresas'] as List<dynamic>?)
          ?.map((e) => CanalVendaEmpresa.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [];

Map<String, dynamic> _$CanalVendaToJson(CanalVenda instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'empresa': instance.empresa,
      'descricao': instance.descricao,
      'idTabelaPreco': instance.idTabelaPreco,
      'tabelaPreco': instance.tabelaPreco,
      'padrao': instance.padrao,
      'empresas': instance.empresas,
    };

CanalVendaEmpresa _$CanalVendaEmpresaFromJson(Map<String, dynamic> json) =>
    CanalVendaEmpresa()
      ..id = json['id'] as int?
      ..idEmpresa = json['idEmpresa'] as int?
      ..empresa = json['empresa'] == null
          ? null
          : Empresa.fromJson(json['empresa'] as Map<String, dynamic>)
      ..idCanalVenda = json['idCanalVenda'] as int?
      ..canalVenda = json['canalVenda'] == null
          ? null
          : CanalVenda.fromJson(json['canalVenda'] as Map<String, dynamic>)
      ..ativo = json['ativo'] as bool?;

Map<String, dynamic> _$CanalVendaEmpresaToJson(CanalVendaEmpresa instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'empresa': instance.empresa,
      'idCanalVenda': instance.idCanalVenda,
      'canalVenda': instance.canalVenda,
      'ativo': instance.ativo,
    };

GradeEmpresaPreco _$GradeEmpresaPrecoFromJson(Map<String, dynamic> json) =>
    GradeEmpresaPreco()
      ..id = json['id'] as int?
      ..idGradeEmpresa = json['idGradeEmpresa'] as int?
      ..gradeEmpresa = json['gradeEmpresa'] == null
          ? null
          : GradeEmpresa.fromJson(json['gradeEmpresa'] as Map<String, dynamic>)
      ..idTabelaPreco = json['idTabelaPreco'] as int?
      ..tabelaPreco = json['tabelaPreco'] == null
          ? null
          : TabelaPreco.fromJson(json['tabelaPreco'] as Map<String, dynamic>)
      ..precoVenda = json['precoVenda'] == null
          ? null
          : BigDecimal.fromJson(json['precoVenda'])
      ..margemLucro = json['margemLucro'] == null
          ? null
          : BigDecimal.fromJson(json['margemLucro'])
      ..ativo = json['ativo'] as bool?;

Map<String, dynamic> _$GradeEmpresaPrecoToJson(GradeEmpresaPreco instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idGradeEmpresa': instance.idGradeEmpresa,
      'gradeEmpresa': instance.gradeEmpresa,
      'idTabelaPreco': instance.idTabelaPreco,
      'tabelaPreco': instance.tabelaPreco,
      'precoVenda': instance.precoVenda,
      'margemLucro': instance.margemLucro,
      'ativo': instance.ativo,
    };

ProdutoMenuComponenteEmpresaPreco _$ProdutoMenuComponenteEmpresaPrecoFromJson(
        Map<String, dynamic> json) =>
    ProdutoMenuComponenteEmpresaPreco()
      ..id = json['id'] as int?
      ..idProdutoMenuComponenteEmpresa =
          json['idProdutoMenuComponenteEmpresa'] as int?
      ..idTabelaPreco = json['idTabelaPreco'] as int?
      ..tabelaPreco = json['tabelaPreco'] == null
          ? null
          : TabelaPreco.fromJson(json['tabelaPreco'] as Map<String, dynamic>)
      ..valorComponente = json['valorComponente'] == null
          ? null
          : BigDecimal.fromJson(json['valorComponente']);

Map<String, dynamic> _$ProdutoMenuComponenteEmpresaPrecoToJson(
        ProdutoMenuComponenteEmpresaPreco instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idProdutoMenuComponenteEmpresa': instance.idProdutoMenuComponenteEmpresa,
      'idTabelaPreco': instance.idTabelaPreco,
      'tabelaPreco': instance.tabelaPreco,
      'valorComponente': instance.valorComponente,
    };

TotalRecebimentoParcialDTO _$TotalRecebimentoParcialDTOFromJson(
        Map<String, dynamic> json) =>
    TotalRecebimentoParcialDTO()
      ..modulo = json['modulo'] as String?
      ..valor =
          json['valor'] == null ? null : BigDecimal.fromJson(json['valor']);

Map<String, dynamic> _$TotalRecebimentoParcialDTOToJson(
        TotalRecebimentoParcialDTO instance) =>
    <String, dynamic>{
      'modulo': instance.modulo,
      'valor': instance.valor,
    };

ProdutoArquivo _$ProdutoArquivoFromJson(Map<String, dynamic> json) =>
    ProdutoArquivo()
      ..id = json['id'] as int?
      ..produto = json['produto'] == null
          ? null
          : Produto.fromJson(json['produto'] as Map<String, dynamic>)
      ..tipo = json['tipo'] as String?
      ..formato = json['formato'] as String?
      ..descricao = json['descricao'] as String?
      ..principal = json['principal'] as bool?
      ..link = json['link'] as String?;

Map<String, dynamic> _$ProdutoArquivoToJson(ProdutoArquivo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'produto': instance.produto,
      'tipo': instance.tipo,
      'formato': instance.formato,
      'descricao': instance.descricao,
      'principal': instance.principal,
      'link': instance.link,
    };

BibliotecaIcone _$BibliotecaIconeFromJson(Map<String, dynamic> json) =>
    BibliotecaIcone()
      ..id = json['id'] as int?
      ..nome = json['nome'] as String?
      ..urlPng = json['urlPng'] as String?
      ..pathSvg = json['pathSvg'] as String?
      ..alturaSvg = json['alturaSvg'] as int?
      ..larguraSvg = json['larguraSvg'] as int?;

Map<String, dynamic> _$BibliotecaIconeToJson(BibliotecaIcone instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'urlPng': instance.urlPng,
      'pathSvg': instance.pathSvg,
      'alturaSvg': instance.alturaSvg,
      'larguraSvg': instance.larguraSvg,
    };

PrinterNFCeDTO _$PrinterNFCeDTOFromJson(Map<String, dynamic> json) =>
    PrinterNFCeDTO()
      ..xml = json['xml'] as String?
      ..senha = json['senha'] as String?
      ..mensagemRodape = json['mensagemRodape'] as String?
      ..equipamentoImpressao = json['equipamentoImpressao'] == null
          ? null
          : EquipamentoImpressao.fromJson(
              json['equipamentoImpressao'] as Map<String, dynamic>)
      ..cancelamento = json['cancelamento'] as bool?;

Map<String, dynamic> _$PrinterNFCeDTOToJson(PrinterNFCeDTO instance) =>
    <String, dynamic>{
      'xml': instance.xml,
      'senha': instance.senha,
      'mensagemRodape': instance.mensagemRodape,
      'equipamentoImpressao': instance.equipamentoImpressao,
      'cancelamento': instance.cancelamento,
    };

PrinterVendaDTO _$PrinterVendaDTOFromJson(Map<String, dynamic> json) =>
    PrinterVendaDTO()
      ..dtoNota = json['dtoNota'] == null
          ? null
          : DtoNota.fromJson(json['dtoNota'] as Map<String, dynamic>)
      ..senha = json['senha'] as String?
      ..mensagemRodape = json['mensagemRodape'] as String?
      ..equipamentoImpressao = json['equipamentoImpressao'] == null
          ? null
          : EquipamentoImpressao.fromJson(
              json['equipamentoImpressao'] as Map<String, dynamic>)
      ..cancelamento = json['cancelamento'] as bool?
      ..servicoAutoAtendimento = json['servicoAutoAtendimento'] == null
          ? null
          : ServicoAutoAtendimento.fromJson(
              json['servicoAutoAtendimento'] as Map<String, dynamic>);

Map<String, dynamic> _$PrinterVendaDTOToJson(PrinterVendaDTO instance) =>
    <String, dynamic>{
      'dtoNota': instance.dtoNota,
      'senha': instance.senha,
      'mensagemRodape': instance.mensagemRodape,
      'equipamentoImpressao': instance.equipamentoImpressao,
      'cancelamento': instance.cancelamento,
      'servicoAutoAtendimento': instance.servicoAutoAtendimento,
    };

ConfigPropertiesDTO _$ConfigPropertiesDTOFromJson(Map<String, dynamic> json) =>
    ConfigPropertiesDTO()
      ..cnpj = json['cnpj'] as String?
      ..clientSecret = json['clientSecret'] as String?
      ..host = json['host'] as String?;

Map<String, dynamic> _$ConfigPropertiesDTOToJson(
        ConfigPropertiesDTO instance) =>
    <String, dynamic>{
      'cnpj': instance.cnpj,
      'clientSecret': instance.clientSecret,
      'host': instance.host,
    };

ConferenciaCaixaDTO _$ConferenciaCaixaDTOFromJson(Map<String, dynamic> json) =>
    ConferenciaCaixaDTO()
      ..turnoSimplificadoDTO = json['turnoSimplificadoDTO'] == null
          ? null
          : TurnoSimplificadoDTO.fromJson(
              json['turnoSimplificadoDTO'] as Map<String, dynamic>)
      ..extratoTurnoDTO = json['extratoTurnoDTO'] == null
          ? null
          : ExtratoTurnoDTO.fromJson(
              json['extratoTurnoDTO'] as Map<String, dynamic>)
      ..vendas = (json['vendas'] as List<dynamic>?)
              ?.map((e) =>
                  NotaSimplificadaDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..vendasCanceladas = (json['vendasCanceladas'] as List<dynamic>?)
              ?.map((e) =>
                  NotaSimplificadaDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..taxaServicoGracomDTOList =
          (json['taxaServicoGracomDTOList'] as List<dynamic>?)
                  ?.map((e) =>
                      TaxaServicoGracomDTO.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              []
      ..desdobramentoVendaDTO = json['desdobramentoVendaDTO'] == null
          ? null
          : DesdobramentoVendaDTO.fromJson(
              json['desdobramentoVendaDTO'] as Map<String, dynamic>)
      ..vendasModuloDTOList = (json['vendasModuloDTOList'] as List<dynamic>?)
              ?.map((e) => VendasModuloDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..desdobramentoGrupoProdutosDTOList =
          (json['desdobramentoGrupoProdutosDTOList'] as List<dynamic>?)
                  ?.map((e) => DesdobramentoGrupoProdutosDTO.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              []
      ..pacotesVendidos = (json['pacotesVendidos'] as List<dynamic>?)
              ?.map((e) =>
                  DesdobramentoProdutoDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..totalRecebimentoParcial =
          (json['totalRecebimentoParcial'] as List<dynamic>?)
                  ?.map((e) => TotalRecebimentoParcialDTO.fromJson(
                      e as Map<String, dynamic>))
                  .toList() ??
              []
      ..saldo =
          json['saldo'] == null ? null : BigDecimal.fromJson(json['saldo'])
      ..pendenciaEmissaoFiscal = json['pendenciaEmissaoFiscal'] as int?;

Map<String, dynamic> _$ConferenciaCaixaDTOToJson(
        ConferenciaCaixaDTO instance) =>
    <String, dynamic>{
      'turnoSimplificadoDTO': instance.turnoSimplificadoDTO,
      'extratoTurnoDTO': instance.extratoTurnoDTO,
      'vendas': instance.vendas,
      'vendasCanceladas': instance.vendasCanceladas,
      'taxaServicoGracomDTOList': instance.taxaServicoGracomDTOList,
      'desdobramentoVendaDTO': instance.desdobramentoVendaDTO,
      'vendasModuloDTOList': instance.vendasModuloDTOList,
      'desdobramentoGrupoProdutosDTOList':
          instance.desdobramentoGrupoProdutosDTOList,
      'pacotesVendidos': instance.pacotesVendidos,
      'totalRecebimentoParcial': instance.totalRecebimentoParcial,
      'saldo': instance.saldo,
      'pendenciaEmissaoFiscal': instance.pendenciaEmissaoFiscal,
    };

TurnoSimplificadoDTO _$TurnoSimplificadoDTOFromJson(
        Map<String, dynamic> json) =>
    TurnoSimplificadoDTO()
      ..idTurno = json['idTurno'] as int?
      ..idUsuario = json['idUsuario'] as int?
      ..loja = json['loja'] as int?
      ..dataAbertura = json['dataAbertura'] == null
          ? null
          : DateTime.parse(json['dataAbertura'] as String)
      ..dataEncerramento = json['dataEncerramento'] == null
          ? null
          : DateTime.parse(json['dataEncerramento'] as String)
      ..sequenciaTurno = json['sequenciaTurno'] as int?
      ..operador = json['operador'] as String?
      ..observacao = json['observacao'] as String?;

Map<String, dynamic> _$TurnoSimplificadoDTOToJson(
        TurnoSimplificadoDTO instance) =>
    <String, dynamic>{
      'idTurno': instance.idTurno,
      'idUsuario': instance.idUsuario,
      'loja': instance.loja,
      'dataAbertura': instance.dataAbertura?.toIso8601String(),
      'dataEncerramento': instance.dataEncerramento?.toIso8601String(),
      'sequenciaTurno': instance.sequenciaTurno,
      'operador': instance.operador,
      'observacao': instance.observacao,
    };

TotalFinalizadoraDTO _$TotalFinalizadoraDTOFromJson(
        Map<String, dynamic> json) =>
    TotalFinalizadoraDTO()
      ..idFinalizadora = json['idFinalizadora'] as int?
      ..codigo = json['codigo'] as int?
      ..descricao = json['descricao'] as String?
      ..total =
          json['total'] == null ? null : BigDecimal.fromJson(json['total']);

Map<String, dynamic> _$TotalFinalizadoraDTOToJson(
        TotalFinalizadoraDTO instance) =>
    <String, dynamic>{
      'idFinalizadora': instance.idFinalizadora,
      'codigo': instance.codigo,
      'descricao': instance.descricao,
      'total': instance.total,
    };

OperacaoDTO _$OperacaoDTOFromJson(Map<String, dynamic> json) => OperacaoDTO()
  ..tipoOperacao = json['tipoOperacao'] as String?
  ..data = json['data'] == null ? null : DateTime.parse(json['data'] as String)
  ..valor = json['valor'] == null ? null : BigDecimal.fromJson(json['valor'])
  ..favorecido = json['favorecido'] as String?
  ..historico = json['historico'] as String?
  ..idFinalizadora = json['idFinalizadora'] as int?
  ..codigo = json['codigo'] as int?
  ..descricaoFinalizadora = json['descricaoFinalizadora'] as String?;

Map<String, dynamic> _$OperacaoDTOToJson(OperacaoDTO instance) =>
    <String, dynamic>{
      'tipoOperacao': instance.tipoOperacao,
      'data': instance.data?.toIso8601String(),
      'valor': instance.valor,
      'favorecido': instance.favorecido,
      'historico': instance.historico,
      'idFinalizadora': instance.idFinalizadora,
      'codigo': instance.codigo,
      'descricaoFinalizadora': instance.descricaoFinalizadora,
    };

ExtratoTurnoDTO _$ExtratoTurnoDTOFromJson(Map<String, dynamic> json) =>
    ExtratoTurnoDTO()
      ..vendasPorFormaDePagamento =
          (json['vendasPorFormaDePagamento'] as List<dynamic>?)
                  ?.map((e) =>
                      TotalFinalizadoraDTO.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              []
      ..suprimentos = (json['suprimentos'] as List<dynamic>?)
              ?.map((e) => OperacaoDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..sangrias = (json['sangrias'] as List<dynamic>?)
              ?.map((e) => OperacaoDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..recebimentos = (json['recebimentos'] as List<dynamic>?)
              ?.map((e) => OperacaoDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..fechamentos = (json['fechamentos'] as List<dynamic>?)
              ?.map(
                  (e) => TurnoFechamentoDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

Map<String, dynamic> _$ExtratoTurnoDTOToJson(ExtratoTurnoDTO instance) =>
    <String, dynamic>{
      'vendasPorFormaDePagamento': instance.vendasPorFormaDePagamento,
      'suprimentos': instance.suprimentos,
      'sangrias': instance.sangrias,
      'recebimentos': instance.recebimentos,
      'fechamentos': instance.fechamentos,
    };

NotaSimplificadaDTO _$NotaSimplificadaDTOFromJson(Map<String, dynamic> json) =>
    NotaSimplificadaDTO()
      ..idNota = json['idNota'] as int?
      ..statusVenda = json['statusVenda'] as String?
      ..valorVenda = json['valorVenda'] == null
          ? null
          : BigDecimal.fromJson(json['valorVenda'])
      ..numeroVenda = json['numeroVenda'] as int?
      ..data =
          json['data'] == null ? null : DateTime.parse(json['data'] as String);

Map<String, dynamic> _$NotaSimplificadaDTOToJson(
        NotaSimplificadaDTO instance) =>
    <String, dynamic>{
      'idNota': instance.idNota,
      'statusVenda': instance.statusVenda,
      'valorVenda': instance.valorVenda,
      'numeroVenda': instance.numeroVenda,
      'data': instance.data?.toIso8601String(),
    };

TaxaServicoGracomDTO _$TaxaServicoGracomDTOFromJson(
        Map<String, dynamic> json) =>
    TaxaServicoGracomDTO()
      ..codigo = json['codigo'] as int?
      ..nome = json['nome'] as String?
      ..valorBaseCalculo = json['valorBaseCalculo'] == null
          ? null
          : BigDecimal.fromJson(json['valorBaseCalculo'])
      ..taxaServico = json['taxaServico'] == null
          ? null
          : BigDecimal.fromJson(json['taxaServico']);

Map<String, dynamic> _$TaxaServicoGracomDTOToJson(
        TaxaServicoGracomDTO instance) =>
    <String, dynamic>{
      'codigo': instance.codigo,
      'nome': instance.nome,
      'valorBaseCalculo': instance.valorBaseCalculo,
      'taxaServico': instance.taxaServico,
    };

DesdobramentoVendaDTO _$DesdobramentoVendaDTOFromJson(
        Map<String, dynamic> json) =>
    DesdobramentoVendaDTO()
      ..vendaBruta = json['vendaBruta'] == null
          ? null
          : BigDecimal.fromJson(json['vendaBruta'])
      ..acrescimo = json['acrescimo'] == null
          ? null
          : BigDecimal.fromJson(json['acrescimo'])
      ..taxaServico = json['taxaServico'] == null
          ? null
          : BigDecimal.fromJson(json['taxaServico'])
      ..taxaEntrega = json['taxaEntrega'] == null
          ? null
          : BigDecimal.fromJson(json['taxaEntrega'])
      ..desconto = json['desconto'] == null
          ? null
          : BigDecimal.fromJson(json['desconto'])
      ..promocao = json['promocao'] == null
          ? null
          : BigDecimal.fromJson(json['promocao'])
      ..isencaoTaxaServico = json['isencaoTaxaServico'] == null
          ? null
          : BigDecimal.fromJson(json['isencaoTaxaServico'])
      ..isencaoTaxaEntrega = json['isencaoTaxaEntrega'] == null
          ? null
          : BigDecimal.fromJson(json['isencaoTaxaEntrega']);

Map<String, dynamic> _$DesdobramentoVendaDTOToJson(
        DesdobramentoVendaDTO instance) =>
    <String, dynamic>{
      'vendaBruta': instance.vendaBruta,
      'acrescimo': instance.acrescimo,
      'taxaServico': instance.taxaServico,
      'taxaEntrega': instance.taxaEntrega,
      'desconto': instance.desconto,
      'promocao': instance.promocao,
      'isencaoTaxaServico': instance.isencaoTaxaServico,
      'isencaoTaxaEntrega': instance.isencaoTaxaEntrega,
    };

VendasModuloDTO _$VendasModuloDTOFromJson(Map<String, dynamic> json) =>
    VendasModuloDTO()
      ..tipoModulo = json['tipoModulo'] as String?
      ..vendasProdutos = json['vendasProdutos'] == null
          ? null
          : BigDecimal.fromJson(json['vendasProdutos'])
      ..valorServico = json['valorServico'] == null
          ? null
          : BigDecimal.fromJson(json['valorServico']);

Map<String, dynamic> _$VendasModuloDTOToJson(VendasModuloDTO instance) =>
    <String, dynamic>{
      'tipoModulo': instance.tipoModulo,
      'vendasProdutos': instance.vendasProdutos,
      'valorServico': instance.valorServico,
    };

DesdobramentoProdutoDTO _$DesdobramentoProdutoDTOFromJson(
        Map<String, dynamic> json) =>
    DesdobramentoProdutoDTO()
      ..descricao = json['descricao'] as String?
      ..quantidadeVendida = json['quantidadeVendida'] == null
          ? null
          : BigDecimal.fromJson(json['quantidadeVendida'])
      ..valorVendido = json['valorVendido'] == null
          ? null
          : BigDecimal.fromJson(json['valorVendido'])
      ..tipoItem = json['tipoItem'] as String?
      ..idGrupo = json['idGrupo'] as int?;

Map<String, dynamic> _$DesdobramentoProdutoDTOToJson(
        DesdobramentoProdutoDTO instance) =>
    <String, dynamic>{
      'descricao': instance.descricao,
      'quantidadeVendida': instance.quantidadeVendida,
      'valorVendido': instance.valorVendido,
      'tipoItem': instance.tipoItem,
      'idGrupo': instance.idGrupo,
    };

DesdobramentoGrupoProdutosDTO _$DesdobramentoGrupoProdutosDTOFromJson(
        Map<String, dynamic> json) =>
    DesdobramentoGrupoProdutosDTO()
      ..descricaoGrupo = json['descricaoGrupo'] as String?
      ..quantidadeVendida = json['quantidadeVendida'] == null
          ? null
          : BigDecimal.fromJson(json['quantidadeVendida'])
      ..valorVendido = json['valorVendido'] == null
          ? null
          : BigDecimal.fromJson(json['valorVendido'])
      ..ticketMedio = json['ticketMedio'] == null
          ? null
          : BigDecimal.fromJson(json['ticketMedio'])
      ..desdobramentoProdutoDTOList = (json['desdobramentoProdutoDTOList']
                  as List<dynamic>?)
              ?.map((e) =>
                  DesdobramentoProdutoDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

Map<String, dynamic> _$DesdobramentoGrupoProdutosDTOToJson(
        DesdobramentoGrupoProdutosDTO instance) =>
    <String, dynamic>{
      'descricaoGrupo': instance.descricaoGrupo,
      'quantidadeVendida': instance.quantidadeVendida,
      'valorVendido': instance.valorVendido,
      'ticketMedio': instance.ticketMedio,
      'desdobramentoProdutoDTOList': instance.desdobramentoProdutoDTOList,
    };

TurnoFechamentoDTO _$TurnoFechamentoDTOFromJson(Map<String, dynamic> json) =>
    TurnoFechamentoDTO()
      ..finalizadora = json['finalizadora'] as String?
      ..valorApurado = json['valorApurado'] == null
          ? null
          : BigDecimal.fromJson(json['valorApurado'])
      ..valorDigitado = json['valorDigitado'] == null
          ? null
          : BigDecimal.fromJson(json['valorDigitado'])
      ..idFinalizadoraEmpresa = json['idFinalizadoraEmpresa'] as int?;

Map<String, dynamic> _$TurnoFechamentoDTOToJson(TurnoFechamentoDTO instance) =>
    <String, dynamic>{
      'finalizadora': instance.finalizadora,
      'valorApurado': instance.valorApurado,
      'valorDigitado': instance.valorDigitado,
      'idFinalizadoraEmpresa': instance.idFinalizadoraEmpresa,
    };

ContingenciaFiscal _$ContingenciaFiscalFromJson(Map<String, dynamic> json) =>
    ContingenciaFiscal()
      ..id = json['id'] as int?
      ..idEmpresa = json['idEmpresa'] as int?
      ..dataInicio = json['dataInicio'] == null
          ? null
          : DateTime.parse(json['dataInicio'] as String)
      ..dataFim = json['dataFim'] == null
          ? null
          : DateTime.parse(json['dataFim'] as String)
      ..motivo = json['motivo'] as String?
      ..notasPendentesEnvio = json['notasPendentesEnvio'] as int?;

Map<String, dynamic> _$ContingenciaFiscalToJson(ContingenciaFiscal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'dataInicio': instance.dataInicio?.toIso8601String(),
      'dataFim': instance.dataFim?.toIso8601String(),
      'motivo': instance.motivo,
      'notasPendentesEnvio': instance.notasPendentesEnvio,
    };

RegiaoEmpresa _$RegiaoEmpresaFromJson(Map<String, dynamic> json) =>
    RegiaoEmpresa()
      ..id = json['id'] as int?
      ..idEmpresa = json['idEmpresa'] as int?
      ..valor =
          json['valor'] == null ? null : BigDecimal.fromJson(json['valor'])
      ..tipoValor = json['tipoValor'] as String?
      ..itinerario = json['itinerario'] as int?
      ..prazoEntregaDias = json['prazoEntregaDias'] as int?
      ..idRegiao = json['idRegiao'] as int?;

Map<String, dynamic> _$RegiaoEmpresaToJson(RegiaoEmpresa instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'valor': instance.valor,
      'tipoValor': instance.tipoValor,
      'itinerario': instance.itinerario,
      'prazoEntregaDias': instance.prazoEntregaDias,
      'idRegiao': instance.idRegiao,
    };

ClienteSimplificadoDTO _$ClienteSimplificadoDTOFromJson(
        Map<String, dynamic> json) =>
    ClienteSimplificadoDTO()
      ..id = json['id'] as int?
      ..apelido = json['apelido'] as String?
      ..endereco = json['endereco'] as String?
      ..telefone = json['telefone'] as String?;

Map<String, dynamic> _$ClienteSimplificadoDTOToJson(
        ClienteSimplificadoDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'apelido': instance.apelido,
      'endereco': instance.endereco,
      'telefone': instance.telefone,
    };

NotaXml _$NotaXmlFromJson(Map<String, dynamic> json) => NotaXml()
  ..id = json['id'] as int?
  ..xmlEmissao = json['xmlEmissao'] as String?
  ..xmlEnvio = json['xmlEnvio'] as String?
  ..xmlCancelamento = json['xmlCancelamento'] as String?
  ..xmlInutilizacao = json['xmlInutilizacao'] as String?;

Map<String, dynamic> _$NotaXmlToJson(NotaXml instance) => <String, dynamic>{
      'id': instance.id,
      'xmlEmissao': instance.xmlEmissao,
      'xmlEnvio': instance.xmlEnvio,
      'xmlCancelamento': instance.xmlCancelamento,
      'xmlInutilizacao': instance.xmlInutilizacao,
    };

HistoricoPedidoDTO _$HistoricoPedidoDTOFromJson(Map<String, dynamic> json) =>
    HistoricoPedidoDTO()
      ..totalPedidos = json['totalPedidos'] as int?
      ..ticketMedio = json['ticketMedio'] == null
          ? null
          : BigDecimal.fromJson(json['ticketMedio'])
      ..dataUltimoPedido = json['dataUltimoPedido'] == null
          ? null
          : DateTime.parse(json['dataUltimoPedido'] as String)
      ..tempoMedioExpedicao = json['tempoMedioExpedicao'] as String?
      ..pedidoDTOList = (json['pedidoDTOList'] as List<dynamic>?)
              ?.map((e) => PedidoDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

Map<String, dynamic> _$HistoricoPedidoDTOToJson(HistoricoPedidoDTO instance) =>
    <String, dynamic>{
      'totalPedidos': instance.totalPedidos,
      'ticketMedio': instance.ticketMedio,
      'dataUltimoPedido': instance.dataUltimoPedido?.toIso8601String(),
      'tempoMedioExpedicao': instance.tempoMedioExpedicao,
      'pedidoDTOList': instance.pedidoDTOList,
    };

PedidoDTO _$PedidoDTOFromJson(Map<String, dynamic> json) => PedidoDTO()
  ..idNota = json['idNota'] as int?
  ..data = json['data'] == null ? null : DateTime.parse(json['data'] as String)
  ..numeroPedido = json['numeroPedido'] as int?
  ..total = json['total'] == null ? null : BigDecimal.fromJson(json['total'])
  ..origem = json['origem'] as String?
  ..pedidoItemDTOList = (json['pedidoItemDTOList'] as List<dynamic>?)
          ?.map((e) => PedidoItemDTO.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [];

Map<String, dynamic> _$PedidoDTOToJson(PedidoDTO instance) => <String, dynamic>{
      'idNota': instance.idNota,
      'data': instance.data?.toIso8601String(),
      'numeroPedido': instance.numeroPedido,
      'total': instance.total,
      'origem': instance.origem,
      'pedidoItemDTOList': instance.pedidoItemDTOList,
    };

PedidoItemDTO _$PedidoItemDTOFromJson(Map<String, dynamic> json) =>
    PedidoItemDTO()
      ..idNotaItem = json['idNotaItem'] as int?
      ..idNotaItemPai = json['idNotaItemPai'] as int?
      ..tipoItem = json['tipoItem'] as String?
      ..descricao = json['descricao'] as String?
      ..quantidade = json['quantidade'] == null
          ? null
          : BigDecimal.fromJson(json['quantidade'])
      ..total =
          json['total'] == null ? null : BigDecimal.fromJson(json['total'])
      ..subitens = (json['subitens'] as List<dynamic>?)
              ?.map((e) => PedidoItemDTO.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

Map<String, dynamic> _$PedidoItemDTOToJson(PedidoItemDTO instance) =>
    <String, dynamic>{
      'idNotaItem': instance.idNotaItem,
      'idNotaItemPai': instance.idNotaItemPai,
      'tipoItem': instance.tipoItem,
      'descricao': instance.descricao,
      'quantidade': instance.quantidade,
      'total': instance.total,
      'subitens': instance.subitens,
    };

EmpresaIntegrador _$EmpresaIntegradorFromJson(Map<String, dynamic> json) =>
    EmpresaIntegrador()
      ..telefone = json['telefone'] as String?
      ..telefoneWhatsApp = json['telefoneWhatsApp'] as String?
      ..email = json['email'] as String?
      ..redeFiliation = json['redeFiliation'] as String?
      ..redeToken = json['redeToken'] as String?;

Map<String, dynamic> _$EmpresaIntegradorToJson(EmpresaIntegrador instance) =>
    <String, dynamic>{
      'telefone': instance.telefone,
      'telefoneWhatsApp': instance.telefoneWhatsApp,
      'email': instance.email,
      'redeFiliation': instance.redeFiliation,
      'redeToken': instance.redeToken,
    };

ClienteExtratoDTO _$ClienteExtratoDTOFromJson(Map<String, dynamic> json) =>
    ClienteExtratoDTO()
      ..cliente = json['cliente'] == null
          ? null
          : Cliente.fromJson(json['cliente'] as Map<String, dynamic>)
      ..limite =
          json['limite'] == null ? null : BigDecimal.fromJson(json['limite'])
      ..titulosAbertos = json['titulosAbertos'] == null
          ? null
          : BigDecimal.fromJson(json['titulosAbertos'])
      ..saldoFaturar = json['saldoFaturar'] == null
          ? null
          : BigDecimal.fromJson(json['saldoFaturar'])
      ..limiteDisponivel = json['limiteDisponivel'] == null
          ? null
          : BigDecimal.fromJson(json['limiteDisponivel'])
      ..contas = (json['contas'] as List<dynamic>?)
              ?.map((e) => ClienteConta.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

Map<String, dynamic> _$ClienteExtratoDTOToJson(ClienteExtratoDTO instance) =>
    <String, dynamic>{
      'cliente': instance.cliente,
      'limite': instance.limite,
      'titulosAbertos': instance.titulosAbertos,
      'saldoFaturar': instance.saldoFaturar,
      'limiteDisponivel': instance.limiteDisponivel,
      'contas': instance.contas,
    };

ClienteConta _$ClienteContaFromJson(Map<String, dynamic> json) => ClienteConta()
  ..id = json['id'] as int?
  ..idCliente = json['idCliente'] as int?
  ..cliente = json['cliente'] == null
      ? null
      : Cliente.fromJson(json['cliente'] as Map<String, dynamic>)
  ..idAutorizado = json['idAutorizado'] as int?
  ..autorizado = json['autorizado'] == null
      ? null
      : ClienteAutorizado.fromJson(json['autorizado'] as Map<String, dynamic>)
  ..dataLancamento = json['dataLancamento'] == null
      ? null
      : DateTime.parse(json['dataLancamento'] as String)
  ..tipoOperacao = json['tipoOperacao'] as String?
  ..valor = json['valor'] == null ? null : BigDecimal.fromJson(json['valor'])
  ..saldo = json['saldo'] == null ? null : BigDecimal.fromJson(json['saldo'])
  ..confirmado = json['confirmado'] as bool?
  ..idNota = json['idNota'] as int?
  ..nota = json['nota'] == null
      ? null
      : Nota.fromJson(json['nota'] as Map<String, dynamic>)
  ..idOperacaoCaixa = json['idOperacaoCaixa'] as int?
  ..operacaoCaixa = json['operacaoCaixa'] == null
      ? null
      : Operacao.fromJson(json['operacaoCaixa'] as Map<String, dynamic>)
  ..idTurno = json['idTurno'] as int?
  ..turno = json['turno'] == null
      ? null
      : Turno.fromJson(json['turno'] as Map<String, dynamic>)
  ..idClienteFatura = json['idClienteFatura'] as int?
  ..clienteFatura = json['clienteFatura'] == null
      ? null
      : ClienteFatura.fromJson(json['clienteFatura'] as Map<String, dynamic>)
  ..observacao = json['observacao'] as String?
  ..clienteContaConcentrador = json['clienteContaConcentrador'] == null
      ? null
      : ClienteContaConcentrador.fromJson(
          json['clienteContaConcentrador'] as Map<String, dynamic>);

Map<String, dynamic> _$ClienteContaToJson(ClienteConta instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idCliente': instance.idCliente,
      'cliente': instance.cliente,
      'idAutorizado': instance.idAutorizado,
      'autorizado': instance.autorizado,
      'dataLancamento': instance.dataLancamento?.toIso8601String(),
      'tipoOperacao': instance.tipoOperacao,
      'valor': instance.valor,
      'saldo': instance.saldo,
      'confirmado': instance.confirmado,
      'idNota': instance.idNota,
      'nota': instance.nota,
      'idOperacaoCaixa': instance.idOperacaoCaixa,
      'operacaoCaixa': instance.operacaoCaixa,
      'idTurno': instance.idTurno,
      'turno': instance.turno,
      'idClienteFatura': instance.idClienteFatura,
      'clienteFatura': instance.clienteFatura,
      'observacao': instance.observacao,
      'clienteContaConcentrador': instance.clienteContaConcentrador,
    };

ClienteFatura _$ClienteFaturaFromJson(Map<String, dynamic> json) =>
    ClienteFatura()
      ..id = json['id'] as int?
      ..dataEmissao = json['dataEmissao'] == null
          ? null
          : DateTime.parse(json['dataEmissao'] as String)
      ..idCliente = json['idCliente'] as int?
      ..cliente = json['cliente'] == null
          ? null
          : Cliente.fromJson(json['cliente'] as Map<String, dynamic>)
      ..valor =
          json['valor'] == null ? null : BigDecimal.fromJson(json['valor'])
      ..idNota = json['idNota'] as int?
      ..nota = json['nota'] == null
          ? null
          : Nota.fromJson(json['nota'] as Map<String, dynamic>)
      ..numeroFatura = json['numeroFatura'] as int?
      ..observacao = json['observacao'] as String?
      ..dataCancelamento = json['dataCancelamento'] == null
          ? null
          : DateTime.parse(json['dataCancelamento'] as String)
      ..contas = (json['contas'] as List<dynamic>?)
              ?.map((e) => Conta.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..clienteContas = (json['clienteContas'] as List<dynamic>?)
              ?.map((e) => ClienteConta.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

Map<String, dynamic> _$ClienteFaturaToJson(ClienteFatura instance) =>
    <String, dynamic>{
      'id': instance.id,
      'dataEmissao': instance.dataEmissao?.toIso8601String(),
      'idCliente': instance.idCliente,
      'cliente': instance.cliente,
      'valor': instance.valor,
      'idNota': instance.idNota,
      'nota': instance.nota,
      'numeroFatura': instance.numeroFatura,
      'observacao': instance.observacao,
      'dataCancelamento': instance.dataCancelamento?.toIso8601String(),
      'contas': instance.contas,
      'clienteContas': instance.clienteContas,
    };

ClienteContaConcentrador _$ClienteContaConcentradorFromJson(
        Map<String, dynamic> json) =>
    ClienteContaConcentrador()
      ..id = json['id'] as int?
      ..clienteConta = json['clienteConta'] == null
          ? null
          : ClienteConta.fromJson(json['clienteConta'] as Map<String, dynamic>)
      ..sincronizado = json['sincronizado'] as bool?
      ..idClienteContaCentral = json['idClienteContaCentral'] as int?
      ..erro = json['erro'] as String?;

Map<String, dynamic> _$ClienteContaConcentradorToJson(
        ClienteContaConcentrador instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clienteConta': instance.clienteConta,
      'sincronizado': instance.sincronizado,
      'idClienteContaCentral': instance.idClienteContaCentral,
      'erro': instance.erro,
    };

Conta _$ContaFromJson(Map<String, dynamic> json) => Conta()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..empresa = json['empresa'] == null
      ? null
      : Empresa.fromJson(json['empresa'] as Map<String, dynamic>)
  ..idPessoa = json['idPessoa'] as int?
  ..pessoa = json['pessoa'] == null
      ? null
      : Pessoa.fromJson(json['pessoa'] as Map<String, dynamic>)
  ..descricao = json['descricao'] as String?
  ..observacao = json['observacao'] as String?
  ..codigo = json['codigo'] as String?
  ..numeroDocumento = json['numeroDocumento'] as String?
  ..dataLancamento = json['dataLancamento'] == null
      ? null
      : DateTime.parse(json['dataLancamento'] as String)
  ..dataEmissao = json['dataEmissao'] == null
      ? null
      : DateTime.parse(json['dataEmissao'] as String)
  ..dataCompetencia = json['dataCompetencia'] == null
      ? null
      : DateTime.parse(json['dataCompetencia'] as String)
  ..dataVencimento = json['dataVencimento'] == null
      ? null
      : DateTime.parse(json['dataVencimento'] as String)
  ..idBanco = json['idBanco'] as int?
  ..banco = json['banco'] == null
      ? null
      : Banco.fromJson(json['banco'] as Map<String, dynamic>)
  ..numeroParcelas = json['numeroParcelas'] as int?
  ..parcela = json['parcela'] as String?
  ..descontoAntecipacao = json['descontoAntecipacao'] == null
      ? null
      : BigDecimal.fromJson(json['descontoAntecipacao'])
  ..multaAtraso = json['multaAtraso'] == null
      ? null
      : BigDecimal.fromJson(json['multaAtraso'])
  ..jurosDiario = json['jurosDiario'] == null
      ? null
      : BigDecimal.fromJson(json['jurosDiario'])
  ..valor = json['valor'] == null ? null : BigDecimal.fromJson(json['valor'])
  ..desconto =
      json['desconto'] == null ? null : BigDecimal.fromJson(json['desconto'])
  ..jurosMulta = json['jurosMulta'] == null
      ? null
      : BigDecimal.fromJson(json['jurosMulta'])
  ..tipoConta = json['tipoConta'] as String?
  ..dataPagamento = json['dataPagamento'] == null
      ? null
      : DateTime.parse(json['dataPagamento'] as String)
  ..valorPago =
      json['valorPago'] == null ? null : BigDecimal.fromJson(json['valorPago'])
  ..idFinalizadora = json['idFinalizadora'] as int?
  ..finalizadora = json['finalizadora'] == null
      ? null
      : Finalizadora.fromJson(json['finalizadora'] as Map<String, dynamic>)
  ..idContaCorrente = json['idContaCorrente'] as int?
  ..contaCorrente = json['contaCorrente'] == null
      ? null
      : ContaCorrente.fromJson(json['contaCorrente'] as Map<String, dynamic>)
  ..idContaCorrenteCarteira = json['idContaCorrenteCarteira'] as int?
  ..contaCorrenteCarteira = json['contaCorrenteCarteira'] == null
      ? null
      : ContaCorrenteCarteira.fromJson(
          json['contaCorrenteCarteira'] as Map<String, dynamic>)
  ..nossoNumero = json['nossoNumero'] as int?
  ..idContaOrigem = json['idContaOrigem'] as int?
  ..contaOrigem = json['contaOrigem'] == null
      ? null
      : Conta.fromJson(json['contaOrigem'] as Map<String, dynamic>)
  ..pagamentosParciais = (json['pagamentosParciais'] as List<dynamic>?)
          ?.map((e) => Conta.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..transferencia = json['transferencia'] as bool?
  ..automatico = json['automatico'] as bool?
  ..pago = json['pago'] as bool?
  ..parcial = json['parcial'] as bool?
  ..cancelado = json['cancelado'] as bool?
  ..classificacoes = (json['classificacoes'] as List<dynamic>?)
          ?.map((e) => ContaClassificacao.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..centroCustos = (json['centroCustos'] as List<dynamic>?)
          ?.map((e) => ContaCentroCusto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      []
  ..idNota = json['idNota'] as int?
  ..idContaLote = json['idContaLote'] as int?
  ..contaLote = json['contaLote'] == null
      ? null
      : Contalote.fromJson(json['contaLote'] as Map<String, dynamic>)
  ..nota = json['nota'] == null
      ? null
      : Nota.fromJson(json['nota'] as Map<String, dynamic>)
  ..idClienteFatura = json['idClienteFatura'] as int?
  ..clienteFatura = json['clienteFatura'] == null
      ? null
      : ClienteFatura.fromJson(json['clienteFatura'] as Map<String, dynamic>)
  ..idLoteDesmembramento = json['idLoteDesmembramento'] as int?
  ..loteDesmembramento = json['loteDesmembramento'] == null
      ? null
      : LoteControleCartao.fromJson(
          json['loteDesmembramento'] as Map<String, dynamic>)
  ..idLoteQuitacao = json['idLoteQuitacao'] as int?
  ..loteQuitacao = json['loteQuitacao'] == null
      ? null
      : LoteControleCartao.fromJson(
          json['loteQuitacao'] as Map<String, dynamic>)
  ..idTransacaoCartao = json['idTransacaoCartao'] as int?
  ..transacaoCartao = json['transacaoCartao'] == null
      ? null
      : TransacaoCartao.fromJson(
          json['transacaoCartao'] as Map<String, dynamic>)
  ..idRemessaBancaria = json['idRemessaBancaria'] as int?
  ..remessaBancaria = json['remessaBancaria'] == null
      ? null
      : RemessaBancaria.fromJson(
          json['remessaBancaria'] as Map<String, dynamic>)
  ..idApuracaoRoyalty = json['idApuracaoRoyalty'] as int?
  ..apuracaoRoyalty = json['apuracaoRoyalty'] == null
      ? null
      : ApuracaoRoyalty.fromJson(
          json['apuracaoRoyalty'] as Map<String, dynamic>)
  ..idTurno = json['idTurno'] as int?
  ..turno = json['turno'] == null
      ? null
      : Turno.fromJson(json['turno'] as Map<String, dynamic>)
  ..idOperacaoOrigem = json['idOperacaoOrigem'] as int?
  ..operacaoOrigem = json['operacaoOrigem'] == null
      ? null
      : Operacao.fromJson(json['operacaoOrigem'] as Map<String, dynamic>)
  ..tipoApuracao = json['tipoApuracao'] as String?;

Map<String, dynamic> _$ContaToJson(Conta instance) => <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'empresa': instance.empresa,
      'idPessoa': instance.idPessoa,
      'pessoa': instance.pessoa,
      'descricao': instance.descricao,
      'observacao': instance.observacao,
      'codigo': instance.codigo,
      'numeroDocumento': instance.numeroDocumento,
      'dataLancamento': instance.dataLancamento?.toIso8601String(),
      'dataEmissao': instance.dataEmissao?.toIso8601String(),
      'dataCompetencia': instance.dataCompetencia?.toIso8601String(),
      'dataVencimento': instance.dataVencimento?.toIso8601String(),
      'idBanco': instance.idBanco,
      'banco': instance.banco,
      'numeroParcelas': instance.numeroParcelas,
      'parcela': instance.parcela,
      'descontoAntecipacao': instance.descontoAntecipacao,
      'multaAtraso': instance.multaAtraso,
      'jurosDiario': instance.jurosDiario,
      'valor': instance.valor,
      'desconto': instance.desconto,
      'jurosMulta': instance.jurosMulta,
      'tipoConta': instance.tipoConta,
      'dataPagamento': instance.dataPagamento?.toIso8601String(),
      'valorPago': instance.valorPago,
      'idFinalizadora': instance.idFinalizadora,
      'finalizadora': instance.finalizadora,
      'idContaCorrente': instance.idContaCorrente,
      'contaCorrente': instance.contaCorrente,
      'idContaCorrenteCarteira': instance.idContaCorrenteCarteira,
      'contaCorrenteCarteira': instance.contaCorrenteCarteira,
      'nossoNumero': instance.nossoNumero,
      'idContaOrigem': instance.idContaOrigem,
      'contaOrigem': instance.contaOrigem,
      'pagamentosParciais': instance.pagamentosParciais,
      'transferencia': instance.transferencia,
      'automatico': instance.automatico,
      'pago': instance.pago,
      'parcial': instance.parcial,
      'cancelado': instance.cancelado,
      'classificacoes': instance.classificacoes,
      'centroCustos': instance.centroCustos,
      'idNota': instance.idNota,
      'idContaLote': instance.idContaLote,
      'contaLote': instance.contaLote,
      'nota': instance.nota,
      'idClienteFatura': instance.idClienteFatura,
      'clienteFatura': instance.clienteFatura,
      'idLoteDesmembramento': instance.idLoteDesmembramento,
      'loteDesmembramento': instance.loteDesmembramento,
      'idLoteQuitacao': instance.idLoteQuitacao,
      'loteQuitacao': instance.loteQuitacao,
      'idTransacaoCartao': instance.idTransacaoCartao,
      'transacaoCartao': instance.transacaoCartao,
      'idRemessaBancaria': instance.idRemessaBancaria,
      'remessaBancaria': instance.remessaBancaria,
      'idApuracaoRoyalty': instance.idApuracaoRoyalty,
      'apuracaoRoyalty': instance.apuracaoRoyalty,
      'idTurno': instance.idTurno,
      'turno': instance.turno,
      'idOperacaoOrigem': instance.idOperacaoOrigem,
      'operacaoOrigem': instance.operacaoOrigem,
      'tipoApuracao': instance.tipoApuracao,
    };

ContaCorrenteCarteira _$ContaCorrenteCarteiraFromJson(
        Map<String, dynamic> json) =>
    ContaCorrenteCarteira()
      ..id = json['id'] as int?
      ..idEmpresa = json['idEmpresa'] as int?
      ..empresa = json['empresa'] == null
          ? null
          : Empresa.fromJson(json['empresa'] as Map<String, dynamic>)
      ..idContaCorrente = json['idContaCorrente'] as int?
      ..contaCorrente = json['contaCorrente'] == null
          ? null
          : ContaCorrente.fromJson(
              json['contaCorrente'] as Map<String, dynamic>)
      ..carteira = json['carteira'] as int?
      ..formaEmissaoBoleto = json['formaEmissaoBoleto'] as String?
      ..tipoCobranca = json['tipoCobranca'] as String?
      ..layoutArquivo = json['layoutArquivo'] as String?
      ..identifcadorCobranca = json['identifcadorCobranca'] as String?
      ..codigoConvenio = json['codigoConvenio'] as String?
      ..especieTitulo = json['especieTitulo'] as String?
      ..siglaTitulo = json['siglaTitulo'] as String?
      ..instrucaoCobranca1 = json['instrucaoCobranca1'] as String?
      ..instrucaoCobranca2 = json['instrucaoCobranca2'] as String?
      ..nossoNumero = json['nossoNumero'] as int?
      ..aceite = json['aceite'] as bool?
      ..prazoProtesto = json['prazoProtesto'] as int?
      ..prazoRecebimento = json['prazoRecebimento'] as int?
      ..valorTaxaEmissao = json['valorTaxaEmissao'] == null
          ? null
          : BigDecimal.fromJson(json['valorTaxaEmissao'])
      ..diasTolerancia = json['diasTolerancia'] as int?
      ..moraDiaria = json['moraDiaria'] == null
          ? null
          : BigDecimal.fromJson(json['moraDiaria'])
      ..multa =
          json['multa'] == null ? null : BigDecimal.fromJson(json['multa'])
      ..descontoAntecipacao = json['descontoAntecipacao'] == null
          ? null
          : BigDecimal.fromJson(json['descontoAntecipacao'])
      ..diasAntecipacao = json['diasAntecipacao'] as int?
      ..diasRepasse = json['diasRepasse'] as int?
      ..cobrancaRegistrada = json['cobrancaRegistrada'] as bool?
      ..gerarNossoNumero = json['gerarNossoNumero'] as bool?
      ..localPagamento = json['localPagamento'] as String?
      ..mensagemCorpoBoleto = json['mensagemCorpoBoleto'] as String?
      ..mensagemAdicional = json['mensagemAdicional'] as String?
      ..mensagemCorpoEmail = json['mensagemCorpoEmail'] as String?
      ..ativa = json['ativa'] as bool?;

Map<String, dynamic> _$ContaCorrenteCarteiraToJson(
        ContaCorrenteCarteira instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'empresa': instance.empresa,
      'idContaCorrente': instance.idContaCorrente,
      'contaCorrente': instance.contaCorrente,
      'carteira': instance.carteira,
      'formaEmissaoBoleto': instance.formaEmissaoBoleto,
      'tipoCobranca': instance.tipoCobranca,
      'layoutArquivo': instance.layoutArquivo,
      'identifcadorCobranca': instance.identifcadorCobranca,
      'codigoConvenio': instance.codigoConvenio,
      'especieTitulo': instance.especieTitulo,
      'siglaTitulo': instance.siglaTitulo,
      'instrucaoCobranca1': instance.instrucaoCobranca1,
      'instrucaoCobranca2': instance.instrucaoCobranca2,
      'nossoNumero': instance.nossoNumero,
      'aceite': instance.aceite,
      'prazoProtesto': instance.prazoProtesto,
      'prazoRecebimento': instance.prazoRecebimento,
      'valorTaxaEmissao': instance.valorTaxaEmissao,
      'diasTolerancia': instance.diasTolerancia,
      'moraDiaria': instance.moraDiaria,
      'multa': instance.multa,
      'descontoAntecipacao': instance.descontoAntecipacao,
      'diasAntecipacao': instance.diasAntecipacao,
      'diasRepasse': instance.diasRepasse,
      'cobrancaRegistrada': instance.cobrancaRegistrada,
      'gerarNossoNumero': instance.gerarNossoNumero,
      'localPagamento': instance.localPagamento,
      'mensagemCorpoBoleto': instance.mensagemCorpoBoleto,
      'mensagemAdicional': instance.mensagemAdicional,
      'mensagemCorpoEmail': instance.mensagemCorpoEmail,
      'ativa': instance.ativa,
    };

ContaClassificacao _$ContaClassificacaoFromJson(Map<String, dynamic> json) =>
    ContaClassificacao()
      ..id = json['id'] as int?
      ..idConta = json['idConta'] as int?
      ..conta = json['conta'] == null
          ? null
          : Conta.fromJson(json['conta'] as Map<String, dynamic>)
      ..idPlanoConta = json['idPlanoConta'] as int?
      ..planoConta = json['planoConta'] == null
          ? null
          : PlanoConta.fromJson(json['planoConta'] as Map<String, dynamic>)
      ..percentualRateio = json['percentualRateio'] == null
          ? null
          : BigDecimal.fromJson(json['percentualRateio'])
      ..valorRateio = json['valorRateio'] == null
          ? null
          : BigDecimal.fromJson(json['valorRateio']);

Map<String, dynamic> _$ContaClassificacaoToJson(ContaClassificacao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idConta': instance.idConta,
      'conta': instance.conta,
      'idPlanoConta': instance.idPlanoConta,
      'planoConta': instance.planoConta,
      'percentualRateio': instance.percentualRateio,
      'valorRateio': instance.valorRateio,
    };

ContaCentroCusto _$ContaCentroCustoFromJson(Map<String, dynamic> json) =>
    ContaCentroCusto()
      ..id = json['id'] as int?
      ..idConta = json['idConta'] as int?
      ..conta = json['conta'] == null
          ? null
          : Conta.fromJson(json['conta'] as Map<String, dynamic>)
      ..idCentroCusto = json['idCentroCusto'] as int?
      ..centroCusto = json['centroCusto'] == null
          ? null
          : CentroCusto.fromJson(json['centroCusto'] as Map<String, dynamic>)
      ..percentualRateio = json['percentualRateio'] == null
          ? null
          : BigDecimal.fromJson(json['percentualRateio'])
      ..valorRateio = json['valorRateio'] == null
          ? null
          : BigDecimal.fromJson(json['valorRateio']);

Map<String, dynamic> _$ContaCentroCustoToJson(ContaCentroCusto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idConta': instance.idConta,
      'conta': instance.conta,
      'idCentroCusto': instance.idCentroCusto,
      'centroCusto': instance.centroCusto,
      'percentualRateio': instance.percentualRateio,
      'valorRateio': instance.valorRateio,
    };

Contalote _$ContaloteFromJson(Map<String, dynamic> json) => Contalote()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..empresa = json['empresa'] == null
      ? null
      : Empresa.fromJson(json['empresa'] as Map<String, dynamic>)
  ..dataCriacao = json['dataCriacao'] == null
      ? null
      : DateTime.parse(json['dataCriacao'] as String)
  ..idPessoa = json['idPessoa'] as int?
  ..pessoa = json['pessoa'] == null
      ? null
      : Pessoa.fromJson(json['pessoa'] as Map<String, dynamic>)
  ..numeroParcelas = json['numeroParcelas'] as int?
  ..parcelas = (json['parcelas'] as List<dynamic>?)
          ?.map((e) => Conta.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [];

Map<String, dynamic> _$ContaloteToJson(Contalote instance) => <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'empresa': instance.empresa,
      'dataCriacao': instance.dataCriacao?.toIso8601String(),
      'idPessoa': instance.idPessoa,
      'pessoa': instance.pessoa,
      'numeroParcelas': instance.numeroParcelas,
      'parcelas': instance.parcelas,
    };

LoteControleCartao _$LoteControleCartaoFromJson(Map<String, dynamic> json) =>
    LoteControleCartao()
      ..id = json['id'] as int?
      ..idEmpresa = json['idEmpresa'] as int?
      ..empresa = json['empresa'] == null
          ? null
          : Empresa.fromJson(json['empresa'] as Map<String, dynamic>)
      ..data =
          json['data'] == null ? null : DateTime.parse(json['data'] as String)
      ..idUser = json['idUser'] as int?
      ..user = json['user'] == null
          ? null
          : Usuario.fromJson(json['user'] as Map<String, dynamic>)
      ..observacao = json['observacao'] as String?
      ..tipoLoteControleCartao = json['tipoLoteControleCartao'] as String?
      ..transacoes = (json['transacoes'] as List<dynamic>?)
              ?.map((e) => TransacaoCartao.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..titulosDesmembramento =
          (json['titulosDesmembramento'] as List<dynamic>?)
                  ?.map((e) => Conta.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              []
      ..titulosQuitacao = (json['titulosQuitacao'] as List<dynamic>?)
              ?.map((e) => Conta.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

Map<String, dynamic> _$LoteControleCartaoToJson(LoteControleCartao instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'empresa': instance.empresa,
      'data': instance.data?.toIso8601String(),
      'idUser': instance.idUser,
      'user': instance.user,
      'observacao': instance.observacao,
      'tipoLoteControleCartao': instance.tipoLoteControleCartao,
      'transacoes': instance.transacoes,
      'titulosDesmembramento': instance.titulosDesmembramento,
      'titulosQuitacao': instance.titulosQuitacao,
    };

RemessaBancaria _$RemessaBancariaFromJson(Map<String, dynamic> json) =>
    RemessaBancaria()
      ..id = json['id'] as int?
      ..idEmpresa = json['idEmpresa'] as int?
      ..empresa = json['empresa'] == null
          ? null
          : Empresa.fromJson(json['empresa'] as Map<String, dynamic>)
      ..idContaCorrente = json['idContaCorrente'] as int?
      ..contaCorrente = json['contaCorrente'] == null
          ? null
          : ContaCorrente.fromJson(
              json['contaCorrente'] as Map<String, dynamic>)
      ..idContaCorrenteCarteira = json['idContaCorrenteCarteira'] as int?
      ..contaCorrenteCarteira = json['contaCorrenteCarteira'] == null
          ? null
          : ContaCorrenteCarteira.fromJson(
              json['contaCorrenteCarteira'] as Map<String, dynamic>)
      ..sequencia = json['sequencia'] as int?
      ..tipoRemessa = json['tipoRemessa'] as String?
      ..data =
          json['data'] == null ? null : DateTime.parse(json['data'] as String)
      ..contas = (json['contas'] as List<dynamic>?)
              ?.map((e) => Conta.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

Map<String, dynamic> _$RemessaBancariaToJson(RemessaBancaria instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'empresa': instance.empresa,
      'idContaCorrente': instance.idContaCorrente,
      'contaCorrente': instance.contaCorrente,
      'idContaCorrenteCarteira': instance.idContaCorrenteCarteira,
      'contaCorrenteCarteira': instance.contaCorrenteCarteira,
      'sequencia': instance.sequencia,
      'tipoRemessa': instance.tipoRemessa,
      'data': instance.data?.toIso8601String(),
      'contas': instance.contas,
    };

ApuracaoRoyalty _$ApuracaoRoyaltyFromJson(Map<String, dynamic> json) =>
    ApuracaoRoyalty()
      ..id = json['id'] as int?
      ..idEmpresa = json['idEmpresa'] as int?
      ..empresa = json['empresa'] == null
          ? null
          : Empresa.fromJson(json['empresa'] as Map<String, dynamic>)
      ..idUsuario = json['idUsuario'] as int?
      ..usuario = json['usuario'] == null
          ? null
          : Usuario.fromJson(json['usuario'] as Map<String, dynamic>)
      ..dataApuracao = json['dataApuracao'] == null
          ? null
          : DateTime.parse(json['dataApuracao'] as String)
      ..numero = json['numero'] as int?
      ..dataInicial = json['dataInicial'] == null
          ? null
          : DateTime.parse(json['dataInicial'] as String)
      ..dataFinal = json['dataFinal'] == null
          ? null
          : DateTime.parse(json['dataFinal'] as String)
      ..considerarTaxaServico = json['considerarTaxaServico'] as bool?
      ..considerarTaxaEntrega = json['considerarTaxaEntrega'] as bool?
      ..considerarTaxaIfood = json['considerarTaxaIfood'] as bool?
      ..faturado = json['faturado'] as bool?
      ..valorRoyalty = json['valorRoyalty'] == null
          ? null
          : BigDecimal.fromJson(json['valorRoyalty'])
      ..valorMarketing = json['valorMarketing'] == null
          ? null
          : BigDecimal.fromJson(json['valorMarketing'])
      ..lojas = (json['lojas'] as List<dynamic>?)
              ?.map((e) =>
                  ApuracaoRoyaltyLoja.fromJson(e as Map<String, dynamic>))
              .toList() ??
          []
      ..contas = (json['contas'] as List<dynamic>?)
              ?.map((e) => Conta.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

Map<String, dynamic> _$ApuracaoRoyaltyToJson(ApuracaoRoyalty instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'empresa': instance.empresa,
      'idUsuario': instance.idUsuario,
      'usuario': instance.usuario,
      'dataApuracao': instance.dataApuracao?.toIso8601String(),
      'numero': instance.numero,
      'dataInicial': instance.dataInicial?.toIso8601String(),
      'dataFinal': instance.dataFinal?.toIso8601String(),
      'considerarTaxaServico': instance.considerarTaxaServico,
      'considerarTaxaEntrega': instance.considerarTaxaEntrega,
      'considerarTaxaIfood': instance.considerarTaxaIfood,
      'faturado': instance.faturado,
      'valorRoyalty': instance.valorRoyalty,
      'valorMarketing': instance.valorMarketing,
      'lojas': instance.lojas,
      'contas': instance.contas,
    };

ApuracaoRoyaltyLoja _$ApuracaoRoyaltyLojaFromJson(Map<String, dynamic> json) =>
    ApuracaoRoyaltyLoja()
      ..id = json['id'] as int?
      ..idApuracaoRoyalty = json['idApuracaoRoyalty'] as int?
      ..apuracaoRoyalty = json['apuracaoRoyalty'] == null
          ? null
          : ApuracaoRoyalty.fromJson(
              json['apuracaoRoyalty'] as Map<String, dynamic>)
      ..idEmpresa = json['idEmpresa'] as int?
      ..empresa = json['empresa'] == null
          ? null
          : Empresa.fromJson(json['empresa'] as Map<String, dynamic>)
      ..data =
          json['data'] == null ? null : DateTime.parse(json['data'] as String)
      ..vendaBruta = json['vendaBruta'] == null
          ? null
          : BigDecimal.fromJson(json['vendaBruta'])
      ..desconto = json['desconto'] == null
          ? null
          : BigDecimal.fromJson(json['desconto'])
      ..acrescimo = json['acrescimo'] == null
          ? null
          : BigDecimal.fromJson(json['acrescimo'])
      ..ticketMedio = json['ticketMedio'] == null
          ? null
          : BigDecimal.fromJson(json['ticketMedio'])
      ..quantidadeVendas = json['quantidadeVendas'] as int?
      ..taxaServico = json['taxaServico'] == null
          ? null
          : BigDecimal.fromJson(json['taxaServico'])
      ..taxaEntrega = json['taxaEntrega'] == null
          ? null
          : BigDecimal.fromJson(json['taxaEntrega'])
      ..taxaIfood = json['taxaIfood'] == null
          ? null
          : BigDecimal.fromJson(json['taxaIfood'])
      ..vendaTotal = json['vendaTotal'] == null
          ? null
          : BigDecimal.fromJson(json['vendaTotal'])
      ..valoresDesconsiderados = json['valoresDesconsiderados'] == null
          ? null
          : BigDecimal.fromJson(json['valoresDesconsiderados'])
      ..baseCalculo = json['baseCalculo'] == null
          ? null
          : BigDecimal.fromJson(json['baseCalculo'])
      ..taxaRoyalty = json['taxaRoyalty'] == null
          ? null
          : BigDecimal.fromJson(json['taxaRoyalty'])
      ..valorRoyalty = json['valorRoyalty'] == null
          ? null
          : BigDecimal.fromJson(json['valorRoyalty'])
      ..valorRoyaltyDesconto = json['valorRoyaltyDesconto'] == null
          ? null
          : BigDecimal.fromJson(json['valorRoyaltyDesconto'])
      ..valorRoyaltyTotal = json['valorRoyaltyTotal'] == null
          ? null
          : BigDecimal.fromJson(json['valorRoyaltyTotal'])
      ..taxaMarketing = json['taxaMarketing'] == null
          ? null
          : BigDecimal.fromJson(json['taxaMarketing'])
      ..valorMarketing = json['valorMarketing'] == null
          ? null
          : BigDecimal.fromJson(json['valorMarketing'])
      ..valorMarketingDesconto = json['valorMarketingDesconto'] == null
          ? null
          : BigDecimal.fromJson(json['valorMarketingDesconto'])
      ..valorMarketingTotal = json['valorMarketingTotal'] == null
          ? null
          : BigDecimal.fromJson(json['valorMarketingTotal'])
      ..idNotaRoyalty = json['idNotaRoyalty'] as int?
      ..notaRoyalty = json['notaRoyalty'] == null
          ? null
          : Nota.fromJson(json['notaRoyalty'] as Map<String, dynamic>)
      ..idNotaMarketing = json['idNotaMarketing'] as int?
      ..notaMarketing = json['notaMarketing'] == null
          ? null
          : Nota.fromJson(json['notaMarketing'] as Map<String, dynamic>);

Map<String, dynamic> _$ApuracaoRoyaltyLojaToJson(
        ApuracaoRoyaltyLoja instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idApuracaoRoyalty': instance.idApuracaoRoyalty,
      'apuracaoRoyalty': instance.apuracaoRoyalty,
      'idEmpresa': instance.idEmpresa,
      'empresa': instance.empresa,
      'data': instance.data?.toIso8601String(),
      'vendaBruta': instance.vendaBruta,
      'desconto': instance.desconto,
      'acrescimo': instance.acrescimo,
      'ticketMedio': instance.ticketMedio,
      'quantidadeVendas': instance.quantidadeVendas,
      'taxaServico': instance.taxaServico,
      'taxaEntrega': instance.taxaEntrega,
      'taxaIfood': instance.taxaIfood,
      'vendaTotal': instance.vendaTotal,
      'valoresDesconsiderados': instance.valoresDesconsiderados,
      'baseCalculo': instance.baseCalculo,
      'taxaRoyalty': instance.taxaRoyalty,
      'valorRoyalty': instance.valorRoyalty,
      'valorRoyaltyDesconto': instance.valorRoyaltyDesconto,
      'valorRoyaltyTotal': instance.valorRoyaltyTotal,
      'taxaMarketing': instance.taxaMarketing,
      'valorMarketing': instance.valorMarketing,
      'valorMarketingDesconto': instance.valorMarketingDesconto,
      'valorMarketingTotal': instance.valorMarketingTotal,
      'idNotaRoyalty': instance.idNotaRoyalty,
      'notaRoyalty': instance.notaRoyalty,
      'idNotaMarketing': instance.idNotaMarketing,
      'notaMarketing': instance.notaMarketing,
    };

CentroCusto _$CentroCustoFromJson(Map<String, dynamic> json) => CentroCusto()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..empresa = json['empresa'] == null
      ? null
      : Empresa.fromJson(json['empresa'] as Map<String, dynamic>)
  ..descricao = json['descricao'] as String?
  ..codigo = json['codigo'] as String?
  ..idCentroCustoRaiz = json['idCentroCustoRaiz'] as int?
  ..centroCustoRaiz = json['centroCustoRaiz'] == null
      ? null
      : CentroCusto.fromJson(json['centroCustoRaiz'] as Map<String, dynamic>)
  ..idCentroCustoPai = json['idCentroCustoPai'] as int?
  ..centroCustoPai = json['centroCustoPai'] == null
      ? null
      : CentroCusto.fromJson(json['centroCustoPai'] as Map<String, dynamic>)
  ..subitens = (json['subitens'] as List<dynamic>?)
          ?.map((e) => CentroCusto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [];

Map<String, dynamic> _$CentroCustoToJson(CentroCusto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'empresa': instance.empresa,
      'descricao': instance.descricao,
      'codigo': instance.codigo,
      'idCentroCustoRaiz': instance.idCentroCustoRaiz,
      'centroCustoRaiz': instance.centroCustoRaiz,
      'idCentroCustoPai': instance.idCentroCustoPai,
      'centroCustoPai': instance.centroCustoPai,
      'subitens': instance.subitens,
    };

PlanoConta _$PlanoContaFromJson(Map<String, dynamic> json) => PlanoConta()
  ..id = json['id'] as int?
  ..idEmpresa = json['idEmpresa'] as int?
  ..empresa = json['empresa'] == null
      ? null
      : Empresa.fromJson(json['empresa'] as Map<String, dynamic>)
  ..TipoMovimento = json['TipoMovimento'] as String?
  ..descricao = json['descricao'] as String?
  ..codigo = json['codigo'] as String?
  ..idPlanoContaRaiz = json['idPlanoContaRaiz'] as int?
  ..planoContaRaiz = json['planoContaRaiz'] == null
      ? null
      : PlanoConta.fromJson(json['planoContaRaiz'] as Map<String, dynamic>)
  ..idPlanoContaPai = json['idPlanoContaPai'] as int?
  ..planoContaPai = json['planoContaPai'] == null
      ? null
      : PlanoConta.fromJson(json['planoContaPai'] as Map<String, dynamic>)
  ..classificacao = json['classificacao'] as String?
  ..compraRevenda = json['compraRevenda'] as bool?
  ..subitens = (json['subitens'] as List<dynamic>?)
          ?.map((e) => PlanoConta.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [];

Map<String, dynamic> _$PlanoContaToJson(PlanoConta instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'empresa': instance.empresa,
      'TipoMovimento': instance.TipoMovimento,
      'descricao': instance.descricao,
      'codigo': instance.codigo,
      'idPlanoContaRaiz': instance.idPlanoContaRaiz,
      'planoContaRaiz': instance.planoContaRaiz,
      'idPlanoContaPai': instance.idPlanoContaPai,
      'planoContaPai': instance.planoContaPai,
      'classificacao': instance.classificacao,
      'compraRevenda': instance.compraRevenda,
      'subitens': instance.subitens,
    };

ConfiguracoesAutoPesagemDTO _$ConfiguracoesAutoPesagemDTOFromJson(
        Map<String, dynamic> json) =>
    ConfiguracoesAutoPesagemDTO()
      ..clientAutoPesagem = json['clientAutoPesagem'] == null
          ? null
          : ClientAutoPesagem.fromJson(
              json['clientAutoPesagem'] as Map<String, dynamic>)
      ..estacaoTrabalho = json['estacaoTrabalho'] == null
          ? null
          : EstacaoTrabalho.fromJson(
              json['estacaoTrabalho'] as Map<String, dynamic>)
      ..empresa = json['empresa'] == null
          ? null
          : Empresa.fromJson(json['empresa'] as Map<String, dynamic>);

Map<String, dynamic> _$ConfiguracoesAutoPesagemDTOToJson(
        ConfiguracoesAutoPesagemDTO instance) =>
    <String, dynamic>{
      'clientAutoPesagem': instance.clientAutoPesagem,
      'estacaoTrabalho': instance.estacaoTrabalho,
      'empresa': instance.empresa,
    };

ClientAutoPesagem _$ClientAutoPesagemFromJson(Map<String, dynamic> json) =>
    ClientAutoPesagem()
      ..id = json['id'] as int?
      ..idEmpresa = json['idEmpresa'] as int?
      ..idGradeEmpresa = json['idGradeEmpresa'] as int?
      ..tara = json['tara'] == null ? null : BigDecimal.fromJson(json['tara'])
      ..gradeEmpresa = json['gradeEmpresa'] == null
          ? null
          : GradeEmpresa.fromJson(json['gradeEmpresa'] as Map<String, dynamic>)
      ..imprimirPeso = json['imprimirPeso'] as bool
      ..lancamentoAutomatico = json['lancamentoAutomatico'] as String?;

Map<String, dynamic> _$ClientAutoPesagemToJson(ClientAutoPesagem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'idGradeEmpresa': instance.idGradeEmpresa,
      'tara': instance.tara,
      'gradeEmpresa': instance.gradeEmpresa,
      'imprimirPeso': instance.imprimirPeso,
      'lancamentoAutomatico': instance.lancamentoAutomatico,
    };

LayoutControle _$LayoutControleFromJson(Map<String, dynamic> json) =>
    LayoutControle()
      ..id = json['id'] as int?
      ..idEmpresa = json['idEmpresa'] as int?
      ..descricao = json['descricao'] as String?
      ..layoutControleTempoList =
          (json['layoutControleTempoList'] as List<dynamic>?)
                  ?.map((e) =>
                      LayoutControleTempo.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              []
      ..padrao = json['padrao'] as bool?;

Map<String, dynamic> _$LayoutControleToJson(LayoutControle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'descricao': instance.descricao,
      'layoutControleTempoList': instance.layoutControleTempoList,
      'padrao': instance.padrao,
    };

LayoutControleTempo _$LayoutControleTempoFromJson(Map<String, dynamic> json) =>
    LayoutControleTempo()
      ..id = json['id'] as int?
      ..idLayoutControler = json['idLayoutControler'] as int?
      ..tempoColor = $enumDecodeNullable(
          _$TempoColorEnumMap, json['tempoColor'],
          unknownValue: TempoColor.VERMELHO)
      ..horaInicial = json['horaInicial'] as int?
      ..horaFinal = json['horaFinal'] as int?;

Map<String, dynamic> _$LayoutControleTempoToJson(
        LayoutControleTempo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idLayoutControler': instance.idLayoutControler,
      'tempoColor': _$TempoColorEnumMap[instance.tempoColor],
      'horaInicial': instance.horaInicial,
      'horaFinal': instance.horaFinal,
    };

const _$TempoColorEnumMap = {
  TempoColor.AZUL: 'AZUL',
  TempoColor.VERDE: 'VERDE',
  TempoColor.AMARELO: 'AMARELO',
  TempoColor.LARANJA: 'LARANJA',
  TempoColor.VERMELHO: 'VERMELHO',
};

UsuarioPerfilEmpresa _$UsuarioPerfilEmpresaFromJson(
        Map<String, dynamic> json) =>
    UsuarioPerfilEmpresa()
      ..id = json['id'] as int?
      ..descricao = json['descricao'] as String?
      ..acessoERP = json['acessoERP'] as bool
      ..idEmpresa = json['idEmpresa'] as int?
      ..usuarioPerfilEmpresaPrivilegios =
          (json['usuarioPerfilEmpresaPrivilegios'] as List<dynamic>)
              .map((e) => UsuarioPerfilEmpresaPrivilegio.fromJson(
                  e as Map<String, dynamic>))
              .toList()
      ..master = json['master'] as bool?
      ..padrao = json['padrao'] as bool?;

Map<String, dynamic> _$UsuarioPerfilEmpresaToJson(
        UsuarioPerfilEmpresa instance) =>
    <String, dynamic>{
      'id': instance.id,
      'descricao': instance.descricao,
      'acessoERP': instance.acessoERP,
      'idEmpresa': instance.idEmpresa,
      'usuarioPerfilEmpresaPrivilegios':
          instance.usuarioPerfilEmpresaPrivilegios,
      'master': instance.master,
      'padrao': instance.padrao,
    };

UsuarioPerfilEmpresaPrivilegio _$UsuarioPerfilEmpresaPrivilegioFromJson(
        Map<String, dynamic> json) =>
    UsuarioPerfilEmpresaPrivilegio()
      ..id = json['id'] as int?
      ..idUsuarioPerfilEmpresa = json['idUsuarioPerfilEmpresa'] as int?
      ..privilegioCodigo = $enumDecodeNullable(
          _$PrivilegioCodigoEnumMap, json['privilegioCodigo'])
      ..nivelPrivilegio = $enumDecodeNullable(
          _$NivelPrivilegioEnumMap, json['nivelPrivilegio']);

Map<String, dynamic> _$UsuarioPerfilEmpresaPrivilegioToJson(
        UsuarioPerfilEmpresaPrivilegio instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idUsuarioPerfilEmpresa': instance.idUsuarioPerfilEmpresa,
      'privilegioCodigo': _$PrivilegioCodigoEnumMap[instance.privilegioCodigo],
      'nivelPrivilegio': _$NivelPrivilegioEnumMap[instance.nivelPrivilegio],
    };

const _$PrivilegioCodigoEnumMap = {
  PrivilegioCodigo.WAY_CAD_LOJISTA: 'WAY_CAD_LOJISTA',
  PrivilegioCodigo.WAY_CAD_CARTEIRAS: 'WAY_CAD_CARTEIRAS',
  PrivilegioCodigo.WAY_TRANSACAO: 'WAY_TRANSACAO',
  PrivilegioCodigo.WAY_IMP_CLI: 'WAY_IMP_CLI',
  PrivilegioCodigo.WAY_EXP_FECHAMENTO: 'WAY_EXP_FECHAMENTO',
  PrivilegioCodigo.QUEST_PROD_VINCULADOS: 'QUEST_PROD_VINCULADOS',
  PrivilegioCodigo.QUEST_TRANSACAO: 'QUEST_TRANSACAO',
  PrivilegioCodigo.PROD_CAD: 'PROD_CAD',
  PrivilegioCodigo.PROD_REMARCAR_PRECO: 'PROD_REMARCAR_PRECO',
  PrivilegioCodigo.PROD_CAD_FICHA_TECNICA: 'PROD_CAD_FICHA_TECNICA',
  PrivilegioCodigo.PROD_MIX_PRODUTO: 'PROD_MIX_PRODUTO',
  PrivilegioCodigo.PROD_CAD_GRUPO: 'PROD_CAD_GRUPO',
  PrivilegioCodigo.PROD_CAD_VARIACAO: 'PROD_CAD_VARIACAO',
  PrivilegioCodigo.PROD_CAD_TBL_PRECO: 'PROD_CAD_TBL_PRECO',
  PrivilegioCodigo.PROD_CAD_OBS: 'PROD_CAD_OBS',
  PrivilegioCodigo.PROD_CAD_MENU: 'PROD_CAD_MENU',
  PrivilegioCodigo.PROD_CAD_LOCAL_PRODUCAO: 'PROD_CAD_LOCAL_PRODUCAO',
  PrivilegioCodigo.PROD_CAD_LOCAL_ESTOCAGEM: 'PROD_CAD_LOCAL_ESTOCAGEM',
  PrivilegioCodigo.PROD_CAD_CARDAPIOS: 'PROD_CAD_CARDAPIOS',
  PrivilegioCodigo.PROD_CAD_DEP_FISCAL_ICMS: 'PROD_CAD_DEP_FISCAL_ICMS',
  PrivilegioCodigo.PROD_CAD_DEP_FISCAL_ISSQN: 'PROD_CAD_DEP_FISCAL_ISSQN',
  PrivilegioCodigo.PROD_CAD_DEP_FISCAL_PISCOFINS:
      'PROD_CAD_DEP_FISCAL_PISCOFINS',
  PrivilegioCodigo.PROD_CAD_CLASS_FISCAL_CONTRIBUINTE:
      'PROD_CAD_CLASS_FISCAL_CONTRIBUINTE',
  PrivilegioCodigo.PROD_CAD_TRIB_UF: 'PROD_CAD_TRIB_UF',
  PrivilegioCodigo.PROD_CAD_PROMOCAO: 'PROD_CAD_PROMOCAO',
  PrivilegioCodigo.PROD_CAD_PROMOCAO_ITEM: 'PROD_CAD_PROMOCAO_ITEM',
  PrivilegioCodigo.PROD_CAD_VINC_FORNEC: 'PROD_CAD_VINC_FORNEC',
  PrivilegioCodigo.EST_PRODUCAO: 'EST_PRODUCAO',
  PrivilegioCodigo.EST_AJUSTE_SIMPLES: 'EST_AJUSTE_SIMPLES',
  PrivilegioCodigo.EST_AJUSTE_AVANCADO: 'EST_AJUSTE_AVANCADO',
  PrivilegioCodigo.EST_TRANSF_INTERNA: 'EST_TRANSF_INTERNA',
  PrivilegioCodigo.EST_TRANSF_EXTERNA: 'EST_TRANSF_EXTERNA',
  PrivilegioCodigo.EST_DEV_VENDA: 'EST_DEV_VENDA',
  PrivilegioCodigo.EST_DEV_COMPRA: 'EST_DEV_COMPRA',
  PrivilegioCodigo.EST_CAD_INVENTARIO: 'EST_CAD_INVENTARIO',
  PrivilegioCodigo.EST_CAD_SETOR: 'EST_CAD_SETOR',
  PrivilegioCodigo.PESSOA_CAD_CLI: 'PESSOA_CAD_CLI',
  PrivilegioCodigo.PESSOA_CAD_REG: 'PESSOA_CAD_REG',
  PrivilegioCodigo.PESSOA_CAD_CLASSIFICACAO: 'PESSOA_CAD_CLASSIFICACAO',
  PrivilegioCodigo.PESSOA_CAD_RAMO_ATIVIDADE: 'PESSOA_CAD_RAMO_ATIVIDADE',
  PrivilegioCodigo.PESSOA_CAD_STATUS_CREDITO: 'PESSOA_CAD_STATUS_CREDITO',
  PrivilegioCodigo.PESSOA_CAD_FORN: 'PESSOA_CAD_FORN',
  PrivilegioCodigo.PESSOA_CAD_REPR: 'PESSOA_CAD_REPR',
  PrivilegioCodigo.PESSOA_CAD_FUNC: 'PESSOA_CAD_FUNC',
  PrivilegioCodigo.PESSOA_CAD_EMPRESA: 'PESSOA_CAD_EMPRESA',
  PrivilegioCodigo.PESSOA_CAD_USUARIO: 'PESSOA_CAD_USUARIO',
  PrivilegioCodigo.PESSOA_CAD_USUARIO_PERFIL: 'PESSOA_CAD_USUARIO_PERFIL',
  PrivilegioCodigo.PARAM_TROCA_PERFIL: 'PARAM_TROCA_PERFIL',
  PrivilegioCodigo.FIN_FAT_CLI_VENDA: 'FIN_FAT_CLI_VENDA',
  PrivilegioCodigo.FIN_FAT_CLI_EXTRATO_CONTA: 'FIN_FAT_CLI_EXTRATO_CONTA',
  PrivilegioCodigo.FIN_FAT_CLI_SALDO_CREDITOS: 'FIN_FAT_CLI_SALDO_CREDITOS',
  PrivilegioCodigo.FIN_FAT_CLI_DEBITAR_LIMITE: 'FIN_FAT_CLI_DEBITAR_LIMITE',
  PrivilegioCodigo.FIN_CAD_TIT_RECEBER: 'FIN_CAD_TIT_RECEBER',
  PrivilegioCodigo.FIN_RECEB_BAIXA_TITULO_RECEBER:
      'FIN_RECEB_BAIXA_TITULO_RECEBER',
  PrivilegioCodigo.FIN_CAD_TIT_PAGAR: 'FIN_CAD_TIT_PAGAR',
  PrivilegioCodigo.FIN_RECEB_BAIXA_TITULO_PAGAR: 'FIN_RECEB_BAIXA_TITULO_PAGAR',
  PrivilegioCodigo.FIN_ESTORNO: 'FIN_ESTORNO',
  PrivilegioCodigo.FIN_CAD_BANCO_CONTA: 'FIN_CAD_BANCO_CONTA',
  PrivilegioCodigo.FIN_CONF_CAIXA: 'FIN_CONF_CAIXA',
  PrivilegioCodigo.FIN_CAD_BANDEIRAS: 'FIN_CAD_BANDEIRAS',
  PrivilegioCodigo.FIN_CAD_TRANS_CARTAO: 'FIN_CAD_TRANS_CARTAO',
  PrivilegioCodigo.FIN_MAN_CREDITOS: 'FIN_MAN_CREDITOS',
  PrivilegioCodigo.FIN_DRE: 'FIN_DRE',
  PrivilegioCodigo.FIN_CAD_DFC: 'FIN_CAD_DFC',
  PrivilegioCodigo.FIN_CAD_ROYALTIES: 'FIN_CAD_ROYALTIES',
  PrivilegioCodigo.FIN_CAD_PLANO_CONTAS: 'FIN_CAD_PLANO_CONTAS',
  PrivilegioCodigo.FIN_CAD_CENTRO_CUSTO: 'FIN_CAD_CENTRO_CUSTO',
  PrivilegioCodigo.FIN_CAD_CC: 'FIN_CAD_CC',
  PrivilegioCodigo.FISCAL_NF_EMISSAO: 'FISCAL_NF_EMISSAO',
  PrivilegioCodigo.FISCAL_NF_LANCAMENTO: 'FISCAL_NF_LANCAMENTO',
  PrivilegioCodigo.FISCAL_NF_CONS_GERENCIA: 'FISCAL_NF_CONS_GERENCIA',
  PrivilegioCodigo.FISCAL_CAD_CFOP: 'FISCAL_CAD_CFOP',
  PrivilegioCodigo.FISCAL_PLANILHA_PRECO: 'FISCAL_PLANILHA_PRECO',
  PrivilegioCodigo.FISCAL_TEF_ADMINISTRATIVO: 'FISCAL_TEF_ADMINISTRATIVO',
  PrivilegioCodigo.CONS_ATENDIMENTOS: 'CONS_ATENDIMENTOS',
  PrivilegioCodigo.CONS_CAIXA: 'CONS_CAIXA',
  PrivilegioCodigo.CONS_DASHBOARD: 'CONS_DASHBOARD',
  PrivilegioCodigo.REL_CAD_PRODUTO: 'REL_CAD_PRODUTO',
  PrivilegioCodigo.REL_CAD_CLIENTE: 'REL_CAD_CLIENTE',
  PrivilegioCodigo.REL_CAD_TRIBUTACAO: 'REL_CAD_TRIBUTACAO',
  PrivilegioCodigo.REL_FAT_MONETARIO: 'REL_FAT_MONETARIO',
  PrivilegioCodigo.REL_FAT_PROD_VENDIDOS: 'REL_FAT_PROD_VENDIDOS',
  PrivilegioCodigo.REL_FAT_CANC: 'REL_FAT_CANC',
  PrivilegioCodigo.REL_FAT_MODULOS: 'REL_FAT_MODULOS',
  PrivilegioCodigo.REL_FAT_FRANQUIA: 'REL_FAT_FRANQUIA',
  PrivilegioCodigo.REL_FAT_FISCAIS: 'REL_FAT_FISCAIS',
  PrivilegioCodigo.REL_ESTOQUE: 'REL_ESTOQUE',
  PrivilegioCodigo.PARAM_CAD_ESTACAO: 'PARAM_CAD_ESTACAO',
  PrivilegioCodigo.PARAM_CAD_EMISSOR_FISCAL: 'PARAM_CAD_EMISSOR_FISCAL',
  PrivilegioCodigo.PARAM_CAD_IMPRESSORA: 'PARAM_CAD_IMPRESSORA',
  PrivilegioCodigo.PARAM_CAD_BALANCA: 'PARAM_CAD_BALANCA',
  PrivilegioCodigo.PARAM_CAD_CANAIS_VENDA: 'PARAM_CAD_CANAIS_VENDA',
  PrivilegioCodigo.PARAM_CAD_FIN_COND_PAG: 'PARAM_CAD_FIN_COND_PAG',
  PrivilegioCodigo.PARAM_LAYOUT_CONF: 'PARAM_LAYOUT_CONF',
  PrivilegioCodigo.PARAM_CONTINGENCIA: 'PARAM_CONTINGENCIA',
  PrivilegioCodigo.PARAM_CAD_GERENCIADORES: 'PARAM_CAD_GERENCIADORES',
  PrivilegioCodigo.PARAM_GERENCIAR_SESSOES_EXTRAS:
      'PARAM_GERENCIAR_SESSOES_EXTRAS',
  PrivilegioCodigo.PARAM_CAD_PLANO_PAGAMENTO: 'PARAM_CAD_PLANO_PAGAMENTO',
  PrivilegioCodigo.CONF_CAD_MODULO: 'CONF_CAD_MODULO',
  PrivilegioCodigo.CONF_CAD_MODULO_POSICAO: 'CONF_CAD_MODULO_POSICAO',
  PrivilegioCodigo.CONF_PUB: 'CONF_PUB',
  PrivilegioCodigo.CONF_CAD_PUB_EVENTO: 'CONF_CAD_PUB_EVENTO',
  PrivilegioCodigo.CONF_CAD_PUB_PERFIL: 'CONF_CAD_PUB_PERFIL',
  PrivilegioCodigo.CONF_PUB_CARTAO_PREVENDA: 'CONF_PUB_CARTAO_PREVENDA',
  PrivilegioCodigo.CONF_PUB_CARTAO_CHECKIN: 'CONF_PUB_CARTAO_CHECKIN',
  PrivilegioCodigo.CX_SANGRIA: 'CX_SANGRIA',
  PrivilegioCodigo.CX_SUPRIMENTO: 'CX_SUPRIMENTO',
  PrivilegioCodigo.CX_ABRIR_GAVETA: 'CX_ABRIR_GAVETA',
  PrivilegioCodigo.CX_CONFERE_TURNO: 'CX_CONFERE_TURNO',
  PrivilegioCodigo.CX_VISUALIZAR_EXTRATO: 'CX_VISUALIZAR_EXTRATO',
  PrivilegioCodigo.CX_IMPRESSAO_RESUMO: 'CX_IMPRESSAO_RESUMO',
  PrivilegioCodigo.CX_VISUALIZAR_RESUMO: 'CX_VISUALIZAR_RESUMO',
  PrivilegioCodigo.CX_IMPRESSAO_COMPROVANTE: 'CX_IMPRESSAO_COMPROVANTE',
  PrivilegioCodigo.CX_CONTAGEM_SISTEMA: 'CX_CONTAGEM_SISTEMA',
  PrivilegioCodigo.CX_VISUALIZAR_DIFERENCA: 'CX_VISUALIZAR_DIFERENCA',
  PrivilegioCodigo.CX_DETALHES_LANCAMENTO: 'CX_DETALHES_LANCAMENTO',
  PrivilegioCodigo.CX_BUSCAR_TURNOS: 'CX_BUSCAR_TURNOS',
  PrivilegioCodigo.WAYCHEF_MAPA_COMANDA: 'WAYCHEF_MAPA_COMANDA',
  PrivilegioCodigo.WAYCHEF_CANCELA_ITEM_ANTES: 'WAYCHEF_CANCELA_ITEM_ANTES',
  PrivilegioCodigo.WAYCHEF_CANCELA_ITEM_DEPOIS: 'WAYCHEF_CANCELA_ITEM_DEPOIS',
  PrivilegioCodigo.WAYCHEF_CANCELA_CONSUMO: 'WAYCHEF_CANCELA_CONSUMO',
  PrivilegioCodigo.WAYCHEF_SUSPENDER: 'WAYCHEF_SUSPENDER',
  PrivilegioCodigo.WAYCHEF_CONTA_FECHAR: 'WAYCHEF_CONTA_FECHAR',
  PrivilegioCodigo.WAYCHEF_CONTA_REABRIR: 'WAYCHEF_CONTA_REABRIR',
  PrivilegioCodigo.WAYCHEF_ISENTA_TX_SERV: 'WAYCHEF_ISENTA_TX_SERV',
  PrivilegioCodigo.WAYCHEF_ISENTA_TX_FRETE: 'WAYCHEF_ISENTA_TX_FRETE',
  PrivilegioCodigo.WAYCHEF_TRANSFERIR_JUNTAR: 'WAYCHEF_TRANSFERIR_JUNTAR',
  PrivilegioCodigo.WAYCHEF_RESERVA_MESA: 'WAYCHEF_RESERVA_MESA',
  PrivilegioCodigo.WAYCHEF_PREDESCONTO: 'WAYCHEF_PREDESCONTO',
  PrivilegioCodigo.WAYCHEF_EXPEDIR: 'WAYCHEF_EXPEDIR',
  PrivilegioCodigo.WAYCHEF_EXPEDIR_CANCELAR: 'WAYCHEF_EXPEDIR_CANCELAR',
  PrivilegioCodigo.WAYCHEF_RELATORIOS: 'WAYCHEF_RELATORIOS',
  PrivilegioCodigo.WAYCHEF_CONSUL_ATEND: 'WAYCHEF_CONSUL_ATEND',
  PrivilegioCodigo.WAYCHEF_CONFIGURAR: 'WAYCHEF_CONFIGURAR',
  PrivilegioCodigo.WAYCHEF_SERVICOS: 'WAYCHEF_SERVICOS',
  PrivilegioCodigo.VENDA_VENDER: 'VENDA_VENDER',
  PrivilegioCodigo.VENDA_RECEBER: 'VENDA_RECEBER',
  PrivilegioCodigo.VENDA_DEBITAR_CLIENTE: 'VENDA_DEBITAR_CLIENTE',
  PrivilegioCodigo.VENDA_PERMITIR_FINALIZADORA: 'VENDA_PERMITIR_FINALIZADORA',
  PrivilegioCodigo.VENDA_PERMITIR_DESCONTO_EXCEDENTE_VENDA:
      'VENDA_PERMITIR_DESCONTO_EXCEDENTE_VENDA',
  PrivilegioCodigo.VENDA_PERMITIR_DESCONTO_ITEM_GERAL:
      'VENDA_PERMITIR_DESCONTO_ITEM_GERAL',
  PrivilegioCodigo.VENDA_PERMITIR_DESCONTO_ITEM_ITEM:
      'VENDA_PERMITIR_DESCONTO_ITEM_ITEM',
  PrivilegioCodigo.VENDA_RECEBER_ITEM: 'VENDA_RECEBER_ITEM',
  PrivilegioCodigo.VENDA_CANCELA: 'VENDA_CANCELA',
  PrivilegioCodigo.VENDA_INFORMA_QTDE: 'VENDA_INFORMA_QTDE',
  PrivilegioCodigo.VENDA_ACRE_TOTAL: 'VENDA_ACRE_TOTAL',
  PrivilegioCodigo.VENDA_DESC_TOTAL: 'VENDA_DESC_TOTAL',
  PrivilegioCodigo.VENDA_DESC_ITEM: 'VENDA_DESC_ITEM',
  PrivilegioCodigo.PLAT_CAD_EMPRESAS: 'PLAT_CAD_EMPRESAS',
  PrivilegioCodigo.PLAT_CAD_TERMO_ACEITE: 'PLAT_CAD_TERMO_ACEITE',
  PrivilegioCodigo.PLAT_CAD_TUTORIAIS: 'PLAT_CAD_TUTORIAIS',
  PrivilegioCodigo.PLAT_CAD_VERSIONAMENTO: 'PLAT_CAD_VERSIONAMENTO',
  PrivilegioCodigo.PLAT_CAD_CLIENTS: 'PLAT_CAD_CLIENTS',
  PrivilegioCodigo.PLAT_CAD_DRIVERS_IMPRESSORA: 'PLAT_CAD_DRIVERS_IMPRESSORA',
  PrivilegioCodigo.PLAT_CAD_ICONES_PADRAO: 'PLAT_CAD_ICONES_PADRAO',
  PrivilegioCodigo.PLAT_CAD_CONTRATOS: 'PLAT_CAD_CONTRATOS',
  PrivilegioCodigo.PLAT_CAD_CONTRATOS_EXTRAS: 'PLAT_CAD_CONTRATOS_EXTRAS',
  PrivilegioCodigo.PLAT_CAD_BANCO: 'PLAT_CAD_BANCO',
  PrivilegioCodigo.PLAT_CAD_PGTO_IFOOD: 'PLAT_CAD_PGTO_IFOOD',
  PrivilegioCodigo.PLAT_CAD_CONFIG: 'PLAT_CAD_CONFIG',
  PrivilegioCodigo.PLAT_CAD_USUARIOS: 'PLAT_CAD_USUARIOS',
  PrivilegioCodigo.PLAT_CAD_PERMISSOES_PADRAO: 'PLAT_CAD_PERMISSOES_PADRAO',
  PrivilegioCodigo.PLAT_TRANSACOES: 'PLAT_TRANSACOES',
  PrivilegioCodigo.PLAT_CAD_SITEF_REDES_ADQUIRENTES:
      'PLAT_CAD_SITEF_REDES_ADQUIRENTES',
  PrivilegioCodigo.PLAT_CAD_SITEF_BANDEIRAS: 'PLAT_CAD_SITEF_BANDEIRAS',
  PrivilegioCodigo.PLAT_CAD_FISCAL_ORIGEM_MERCADORIA:
      'PLAT_CAD_FISCAL_ORIGEM_MERCADORIA',
  PrivilegioCodigo.PLAT_CAD_FISCAL_CST: 'PLAT_CAD_FISCAL_CST',
  PrivilegioCodigo.PLAT_CAD_FISCAL_CSOSN: 'PLAT_CAD_FISCAL_CSOSN',
  PrivilegioCodigo.PLAT_CAD_FISCAL_PIS_COFINS: 'PLAT_CAD_FISCAL_PIS_COFINS',
  PrivilegioCodigo.PLAT_CAD_FISCAL_NCM: 'PLAT_CAD_FISCAL_NCM',
  PrivilegioCodigo.PLAT_CAD_FISCAL_CEST: 'PLAT_CAD_FISCAL_CEST',
  PrivilegioCodigo.PLAT_CAD_FISCAL_CFOP_PADRAO: 'PLAT_CAD_FISCAL_CFOP_PADRAO',
  PrivilegioCodigo.PLAT_CAD_INF_COMP_DOC_FISCAL: 'PLAT_CAD_INF_COMP_DOC_FISCAL',
  PrivilegioCodigo.PLAT_CAD_EMISSOR_FISCAL: 'PLAT_CAD_EMISSOR_FISCAL',
  PrivilegioCodigo.PLAT_CAD_UF: 'PLAT_CAD_UF',
  PrivilegioCodigo.PLAT_FISCAL_IBPT: 'PLAT_FISCAL_IBPT',
  PrivilegioCodigo.PLAT_RELATORIOS: 'PLAT_RELATORIOS',
};

const _$NivelPrivilegioEnumMap = {
  NivelPrivilegio.CONSULTAR_PERMITIR: 'CONSULTAR_PERMITIR',
  NivelPrivilegio.INSERIR: 'INSERIR',
  NivelPrivilegio.ALTERAR: 'ALTERAR',
  NivelPrivilegio.EXCLUIR: 'EXCLUIR',
};

TicketImpressaoDTO _$TicketImpressaoDTOFromJson(Map<String, dynamic> json) =>
    TicketImpressaoDTO()
      ..nomeRestaurante = json['nomeRestaurante'] as String?
      ..modulo = json['modulo'] as String?
      ..comanda = json['comanda'] as String?
      ..itens = (json['itens'] as List<dynamic>)
          .map((e) => ItemDTO.fromJson(e as Map<String, dynamic>))
          .toList()
      ..equipamentoImpressao = json['equipamentoImpressao'] == null
          ? null
          : EquipamentoImpressao.fromJson(
              json['equipamentoImpressao'] as Map<String, dynamic>);

Map<String, dynamic> _$TicketImpressaoDTOToJson(TicketImpressaoDTO instance) =>
    <String, dynamic>{
      'nomeRestaurante': instance.nomeRestaurante,
      'modulo': instance.modulo,
      'comanda': instance.comanda,
      'itens': instance.itens,
      'equipamentoImpressao': instance.equipamentoImpressao,
    };

ItemDTO _$ItemDTOFromJson(Map<String, dynamic> json) => ItemDTO()
  ..produtoDescricao = json['produtoDescricao'] as String?
  ..codigoInterno = json['codigoInterno'] as String?
  ..produtoValor = json['produtoValor'] == null
      ? null
      : BigDecimal.fromJson(json['produtoValor'])
  ..quantidade = json['quantidade'] == null
      ? null
      : BigDecimal.fromJson(json['quantidade'])
  ..valor = json['valor'] == null ? null : BigDecimal.fromJson(json['valor']);

Map<String, dynamic> _$ItemDTOToJson(ItemDTO instance) => <String, dynamic>{
      'produtoDescricao': instance.produtoDescricao,
      'codigoInterno': instance.codigoInterno,
      'produtoValor': instance.produtoValor,
      'quantidade': instance.quantidade,
      'valor': instance.valor,
    };

ServicoAutoAtendimento _$ServicoAutoAtendimentoFromJson(
        Map<String, dynamic> json) =>
    ServicoAutoAtendimento()
      ..id = json['id'] as int?
      ..idEmpresa = json['idEmpresa'] as int?
      ..ativo = json['ativo'] as bool? ?? false
      ..token = json['token'] as String?
      ..ticketConsumo =
          $enumDecode(_$TicketConsumoEnumMap, json['ticketConsumo'])
      ..impressaoVenda =
          $enumDecode(_$ImpressaoVendaEnumMap, json['impressaoVenda'])
      ..avisoTempoOcioso = json['avisoTempoOcioso'] as int?
      ..senhaAtendimento =
          $enumDecode(_$SenhaAtendimentoEnumMap, json['senhaAtendimento'])
      ..idFinalizadoraDebito = json['idFinalizadoraDebito'] as int?
      ..idFinalizadoraCredito = json['idFinalizadoraCredito'] as int?
      ..finalizadoraDebito = json['finalizadoraDebito'] == null
          ? null
          : FinalizadoraEmpresa.fromJson(
              json['finalizadoraDebito'] as Map<String, dynamic>)
      ..finalizadoraCredito = json['finalizadoraCredito'] == null
          ? null
          : FinalizadoraEmpresa.fromJson(
              json['finalizadoraCredito'] as Map<String, dynamic>)
      ..mensagemFinalAtendimento = json['mensagemFinalAtendimento'] as String?
      ..arquivos = (json['arquivos'] as List<dynamic>?)
              ?.map((e) =>
                  ArquivoAutoAtendimento.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [];

Map<String, dynamic> _$ServicoAutoAtendimentoToJson(
        ServicoAutoAtendimento instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idEmpresa': instance.idEmpresa,
      'ativo': instance.ativo,
      'token': instance.token,
      'ticketConsumo': _$TicketConsumoEnumMap[instance.ticketConsumo],
      'impressaoVenda': _$ImpressaoVendaEnumMap[instance.impressaoVenda],
      'avisoTempoOcioso': instance.avisoTempoOcioso,
      'senhaAtendimento': _$SenhaAtendimentoEnumMap[instance.senhaAtendimento],
      'idFinalizadoraDebito': instance.idFinalizadoraDebito,
      'idFinalizadoraCredito': instance.idFinalizadoraCredito,
      'finalizadoraDebito': instance.finalizadoraDebito,
      'finalizadoraCredito': instance.finalizadoraCredito,
      'mensagemFinalAtendimento': instance.mensagemFinalAtendimento,
      'arquivos': instance.arquivos,
    };

const _$TicketConsumoEnumMap = {
  TicketConsumo.AGRUPAR: 'AGRUPAR',
  TicketConsumo.INDIVIDUAL: 'INDIVIDUAL',
  TicketConsumo.AGRUPAR_INDIVIDUAL: 'AGRUPAR_INDIVIDUAL',
};

const _$ImpressaoVendaEnumMap = {
  ImpressaoVenda.NAO_IMPRIME: 'NAO_IMPRIME',
  ImpressaoVenda.PERGUNTA: 'PERGUNTA',
  ImpressaoVenda.IMPRIME: 'IMPRIME',
};

const _$SenhaAtendimentoEnumMap = {
  SenhaAtendimento.NAO_UTILIZA: 'NAO_UTILIZA',
  SenhaAtendimento.SENHA_NUMERICA_ALEATORIA: 'SENHA_NUMERICA_ALEATORIA',
  SenhaAtendimento.SENHA_NUMERICA_SEQUENCIAL: 'SENHA_NUMERICA_SEQUENCIAL',
  SenhaAtendimento.ALFA_NUMERICA: 'ALFA_NUMERICA',
};

ArquivoAutoAtendimento _$ArquivoAutoAtendimentoFromJson(
        Map<String, dynamic> json) =>
    ArquivoAutoAtendimento()
      ..id = json['id'] as int?
      ..idServicoAutoAtendimento = json['idServicoAutoAtendimento'] as int?
      ..tipoArquivo =
          $enumDecodeNullable(_$TipoArquivoEnumMap, json['tipoArquivo'])
      ..visaoFoto = $enumDecodeNullable(_$VisaoFotoEnumMap, json['visaoFoto'])
      ..formatoArquivo =
          $enumDecodeNullable(_$FormatoArquivoEnumMap, json['formatoArquivo'])
      ..descricao = json['descricao'] as String?
      ..link = json['link'] as String?;

Map<String, dynamic> _$ArquivoAutoAtendimentoToJson(
        ArquivoAutoAtendimento instance) =>
    <String, dynamic>{
      'id': instance.id,
      'idServicoAutoAtendimento': instance.idServicoAutoAtendimento,
      'tipoArquivo': _$TipoArquivoEnumMap[instance.tipoArquivo],
      'visaoFoto': _$VisaoFotoEnumMap[instance.visaoFoto],
      'formatoArquivo': _$FormatoArquivoEnumMap[instance.formatoArquivo],
      'descricao': instance.descricao,
      'link': instance.link,
    };

const _$TipoArquivoEnumMap = {
  TipoArquivo.IMAGEM: 'IMAGEM',
  TipoArquivo.DOCUMENTO: 'DOCUMENTO',
};

const _$VisaoFotoEnumMap = {
  VisaoFoto.PORTRAIT: 'PORTRAIT',
  VisaoFoto.LANDSCAPE: 'LANDSCAPE',
};

const _$FormatoArquivoEnumMap = {
  FormatoArquivo.PNG: 'PNG',
  FormatoArquivo.JPG: 'JPG',
  FormatoArquivo.JPEG: 'JPEG',
  FormatoArquivo.BMP: 'BMP',
  FormatoArquivo.PDF: 'PDF',
  FormatoArquivo.DOC: 'DOC',
  FormatoArquivo.XML: 'XML',
  FormatoArquivo.XLS: 'XLS',
  FormatoArquivo.XLSX: 'XLSX',
  FormatoArquivo.TXT: 'TXT',
  FormatoArquivo.ZIP: 'ZIP',
  FormatoArquivo.RAR: 'RAR',
};

LoginAutoAtendimentoDTO _$LoginAutoAtendimentoDTOFromJson(
        Map<String, dynamic> json) =>
    LoginAutoAtendimentoDTO()
      ..servicoAutoAtendimento = json['servicoAutoAtendimento'] == null
          ? null
          : ServicoAutoAtendimento.fromJson(
              json['servicoAutoAtendimento'] as Map<String, dynamic>)
      ..estacaoTrabalho = json['estacaoTrabalho'] == null
          ? null
          : EstacaoTrabalho.fromJson(
              json['estacaoTrabalho'] as Map<String, dynamic>)
      ..empresa = json['empresa'] == null
          ? null
          : Empresa.fromJson(json['empresa'] as Map<String, dynamic>);

Map<String, dynamic> _$LoginAutoAtendimentoDTOToJson(
        LoginAutoAtendimentoDTO instance) =>
    <String, dynamic>{
      'servicoAutoAtendimento': instance.servicoAutoAtendimento,
      'estacaoTrabalho': instance.estacaoTrabalho,
      'empresa': instance.empresa,
    };

LoginClientDTO _$LoginClientDTOFromJson(Map<String, dynamic> json) =>
    LoginClientDTO()
      ..client = $enumDecodeNullable(_$ClientsEnumMap, json['client']) ??
          Clients.WAITER_MOBILE
      ..clientKey = json['clientKey'] as String?
      ..clientSecret = json['clientSecret'] as String?
      ..versao = json['versao'] as String?
      ..nomeEstacao = json['nomeEstacao'] as String?;

Map<String, dynamic> _$LoginClientDTOToJson(LoginClientDTO instance) =>
    <String, dynamic>{
      'client': _$ClientsEnumMap[instance.client],
      'clientKey': instance.clientKey,
      'clientSecret': instance.clientSecret,
      'versao': instance.versao,
      'nomeEstacao': instance.nomeEstacao,
    };

const _$ClientsEnumMap = {
  Clients.WAITER_MOBILE: 'WAITER_MOBILE',
  Clients.WAYCARD: 'WAYCARD',
  Clients.AUTOATENDIMENTO: 'AUTOATENDIMENTO',
  Clients.AUTOPESAGEM: 'AUTOPESAGEM',
};

TokenDTO _$TokenDTOFromJson(Map<String, dynamic> json) => TokenDTO()
  ..token = json['token'] as String?
  ..type = json['type'] as String;

Map<String, dynamic> _$TokenDTOToJson(TokenDTO instance) => <String, dynamic>{
      'token': instance.token,
      'type': instance.type,
    };

PrinterTefDTO _$PrinterTefDTOFromJson(Map<String, dynamic> json) =>
    PrinterTefDTO()
      ..viaCliente = json['viaCliente'] as String
      ..viaCaixa = json['viaCaixa'] as String
      ..equipamentoImpressao = json['equipamentoImpressao'] == null
          ? null
          : EquipamentoImpressao.fromJson(
              json['equipamentoImpressao'] as Map<String, dynamic>)
      ..servicoAutoAtendimento = json['servicoAutoAtendimento'] == null
          ? null
          : ServicoAutoAtendimento.fromJson(
              json['servicoAutoAtendimento'] as Map<String, dynamic>);

Map<String, dynamic> _$PrinterTefDTOToJson(PrinterTefDTO instance) =>
    <String, dynamic>{
      'viaCliente': instance.viaCliente,
      'viaCaixa': instance.viaCaixa,
      'equipamentoImpressao': instance.equipamentoImpressao,
      'servicoAutoAtendimento': instance.servicoAutoAtendimento,
    };
