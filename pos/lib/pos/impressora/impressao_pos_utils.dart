import 'dart:async';
import 'package:core/application/application.dart';
import 'package:flutter/material.dart';
import 'package:models/model/enum/clients.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/date_time_utils.dart';
import 'package:utils/utils/number_utils.dart';
import 'package:utils/widgets/confirmation_dialog.dart';

class ImpressaoPOSUtils {
  static Application? _application = Application.getInstance();
  static String impressao = "";
  static BigDecimal qtdeTotalItens = BigDecimal.ZERO();

  static Future imprimirGeneric(String impressao) async {
    await Application
        .getInstance()
        .impressoraService
        .imprime(impressao);
  }

  static Future imprimirFechamento(Nota nota, List<NotaItem> itens,
      Modulo modulo) async {
    impressao = "";
    _ticketCabecalho("Fechamento", nota);
    _ticketItens(nota, modulo, itens);
    _ticketTotais(nota, modulo);

    if (nota.consumo!.pessoas != null) {
      impressao += "Pessoas: ${nota.consumo!.pessoas} \n";
      impressao +=
      "Total por pessoa: ${(nota.valorTotal! /
          BigDecimal(nota.consumo!.pessoas.toString())).toStringAsFixed(
          2)} \n\n";
    }

    _ticketJuntados(nota);

    if (modulo.tipo == "DELIVERY" && nota.consumo!.tipoEntrega == "COMUM") {
      _dadosEntregaDelivery(nota);
    }

    impressao += _observacaoPedido(nota);

    _ticketRodape(modulo, nota);

    //imprime o numeros de vias cadastrada no erp
    for (int i = 0; i < modulo.imprimeVendaVias!; i++) {
      if (i < (modulo.imprimeVendaVias! - 1)) {
        impressao += "---------------------------- \n";
        impressao += "\n";
      }
      await Application
          .getInstance()
          .impressoraService
          .imprime(impressao);
    }
  }

  static Future imprimirVenda(Nota nota, List<NotaItem> itens,
      Modulo modulo) async {
    impressao = "";
    _ticketCabecalho("Pagamento", nota);
    _ticketItens(nota, modulo, itens);
    _ticketTotais(nota, modulo);
    _ticketJuntados(nota);

    _ticketRodape(modulo, nota);

    //imprime o numeros de vias cadastrada no erp
    for (int i = 0; i < modulo.imprimeVendaVias!; i++) {
      if (i < (modulo.imprimeVendaVias! - 1)) {
        impressao += "---------------------------- \n";
        impressao += "\n";
      }
      await Application
          .getInstance()
          .impressoraService
          .imprime(impressao);
    }
  }

  static void imprimirConsumo(Nota nota, Modulo modulo,
      NotaItem notaItem) async {
    impressao = "";

    impressao += "WAYCHEF" + "\n";
    impressao += "========================================" + "\n";
    impressao += "${modulo.tipo}" + "\n";
    impressao += "========================================" + "\n";
    impressao += "FICHA CONSUMO" + "\n\n";
    impressao += "Balcão #" + "${nota.consumo!.comanda}" + "\n";
    impressao += nota.consumo!.senhaAtendimento != null ? "Senha : " +
        "${nota.consumo!.senhaAtendimento}" + "\n" : "" + "\n";
    impressao += "Emissao: " + "${DateTimeUtils.format(
        nota.dataLancamento, DateTimeUtils.dataHoraFormat)}" + "\n";
    impressao += "================= ITEM =================" + "\n";

    impressao += "1x " + "${notaItem.descricao}" + "          R\$" +
        "${notaItem.precoUnitario!.toStringAsFixed(2)} \n";

    impressao += "======================================== \n";
    impressao += "	NAO E DOCUMENTO FISCA \n";

    for (var i = 0; i < 5; i++) {
      impressao += "\n";
    }

    await Application
        .getInstance()
        .impressoraService
        .imprime(impressao);
  }

  static Future comprovanteVinculadoVendaFaturar(ClienteConta conta,
      String responsavel, int? numeroVenda) async {
    impressao = "";

    impressao += "WAYCHEF \n";
    impressao += "============================== \n";
    impressao += "${DateTimeUtils.format(
        conta.dataLancamento, DateTimeUtils.dataHoraFormat)}\n";
    impressao += "=============================== \n";
    impressao += "COMPROVANTE \n\n";
    impressao += "Cliente :";
    impressao += "${conta.cliente!.pessoa!.nome}\n";

    if (conta.autorizado != null) {
      impressao += "Autorizado :";
      impressao += "${conta.autorizado!.pessoa!.nome}\n";
    }
    impressao += " \n ";

    impressao += "N. Venda : ";
    if (numeroVenda != null) {
      impressao += " ${numeroVenda.toString()}";
    }

    impressao += " \n ";
    impressao += "Valor : R\$";
    impressao += " ${conta.valor!.toStringAsFixed(2)}\n";
    impressao += " \n ";
    impressao += "Reconheço a importancia desta divida.\n\n\n";
    impressao += "____________________________________ \n";
    impressao += "$responsavel\n\n";
    impressao += "============================== \n";
    impressao +=
    "SALDO ATUAL DA CONTA :R\$  ${conta.saldo!.toStringAsFixed(2)} \n";
    impressao += "============================== \n";
    impressao += "NAO E DOCUMENTO FISCAL\n";
    for (var i = 0; i < 5; i++) {
      impressao += "\n";
    }

    await Application
        .getInstance()
        .impressoraService
        .imprime(impressao);
  }

  static Future imprimirCancelamento(Nota nota, List<NotaItem> itens,
      Modulo modulo) async {
    impressao = "";
    _ticketCabecalho("Cancelamento", nota);
    _ticketItens(nota, modulo, itens);
    _ticketTotais(nota, modulo);
    _ticketJuntados(nota);

    impressao += "** CANCELADO **";

    _ticketRodape(modulo, nota);

    await Application
        .getInstance()
        .impressoraService
        .imprime(impressao);
  }

  static Future imprimirCancelamentoItem(Nota nota, NotaItem notaItem,
      Modulo modulo) async {
    impressao = "";
    impressao += "============================== \n";
    impressao += "${Application
        .getInstance()
        .empresa
        .pessoa!
        .nome}\n";
    impressao += "============================== \n";
    impressao += "CANCELAMENTO DE ITEM \n\n";
    impressao +=
    "${nota.consumo!.modulo}: ${nota.consumo!.comanda}  ${DateTimeUtils.format(
        nota.dataEmissao, DateTimeUtils.dataHoraFormat)}\n";
    impressao += "============================== \n";
    impressao += "Produto: ${notaItem.descricao}\n";
    impressao +=
    "Qtde: ${notaItem.quantidade!.toDouble() != notaItem.quantidade!.toInt()
        ? notaItem.quantidade!.toStringAsFixed(3)
        : notaItem.quantidade!.toInt()}  Valor: R\$ ${notaItem.precoTotal!
        .toStringAsFixed(2)} \n";

    if (notaItem.motivoCancelamento != null &&
        notaItem.motivoCancelamento!.isNotEmpty)
      impressao += "Motivo: ${notaItem.motivoCancelamento}\n";

    impressao +=
    "Confirmado: ${notaItem.consumoItem!.confirmado! ? "SIM" : "NÃO"}\n\n";

    impressao += "============================== \n";
    impressao +=
    "LOJA: ${Application
        .getInstance()
        .empresa
        .numeroLoja}  CAIXA: ${Application
        .getInstance()
        .estacao!
        .numeroCaixa}\n";
    impressao +=
    "OPERADOR: ${Application
        .getInstance()
        .usuarioEmpresa!
        .usuario!
        .nome}\n";
    impressao +=
    "${DateTimeUtils.format(
        DateTime.now(), DateTimeUtils.dataHoraFullFormat)} \n";
    impressao += "============================== \n";
    impressao += "NAO E DOCUMENTO FISCAL \n";

    for (var i = 0; i < 5; i++) {
      impressao += "\n";
    }

    //imprime o numeros de vias cadastrada no erp
    for (int i = 0; i < modulo.imprimeVendaVias!; i++) {
      if (i < (modulo.imprimeVendaVias! - 1)) {
        impressao += "---------------------------- \n";
        impressao += "\n";
      }
      await Application
          .getInstance()
          .impressoraService
          .imprime(impressao);
    }
  }

  static Future imprimirDebitoCliente(ClienteConta conta,
      Cliente cliente) async {
    impressao = "";

    impressao += "WAYCHEF \n";
    impressao += "============================== \n";
    impressao +=
    "${DateTimeUtils.format(
        conta.dataLancamento, DateTimeUtils.dataHoraFormat)}\n";
    impressao += "=============================== \n";
    impressao += "${conta.tipoOperacao!.toUpperCase()} \n";
    impressao += "CONTA DO CLIENTE \n";
    impressao += " \n ";
    impressao += "Cliente :";
    impressao += "${cliente.pessoa!.nome}\n";
    impressao += " \n ";
    impressao += "Valor : ";
    impressao += " ${conta.valor!.toStringAsFixed(2)}\n";
    impressao += " \n ";
    impressao += "============================== \n";
    impressao +=
    "SALDO ATUAL DA CONTA :  ${conta.saldo!.toStringAsFixed(2)} \n";
    impressao += "============================== \n";
    for (var i = 0; i < 5; i++) {
      impressao += "\n";
    }

    await Application
        .getInstance()
        .impressoraService
        .imprime(impressao);
  }

  static Future imprimirExtratoCliente(DateTime dataInicial, DateTime dataFinal,
      ClienteExtratoDTO clienteExtratoDTO) async {
    impressao = "";
    impressao += "WAYCHEF \n";
    impressao += "============================== \n";
    impressao += "EXTRATO DO CLIENTE\n\n";
    impressao +=
    "PERIODO :${DateTimeUtils.format(dataInicial, DateTimeUtils.dataFormat)}  "
        "a  ${DateTimeUtils.format(dataFinal, DateTimeUtils.dataFormat)} \n";
    impressao +=
    "EMITIDO : ${DateTimeUtils.format(
        DateTime.now(), DateTimeUtils.dataHoraFormat)}\n";
    impressao += "CLIENTE : ${clienteExtratoDTO.cliente!.pessoa!.nome}\n\n";
    impressao += "";
    impressao += "=====================================\n";
    impressao += "DATA        TIPO        VALOR       SALDO\n";
    impressao += "=====================================\n";
    clienteExtratoDTO.contas.asMap().forEach((key, v) {
      impressao +=
      "${DateTimeUtils.format(v.dataLancamento, DateTimeUtils.dataFormat)}   ${v
          .tipoOperacao}       ${v.valor!.toStringAsFixed(2)}     ${v.saldo}\n";
    });
    impressao += "\n";
    impressao += "======================================\n";
    impressao += "SALDO ATUAL DA CONTA : ${clienteExtratoDTO.saldoFaturar}\n";
    impressao += "======================================\n";

    for (var i = 0; i < 5; i++)
      impressao += "\n";

    await Application
        .getInstance()
        .impressoraService
        .imprime(impressao);
  }

  static Future imprimirCreditoCliente(Operacao operacao) async {
    impressao = "";

    impressao += "WAYCHEF \n";
    impressao += "============================== \n";
    impressao +=
    "${DateTimeUtils.format(operacao.data, DateTimeUtils.dataHoraFormat)}\n";
    impressao += "============================== \n";
    impressao += "${operacao.tipo}\n\n";
    impressao += "${operacao.cliente!.pessoa!.nome}\n\n";
    impressao +=
    "${operacao.finalizadoras[0].finalizadoraEmpresa!.finalizadora!
        .descricao}  TOTAL  R\$ ${operacao.valor!.toStringAsFixed(2)}\n\n";
    impressao += "${operacao.historico}\n";
    impressao +=
    "LOJA: ${Application
        .getInstance()
        .empresa
        .numeroLoja}  CAIXA: ${Application
        .getInstance()
        .estacao!
        .numeroCaixa}  CONTROLE: ${operacao.id}\n";
    impressao +=
    "OPERADOR: ${Application
        .getInstance()
        .usuarioEmpresa!
        .usuario!
        .nome}\n";
    impressao += "============================== \n";
    impressao +=
    "SALDO ATUAL DA CONTA  :  ${operacao.clienteConta!.saldo!.toStringAsFixed(
        2)}\n";
    impressao += "============================== \n";
    impressao += "NAO E DOCUMENTO FISCAL \n";
    for (var i = 0; i < 5; i++) {
      impressao += "\n";
    }

    await Application
        .getInstance()
        .impressoraService
        .imprime(impressao);
  }

  static Future imprimirOperacao(Operacao operacao) async {
    impressao = "";

    impressao += "WAYCHEF \n";
    impressao += "============================== \n";
    impressao +=
    "${DateTimeUtils.format(operacao.data, DateTimeUtils.dataHoraFormat)}\n";
    impressao += "============================== \n";
    impressao += "${operacao.tipo}\n\n";
    impressao +=
    "${operacao.finalizadoras[0].finalizadoraEmpresa!.finalizadora!
        .descricao}  TOTAL  R\$ ${operacao.valor!.toStringAsFixed(2)}\n\n";
    impressao += "${operacao.historico}\n";
    impressao +=
    "LOJA: ${Application
        .getInstance()
        .empresa
        .numeroLoja}  CAIXA: ${Application
        .getInstance()
        .estacao!
        .numeroCaixa}  CONTROLE: ${operacao.id}\n";
    impressao +=
    "OPERADOR: ${Application
        .getInstance()
        .usuarioEmpresa!
        .usuario!
        .nome}\n";
    impressao += "============================== \n";
    impressao += "NAO E DOCUMENTO FISCAL \n";
    for (var i = 0; i < 5; i++) {
      impressao += "\n";
    }

    await Application
        .getInstance()
        .impressoraService
        .imprime(impressao);
  }

  static Future imprimirRecibo(Operacao operacao) async {
    impressao = "";

    impressao += "R E C I B O \n\n";
    impressao += "Recebi de ${operacao.favorecido}\n";
    impressao += "a importancia de ${operacao.valor!.toStringAsFixed(2)}\n";
    impressao +=
    "[${NumberUtils.valorPorExtenso(operacao.valor!.toDouble())
        .toUpperCase()}]\n\n";
    impressao += "Referente: ${operacao.historico}\n\n";
    impressao += "Por ser verdade, firmo o presente. \n\n";
    impressao +=
    "Data ${DateTimeUtils.format(
        operacao.data, DateTimeUtils.dataHoraFormat)}\n\n\n";
    impressao += "============================== \n";
    impressao += "${operacao.favorecido}\n";
    impressao += "============================== \n";
    impressao +=
    "LOJA: ${Application
        .getInstance()
        .empresa
        .numeroLoja}  CAIXA: ${Application
        .getInstance()
        .estacao!
        .numeroCaixa}  CONTROLE: ${operacao.id}\n";

    for (var i = 0; i < 5; i++) {
      impressao += "\n";
    }

    Timer(Duration(seconds: 2), () async {
      await Application
          .getInstance()
          .impressoraService
          .imprime(impressao);
    });
  }

  static Future imprimirResumoTurno(ConferenciaCaixaDTO cfDTO,
      BigDecimal totalDigitado, BigDecimal diferenca) async {
    impressao = "";

    var indice = 0;

    impressao += "WAYCHEF \n";
    impressao += "============================== \n";
    impressao += "Conferência de Caixa \n";
    impressao +=
    "Loja: ${(Application
        .getInstance()
        .empresa
        .numeroLoja ?? "")}\n";
    impressao +=
    "${DateTimeUtils.format(DateTime.now(), DateTimeUtils.dataHoraFormat)}\n";
    impressao += "Seq. Turno: ${cfDTO.turnoSimplificadoDTO!.sequenciaTurno}\n";
    impressao += "Operador: ${cfDTO.turnoSimplificadoDTO!.operador}\n";
    impressao +=
    "Abertura: ${DateTimeUtils.format(cfDTO.turnoSimplificadoDTO!.dataAbertura,
        DateTimeUtils.dataHoraFormat)}\n";

    if (cfDTO.turnoSimplificadoDTO!.dataEncerramento != null) {
      impressao +=
      "Encerramento: ${DateTimeUtils.format(
          cfDTO.turnoSimplificadoDTO!.dataEncerramento,
          DateTimeUtils.dataHoraFormat)}\n";
    }

    _ticketPendenciaFiscal(cfDTO.pendenciaEmissaoFiscal!);

    if (cfDTO.turnoSimplificadoDTO!.observacao != null &&
        cfDTO.turnoSimplificadoDTO!.observacao!.isNotEmpty) {
      impressao += "Obs: ${cfDTO.turnoSimplificadoDTO!.observacao}\n";
    }

    impressao += "\n";
    impressao += "============================== \n";
    impressao += "EXTRATO DO TURNO\n";
    impressao += "============================== \n";

    impressao += "(+)ENTRADAS\n";
    impressao += "------------------------------ \n";

    //=============================== ENTRADAS ===================================
    BigDecimal totalVendas = BigDecimal.ZERO();
    BigDecimal totalSuprimentos = BigDecimal.ZERO();
    BigDecimal totalRecebimentos = BigDecimal.ZERO();
    BigDecimal totalEntradas = BigDecimal.ZERO();

    for (var v in cfDTO.extratoTurnoDTO!.vendasPorFormaDePagamento) {
      totalVendas += v.total;
    }

    for (var element in cfDTO.extratoTurnoDTO!.suprimentos) {
      totalSuprimentos += element.valor;
    }

    for (var element in cfDTO.extratoTurnoDTO!.recebimentos) {
      totalRecebimentos += element.valor;
    }

    totalEntradas = totalVendas + totalSuprimentos + totalRecebimentos;

    //=============================== SAIDAS ===================================
    BigDecimal totalSangrias = BigDecimal.ZERO();
    BigDecimal totalSaidas = BigDecimal.ZERO();

    for (var s in cfDTO.extratoTurnoDTO!.sangrias) {
      totalSangrias += s.valor;
    }
    totalSaidas = totalSangrias;

    //============================================================================

    indice++;
    impressao += "$indice) Vendas\n";

    cfDTO.extratoTurnoDTO!.vendasPorFormaDePagamento.asMap().forEach((key, v) {
      impressao += "${v.descricao}   ${v.total!.toStringAsFixed(2)}\n";
    });

    impressao += "--------\n";
    impressao += "Total Vendas:   ${totalVendas.toStringAsFixed(2)}\n\n";

    indice++;
    impressao += "$indice) Suprimentos\n";

    cfDTO.extratoTurnoDTO!.suprimentos.asMap().forEach((key, value) {
      impressao += "${value.historico}   ${value.valor!.toStringAsFixed(2)}\n";
    });
    impressao += "--------\n";

    impressao +=
    "Total Suprimentos:   ${totalSuprimentos.toStringAsFixed(2)}\n";

    indice++;
    impressao += "\n";
    impressao += "$indice) Recebimentos\n";

    cfDTO.extratoTurnoDTO!.recebimentos.asMap().forEach((key, value) {
      impressao += "${value.favorecido}   ${value.valor!.toStringAsFixed(2)}\n";
    });

    impressao += "--------\n";
    impressao +=
    "Total Recebimentos:   ${totalRecebimentos.toStringAsFixed(2)}\n";

    impressao += "------------------------------ \n";

    impressao += "Total Entradas:   ${totalEntradas.toStringAsFixed(2)}\n";

    impressao += "\n";
    impressao += "(-)SAIDAS\n";
    impressao += "------------------------------ \n";

    indice++;

    impressao += "$indice) Sangrias\n";

    cfDTO.extratoTurnoDTO!.sangrias.asMap().forEach((key, value) {
      impressao += "${value.historico}   ${value.valor!.toStringAsFixed(2)}\n";
    });

    impressao += "--------\n";
    impressao += "Total Sangrias:   ${totalSangrias.toStringAsFixed(2)}\n";
    impressao += "------------------------------ \n";
    impressao += "Total Saídas:   ${totalSaidas.toStringAsFixed(2)}\n\n";

    impressao +=
    "(=) SALDO FINAL  ${(totalEntradas - totalSaidas).toStringAsFixed(2)}\n";

    if (cfDTO.desdobramentoVendaDTO != null) {
      impressao += "\n";
      impressao += "============================== \n";
      impressao += "DESDOBRAMENTO VALORES DE VENDA\n";
      impressao += "============================== \n";

      impressao +=
      "(+)VENDA BRUTA  ${(cfDTO.desdobramentoVendaDTO!.vendaBruta ??
          BigDecimal.ZERO()).toStringAsFixed(2)}\n";
      impressao += "\n";

      BigDecimal totalLiquido = BigDecimal.ZERO();
      totalLiquido += cfDTO.desdobramentoVendaDTO!.vendaBruta;

      //ACRESCIMNO
      BigDecimal totalAcrescimo = BigDecimal.ZERO();
      totalAcrescimo += totalAcrescimo
          .somar(cfDTO.desdobramentoVendaDTO!.acrescimo)
          .somar(cfDTO.desdobramentoVendaDTO!.taxaServico)
          .somar(cfDTO.desdobramentoVendaDTO!.taxaEntrega);

      totalLiquido += totalAcrescimo;

      impressao += "(+)ACRESCIMO\n";
      impressao +=
      " Manual  ${(cfDTO.desdobramentoVendaDTO!.acrescimo ?? BigDecimal.ZERO())
          .toStringAsFixed(2)}\n";
      impressao +=
      " Taxa Serviço  ${(cfDTO.desdobramentoVendaDTO!.taxaServico ??
          BigDecimal.ZERO()).toStringAsFixed(2)}\n";
      impressao +=
      " Taxa Entrega  ${(cfDTO.desdobramentoVendaDTO!.taxaEntrega ??
          BigDecimal.ZERO()).toStringAsFixed(2)}\n";
      impressao += "--------\n";
      impressao +=
      " Total Acrescimos:  ${totalAcrescimo.toStringAsFixed(2)}\n\n";

      //DESCONTO
      BigDecimal totalDesconto = BigDecimal.ZERO();
      totalDesconto = totalDesconto
          .somar(cfDTO.desdobramentoVendaDTO!.desconto)
          .somar(cfDTO.desdobramentoVendaDTO!.promocao)
          .somar(cfDTO.desdobramentoVendaDTO!.isencaoTaxaServico)
          .somar(cfDTO.desdobramentoVendaDTO!.isencaoTaxaEntrega);

      totalLiquido = totalLiquido - totalDesconto;

      impressao += "(-)DESCONTO\n";
      impressao +=
      " Manual  ${(cfDTO.desdobramentoVendaDTO!.desconto ?? BigDecimal.ZERO())
          .toStringAsFixed(2)}\n";
      impressao +=
      " Promoção  ${(cfDTO.desdobramentoVendaDTO!.promocao != null ? cfDTO
          .desdobramentoVendaDTO!.promocao : BigDecimal.ZERO())!
          .toStringAsFixed(2)}\n";
      impressao +=
      " Isenção Taxa Serviço  ${(cfDTO.desdobramentoVendaDTO!
          .isencaoTaxaServico != null ? cfDTO.desdobramentoVendaDTO!
          .isencaoTaxaServico : BigDecimal.ZERO())!.toStringAsFixed(2)}\n";
      impressao +=
      " Isenção Taxa Entrega  ${(cfDTO.desdobramentoVendaDTO!
          .isencaoTaxaEntrega != null ? cfDTO.desdobramentoVendaDTO!
          .isencaoTaxaEntrega : BigDecimal.ZERO())!.toStringAsFixed(2)}\n";
      impressao += "--------\n";
      impressao += " Total Descontos:  ${totalDesconto.toStringAsFixed(2)}\n\n";

      //DEDUCAO
      BigDecimal totalCancelamentos = BigDecimal.ZERO();
      cfDTO.vendasCanceladas
          .forEach((v) => totalCancelamentos += v.valorVenda);
      totalLiquido = totalLiquido - totalCancelamentos;

      impressao += "(-)DEDUÇÃO\n";
      impressao += " Cancelamentos  ${totalCancelamentos.toStringAsFixed(2)}\n";
      impressao += "--------\n";
      impressao +=
      " Total Deduções:  ${totalCancelamentos.toStringAsFixed(2)}\n\n";

      impressao +=
      "(=)TOTAL LIQUIDO DE VENDAS  ${totalLiquido.toStringAsFixed(2)}\n";
    }

    if (cfDTO.desdobramentoGrupoProdutosDTOList.length > 0) {
      impressao += "\n";
      impressao += "============================== \n";
      impressao += "DESDOBRAMENTO POR ITENS/GRUPO\n";
      impressao += "============================== \n";

      for (int i = 0;
      i < cfDTO.desdobramentoGrupoProdutosDTOList.length;
      i++) {
        DesdobramentoGrupoProdutosDTO dv =
        cfDTO.desdobramentoGrupoProdutosDTOList[i];

        impressao += "\n";
        impressao += "GRUPO:  ${dv.descricaoGrupo}\n";

        for (DesdobramentoProdutoDTO dp in dv.desdobramentoProdutoDTOList) {
          impressao += "PRODUTO  ${dp.descricao}\n";
          impressao += "QTDE ${dp.quantidadeVendida}" +
              " | " +
              "VALOR ${dp.valorVendido!.toStringAsFixed(2)}\n";
        }

        impressao += "\n";
        impressao += "SUBTOTAL:  ${dv.valorVendido!.toStringAsFixed(2)}\n";
        impressao += "TICKET MEDIO:  ${dv.ticketMedio!.toStringAsFixed(2)}\n";

        if (i < (cfDTO.desdobramentoGrupoProdutosDTOList.length - 1))
          impressao += "--------\n";
      }
    }
    if (cfDTO.pacotesVendidos.length > 0) {
      impressao += "\n";
      impressao += "VENDA DE COMBOS/CESTAS PRODUTOS\n";

      for (DesdobramentoProdutoDTO dp in cfDTO.pacotesVendidos) {
        impressao += "PRODUTO  ${dp.descricao}\n";
        impressao += "QTDE  ${dp.quantidadeVendida!.toStringAsFixed(2)}\n";
      }
    }

    if (cfDTO.taxaServicoGracomDTOList.length > 0) {
      impressao += "\n";
      impressao += "============================== \n";
      impressao += "DESDOBRAMENTO POR GARÇOM\n";
      impressao += "============================== \n";

      impressao += "GARÇONS\n-------\n";
      impressao += "Codigo   Nome\n";

      cfDTO.taxaServicoGracomDTOList.asMap().forEach((key, ds) {
        impressao +=
        "[${(ds.codigo != null) ? ds.codigo : ""}]   ${ds.nome!
            .toUpperCase()}\n";
      });

      impressao += "VENDAS POR GARÇONS\n";
      impressao += "Garçom   BC        Serviço  \n";
      cfDTO.taxaServicoGracomDTOList.asMap().forEach((key, ds) {
        impressao +=
        "[${(ds.codigo != null) ? ds.codigo : ""}]   ${ds
            .valorBaseCalculo}   ${ds.taxaServico}  -   \n";

        if (key < cfDTO.taxaServicoGracomDTOList.length - 1) impressao += "\n";
      });
    } else {
      impressao += "Nenhum garçom incluso nas vendas\n";
    }

      if (cfDTO.vendasModuloDTOList.length > 0) {
        impressao += "\n";
        impressao += "============================== \n";
        impressao += "DESDOBRAMENTO POR MODULO\n";
        impressao += "============================== \n";
        impressao += "MÓDULOS\n-------\n";
        impressao += "Nome   Tx. Serviço   \n";
        cfDTO.vendasModuloDTOList.forEach((vd) {
          impressao +=
          "[${vd.tipoModulo}]   ${vd.valorServico!.toStringAsFixed(2)}\n";
        });
        impressao += "\n";
        impressao += "VENDAS POR MÓDULO\n-----\n";
        impressao += "Módulo   Produto   Serviço   Total   %   \n";
        impressao += "------------------------------ \n";
        cfDTO.vendasModuloDTOList.forEach((vd) {
          impressao +=
          "[${vd.tipoModulo}]   ${vd.vendasProdutos}   ${vd.valorServico!
              .toStringAsFixed(2)}   ${(vd.vendasProdutos! + vd.valorServico)
              .toStringAsFixed(2)}   -   \n";
        });
      }


    _ticketPendenciaFiscal(cfDTO.pendenciaEmissaoFiscal!);

    impressao += "\n";
    impressao += "============================== \n";
    impressao += "RESUMO\n";
    impressao += "============================== \n";

    impressao += "CONTAGEM DO SISTEMA: \n";

    int qtdeAtendimentos = cfDTO.vendas.length;

    int qtdeCancelamentos = cfDTO.vendasCanceladas.length;

    BigDecimal ticketMedio = BigDecimal.ZERO();
    if (totalVendas > BigDecimal.ZERO())
      ticketMedio = totalVendas / BigDecimal(qtdeAtendimentos.toString());

    impressao += "Qtde. Atendimentos:  $qtdeAtendimentos\n";

    impressao += "Qtde. Cancelamentos:  $qtdeCancelamentos\n";

    impressao += "Ticket Médio:  ${ticketMedio.toStringAsFixed(2)}\n\n";

    cfDTO.extratoTurnoDTO!.fechamentos.forEach((f) {
      impressao +=
      "${f.finalizadora}:  ${(f.valorApurado!.toStringAsFixed(2))}\n";
    });

    impressao += "Saldo:  ${(cfDTO.saldo!.toStringAsFixed(2))}\n";
    impressao += "------------------------------ \n";
    impressao += "INFORMADO PELO OPERADOR:\n";

    cfDTO.extratoTurnoDTO!.fechamentos.forEach((tf) {
      impressao +=
      "${tf.finalizadora}:  ${tf.valorDigitado!.toStringAsFixed(2)}\n";
    });

    impressao += "\n";
    impressao += "Total Digitado:  ${totalDigitado.toStringAsFixed(2)}\n";

    impressao += "------------------------------ \n";

    impressao += "CONCILIAÇÃO: \n";
    impressao += "Diferença:  ${diferenca.toStringAsFixed(2)}\n";
    impressao += "============================== \n";

    for (var i = 0; i < 5; i++)
      impressao += "\n";

    await Application
        .getInstance()
        .impressoraService
        .imprime(impressao);
  }

  static Future imprimirSuspensaoBalcao(Nota nota, List<NotaItem> itens,
      Modulo modulo) async {
    impressao = "";

    _ticketCabecalho("Suspenso", nota);
    impressao += "\n";
    _ticketItens(nota, modulo, itens);
    _ticketTotais(nota, modulo);
    impressao += "\n\n";
    _ticketRodape(modulo, nota);

    for (var i = 0; i < 5; i++)
      impressao += "\n";

    await Application
        .getInstance()
        .impressoraService
        .imprime(impressao);
  }

  static Future imprimirTransferencia(List<NotaItem> notaItens, Nota nota,
      String transferidoPara, Modulo modulo, String moduloSelecionado) async {
    impressao = "";

    _ticketCabecalho("Transferencia", nota);

    impressao += "De: ${nota.consumo!.modulo} ${nota.consumo!.comanda} \n";
    impressao += "Para: ${moduloSelecionado} $transferidoPara \n";
    impressao += "============================== \n";

    impressao += "\n\n";

    impressao += "Itens transferidos\n";
    int quant = 0;
    for (NotaItem item in notaItens) {
      quant++;
      impressao += "${item.quantidade}x ${item.descricao} \n";
      if (quant < notaItens.length) impressao += "-------\n";
    }

    impressao += "\n\n";

    _ticketRodape(modulo, nota);

    for (var i = 0; i < 5; i++)
      impressao += "\n";

    debugPrint(impressao);

    await Application
        .getInstance()
        .impressoraService
        .imprime(impressao);
  }

  static Future comprovanteFechamentoTurno(ConferenciaCaixaDTO cfDTO,
      BigDecimal totalDigitado, bool espacoEntreImpressoes) async {
    impressao = "";

    if (espacoEntreImpressoes) for (var i = 0; i < 5; i++)
      impressao += "\n";

    var indice = 0;

    impressao += "WAYCHEF \n";
    impressao += "============================== \n";
    impressao += "Comprovante de Caixa \n";
    impressao +=
        "Loja: ${(Application
            .getInstance()
            .empresa
            .numeroLoja != null ? Application
            .getInstance()
            .empresa
            .numeroLoja : "")}" +
            " - " +
            "${DateTimeUtils.format(
                DateTime.now(), DateTimeUtils.dataHoraFormat)}\n\n";
    impressao += "Seq. Turno: ${cfDTO.turnoSimplificadoDTO!.sequenciaTurno}\n";
    impressao += "Operador: ${cfDTO.turnoSimplificadoDTO!.operador}\n";
    impressao +=
    "Abertura: ${DateTimeUtils.format(cfDTO.turnoSimplificadoDTO!.dataAbertura,
        DateTimeUtils.dataHoraFormat)}\n";

    if (cfDTO.turnoSimplificadoDTO!.dataEncerramento != null)
      impressao +=
      "Encerramento: ${DateTimeUtils.format(
          cfDTO.turnoSimplificadoDTO!.dataEncerramento,
          DateTimeUtils.dataHoraFormat)}\n";

    _ticketPendenciaFiscal(cfDTO.pendenciaEmissaoFiscal!);

    if (cfDTO.turnoSimplificadoDTO!.observacao != null &&
        cfDTO.turnoSimplificadoDTO!.observacao!.isNotEmpty)
      impressao += "Obs: ${cfDTO.turnoSimplificadoDTO!.observacao}\n";

    impressao += "============================== \n";
    impressao += "EXTRATO DO TURNO\n";
    impressao += "============================== \n";

    impressao += "(+)ENTRADAS\n";
    impressao += "------------------------------ \n";

    indice++;
    impressao += "$indice) Suprimentos\n\n";

    cfDTO.extratoTurnoDTO!.suprimentos.forEach((element) =>
    impressao +=
    "${element.historico}   ${element.valor!.toStringAsFixed(2)}\n");

    impressao += "\n\n";
    impressao += "(-)SAIDAS\n";
    impressao += "------------------------------ \n";

    impressao += "$indice) Sangrias\n\n";

    cfDTO.extratoTurnoDTO!.sangrias.forEach((element) {
      impressao +=
      "${element.historico}   ${element.valor!.toStringAsFixed(2)}\n";
    });

    _ticketPendenciaFiscal(cfDTO.pendenciaEmissaoFiscal!);

    impressao += "\n";
    impressao += "------------------------------ \n";
    impressao += "CONTAGEM DO SISTEMA: \n";
    impressao += "\n";

    cfDTO.extratoTurnoDTO!.fechamentos.forEach((f) {
      impressao += "${f.finalizadora}:  (____)\n";
    });

    impressao += "\n";
    impressao += "Saldo:  (____)\n";
    impressao += "------------------------------ \n";
    impressao += "INFORMADO PELO OPERADOR:\n\n";

    cfDTO.extratoTurnoDTO!.fechamentos.forEach((tf) {
      impressao +=
      "${tf.finalizadora}:  ${tf.valorDigitado!.toStringAsFixed(2)}\n";
    });

    impressao += "Total Digitado:  ${totalDigitado.toStringAsFixed(2)}\n";

    impressao += "------------------------------ \n";
    impressao += "CONCILIAÇÃO: \n";
    impressao += "Diferença:  (______)\n";
    impressao += "============================== \n";

    impressao += "\n\n";
    impressao += "__________________________\n";
    impressao += "Assinatura do responsavel.\n";

    for (var i = 0; i < 5; i++)
      impressao += "\n";

    await Application
        .getInstance()
        .impressoraService
        .imprime(impressao);
  }

  static void _ticketPendenciaFiscal(int pendenciaEmissaoFiscal) {
    if (pendenciaEmissaoFiscal > 0) {
      String msg = (pendenciaEmissaoFiscal > 1)
          ? "Você possui um total de\n" +
          "$pendenciaEmissaoFiscal pendências fiscais que\n" +
          "precisam ser resolvidas\n" +
          "com a maxima urgencia\n"
          : "Você possui um total de\n" +
          "$pendenciaEmissaoFiscal pendência fiscal que\n" +
          "precisa ser resolvida\n" +
          "com a maxima urgencia\n";

      impressao += "\n";
      impressao += "============================== \n";
      impressao += "ATENÇÃO\n";
      impressao += "============================== \n";
      impressao += msg;
      impressao += "============================== \n";
    }
  }

  static void _ticketCabecalho(String descricao, Nota nota) {
    impressao += "WAYCHEF \n";
    impressao += "============================== \n";
    impressao += "${_application!.empresa.pessoa!.nome} \n";
    impressao += "============================== \n";
    impressao += "$descricao \n\n";

    if (nota.numero != null) impressao += "Controle: ${nota.numero} \n";

    impressao += "${nota.consumo!.modulo}: ${nota.consumo!.comanda} \n";

    if (nota.consumo!.modulo == "DELIVERY") {
      if (nota.idEntregador != null) {
        Funcionario entregador = _application!.entregador
            .firstWhere((e) => e.id == nota.idEntregador,
            orElse: () => Funcionario());
        if (entregador.id != null)
          impressao += "Entregador: ${entregador.pessoa!.nome}\n";
      }
      if (nota.cliente != null) {
        impressao += "Cliente: ${nota.cliente!.pessoa!.nome}   ";
      }
    }

    impressao +=
    "${DateTimeUtils.format(
        nota.dataEmissao, DateTimeUtils.dataHoraFullFormat)} \n";

    if (nota.motivoCancelamento != null && nota.motivoCancelamento!.isNotEmpty)
      impressao += "Motivo: ${nota.motivoCancelamento} \n";

    impressao += "============================== \n";
  }

  static void _ticketItens(Nota nota, Modulo modulo, List<NotaItem> itens) {
    qtdeTotalItens = BigDecimal.ZERO();

    if (modulo.ticketReduzido!)
      impressao += "DESCRICAO    QTDE    TOTAL R\$ \n";
    else
      impressao += "DESC    QTDE    UNIT    TOTAL R\$ \n";

    impressao += "============================== \n";

    switch (modulo.ticketConsumo) {
      case "AGRUPAR":
        List<NotaItem> itemList = [];
        itens.forEach((i) {
          if (i.tipo != "GORJETA") _percorreNotaItemAgrupado(i, itemList);
        });

        var groupByPreco = Map<BigDecimal?, List<NotaItem>>();
        itemList.forEach((nt) {
          var preco = nt.precoUnitario;
          if (groupByPreco.containsKey(preco))
            groupByPreco[preco]!.add(nt);
          else
            groupByPreco[preco] = [nt];
        });

        var notaItemPorProdutoEPreco =
        Map<int?, Map<BigDecimal?, List<NotaItem>>>();

        groupByPreco.forEach((preco, itens) {
          itens.forEach((item) {
            var idProduto = Application.getInstance().produtos[item.idProdutoEmpresa]!.produto!.id;

            if (notaItemPorProdutoEPreco.containsKey(idProduto)) {
              if (notaItemPorProdutoEPreco[idProduto]!.containsKey(preco)) {
                notaItemPorProdutoEPreco[idProduto]![preco]!.add(item);
              } else {
                notaItemPorProdutoEPreco[idProduto]![preco] = [item];
              }
            } else {
              notaItemPorProdutoEPreco[idProduto] = {
                preco: [item]
              };
            }
          });
        });

        notaItemPorProdutoEPreco.forEach((idProduto, itemPorPreco) {
          itemPorPreco.forEach((precoUnitario, notaItens) {
            var notaItem = notaItens[0];
            notaItem.precoTotal = notaItens
                .map((n) => n.precoTotal)
                .reduce((value, element) => value! + element);
            notaItem.quantidade = notaItens
                .map((n) => n.quantidade)
                .reduce((value, element) => value! + element);
            notaItem.valorDesconto = notaItens
                .map((n) => n.valorDesconto)
                .reduce((value, element) => value! + element);
            notaItem.valorDescontoPromocao = notaItens
                .map((n) => n.valorDescontoPromocao)
                .reduce((value, element) => value! + element);
            qtdeTotalItens += notaItem.quantidade;

            String quantidade;
            if (notaItem.quantidade!.toDouble() != notaItem.quantidade!.toInt())
              quantidade = notaItem.quantidade!.toDouble().toString();
            else
              quantidade = notaItem.quantidade!.toInt().toString();

            if (modulo.ticketReduzido!) {
              impressao +=
              "${notaItem.descricao}   $quantidade   ${notaItem.precoTotal!
                  .toStringAsFixed(2)} \n";
            } else {
              impressao +=
                  "${notaItem.descricao}   $quantidade X  ${Application.getInstance().produtos[notaItem
                      .idProdutoEmpresa]!.produto!.unidade}  " +
                      "${notaItem.precoUnitario!.toStringAsFixed(2)}  " +
                      "${notaItem.precoTotal!.toStringAsFixed(2)} \n";
            }

            BigDecimal descontoTotal =
                notaItem.valorDesconto! + notaItem.valorDescontoPromocao;
            if (descontoTotal != BigDecimal.ZERO())
              impressao +=
              "Desconto item:   - ${descontoTotal.toStringAsFixed(2)} \n";
          });
        });

        break;

      case "INDIVIDUAL":
        itens.forEach((nt) {
          if (nt.tipo != "GORJETA") _percorreNotaItemIndividual(nt, modulo);
        });
        break;
    }

    impressao += "------------------------------ \n";
    impressao +=
    "${qtdeTotalItens.toDouble() == qtdeTotalItens.toInt()
        ? "QTDE: (${qtdeTotalItens.toInt()})"
        : ""} \n\n";
  }

  static void _percorreNotaItemAgrupado(NotaItem notaItem,
      List<NotaItem> itemList) {
    if (!notaItem.cancelado && notaItem.indice != null) itemList.add(notaItem);

    if (notaItem.subitens.isNotEmpty)
      notaItem.subitens.forEach((s) => _percorreNotaItemAgrupado(s, itemList));
  }

  static void _percorreNotaItemIndividual(NotaItem notaItem, Modulo modulo) {
    if (!notaItem.cancelado && notaItem.indice != null) {
      qtdeTotalItens += notaItem.quantidade;
      String quantidade;

      if (notaItem.quantidade!.toDouble() != notaItem.quantidade!.toInt()) {
        quantidade = notaItem.quantidade!.toDouble().toString();
      } else {
        quantidade = notaItem.quantidade!.toInt().toString();
      }

      if (modulo.ticketReduzido!) {
        impressao +=
        "${notaItem.descricao}   $quantidade   ${notaItem.precoTotal!
            .toStringAsFixed(2)} \n";
      } else {
        impressao +=
            "${notaItem.descricao}   $quantidade X  ${Application.getInstance().produtos[notaItem.idProdutoEmpresa]!
                .produto!.unidade}  " +
                "${notaItem.precoUnitario!.toStringAsFixed(2)}  " +
                "${notaItem.precoTotal!.toStringAsFixed(2)} \n";
      }

      BigDecimal descontoTotal =
          notaItem.valorDesconto! + notaItem.valorDescontoPromocao;
      if (descontoTotal != BigDecimal.ZERO())
        impressao +=
        "Desconto item:   - ${descontoTotal.toStringAsFixed(2)} \n";
    }

    if (notaItem.subitens.isNotEmpty)
      notaItem.subitens.forEach((s) => _percorreNotaItemIndividual(s, modulo));
  }

  static void _ticketTotais(Nota nota, Modulo modulo) {
    bool linha = false;
    bool imprimiuSubtotal = false;

    if (nota.valorTotalServico != BigDecimal.ZERO()) {
      impressao += "SubTotal:  ${nota.valorSubTotal!.toStringAsFixed(2)} \n";
      imprimiuSubtotal = true;

      impressao +=
          "${modulo.denominacaoServico == null ||
              modulo.denominacaoServico!.isEmpty ? "Tx. Servico: " : modulo
              .denominacaoServico}" +
              ":  ${nota.valorTotalServico!.toStringAsFixed(2)} \n";

      linha = true;
    }

    if (modulo.tipo == "DELIVERY") {
      impressao += "Subtotal: ${nota.valorSubTotal!.toStringAsFixed(2)} \n";
      imprimiuSubtotal = true;

      if (nota.consumo!.tipoEntrega == "COMUM")
        impressao += "Tx Entrega: ${nota.valorFrete!.toStringAsFixed(2)} \n";

      linha = true;
    }

    if (nota.valorDesconto != BigDecimal.ZERO()) {
      if (!imprimiuSubtotal) {
        impressao += "Subtotal: ${nota.valorSubTotal!.toStringAsFixed(2)} \n";
        imprimiuSubtotal = true;
      }

      impressao += "Desconto: ${nota.valorDesconto!.toStringAsFixed(2)} \n";
      linha = true;
    }

    if (nota.valorAcrescimo != BigDecimal.ZERO()) {
      if (!imprimiuSubtotal) {
        impressao += "Subtotal: ${nota.valorSubTotal!.toStringAsFixed(2)} \n";
        imprimiuSubtotal = true;
      }

      impressao += "Acréscimo: ${nota.valorAcrescimo!.toStringAsFixed(2)} \n";
      linha = true;
    }

    if (linha) impressao += "------------------------------ \n";

    impressao += "Total R\$:  ${nota.valorTotal!.toStringAsFixed(2)} \n";

    if (nota.finalizadoras.isNotEmpty) {
      BigDecimal? totalPago;
      totalPago = nota.finalizadoras
          .map((f) => f.valor)
          .reduce((value, element) => value! + element);
      BigDecimal faltaPagar;
      faltaPagar = nota.valorTotal!.subtrair(totalPago);

      impressao += "Pago R\$:  ${totalPago!.toStringAsFixed(2)} \n";

      if (faltaPagar > BigDecimal.ZERO()) {
        impressao += "Falta R\$:  ${faltaPagar.toStringAsFixed(2)} \n";
      }

      BigDecimal? troco = nota.finalizadoras
          .map((f) => f.troco != null ? f.troco : BigDecimal.ZERO())
          .reduce((value, element) => value! + element);

      if (troco != BigDecimal.ZERO())
        impressao += "Troco: R\$:  ${troco!.toStringAsFixed(2)} \n";

      impressao += "\nFormas de pagamento:\n";
      nota.finalizadoras.forEach((f) {
        impressao +=
        "${f.finalizadoraEmpresa!.finalizadora!.descricao}   ${f.valor!
            .toStringAsFixed(2)} \n";
      });
    }
  }

  static void _ticketJuntados(Nota nota) {
    if (nota.consumo!.consumosJuntados.isNotEmpty) {
      impressao += "------------------------------ \n";
      impressao += "Fichas juntadas: \n";
      nota.consumo!.consumosJuntados.forEach((cj) {
        impressao += "${cj.comanda} \n";
      });
      impressao += "------------------------------ \n";
    }
  }

  static void _ticketRodape(Modulo modulo, Nota nota) {
    impressao += "\n";
    var numeroLoja = _application!.empresa.numeroLoja;
    impressao +=
    "${numeroLoja != null ? "LOJA: $numeroLoja" : ""} | CAIXA: ${_application!
        .estacao!.numeroCaixa} \n";

    if (_application!.usuarioEmpresa != null)
      impressao +=
      "OPERADOR: ${_application!.usuarioEmpresa!.usuario!.nome} \n";

    impressao +=
    "${DateTimeUtils.format(
        DateTime.now(), DateTimeUtils.dataHoraFullFormat)} \n";
    impressao += "============================== \n";
    impressao += "NAO E DOCUMENTO FISCAL \n\n";

    if (_application!.empresa.venda!.mensagemRodape != null)
      impressao += "${_application!.empresa.venda!.mensagemRodape} \n\n";

    if (nota.consumo!.senhaAtendimento != null &&
        nota.consumo!.senhaAtendimento!.isNotEmpty) {
      impressao += "************************\n";
      impressao += "ATENDIMENTO\n";
      impressao += "${nota.consumo!.senhaAtendimento}\n";
      impressao += "************************\n";
    }

    for (var i = 0; i < 5; i++)
      impressao += "\n";
  }

  static void erroImprimir(BuildContext context, error,
      Function onTentarNovamente) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) =>
            ConfirmationDialog(
              showCancelButton: true,
              title: "Erro Impressão",
              message: "Falha ao imprimir. \n\n${error.toString()}",
              txtConfirmar: "Repetir",
              onConfirm: () {
                onTentarNovamente();
              },
            ));
  }

  // ======================================= DELIVERY ==========================

  static Future imprimirRomaneioDelivery(Nota nota, List<NotaItem> itens,
      Funcionario entregador, Modulo modulo) async {
    impressao = "";
    impressao += "WAYCHEF \n";
    impressao += "============================== \n\n";
    impressao += "Romaneio \n\n";
    impressao += "Entrega de pedidos \n";
    impressao +=
    "${DateTimeUtils.format(DateTime.now(), DateTimeUtils.dataHoraFormat)}\n\n";
    impressao += "Entregador: ${entregador.pessoa!.nome} \n";
    impressao += "============================== \n";
    impressao += "Resumo do carregamento \n";
    impressao += "============================== \n\n";

    impressao += "DESC    QTDE\n";
    for (NotaItem item in itens) {
      percorreNotaItemDelivery(item, modulo);
    }
    impressao += "============================== \n\n";

    for (var i = 0; i < 5; i++)
      impressao += "\n";

    await Application
        .getInstance()
        .impressoraService
        .imprime(impressao);
  }

  static void _dadosEntregaDelivery(Nota nota) {
    impressao += "============================== \n";
    impressao += "Dados para entrega: \n\n";

    impressao += "${nota.cliente!.pessoa!.nome} \n";
    impressao +=
        "Logradouro: ${nota.endereco!.logradouro}, ${nota.endereco!.numero}" +
            "${nota.endereco!.complemento != null ? ", ${nota.endereco!
                .complemento}" : ""}, \n";
    if (nota.endereco!.bairro != null && nota.endereco!.bairro!.isNotEmpty)
      impressao +=
      "Bairro: ${nota.endereco!.bairro != null
          ? nota.endereco!.bairro
          : " "}, \n";
    if (nota.endereco!.pontoReferencia != null &&
        nota.endereco!.pontoReferencia!.isNotEmpty)
      impressao +=
      "Ponto de referência: ${nota.endereco!.pontoReferencia != null ? nota
          .endereco!.pontoReferencia : " "}, \n";
    if (nota.endereco!.cidade!.nome != null &&
        nota.endereco!.cidade!.nome!.isNotEmpty)
      impressao += "Cidade: ${nota.endereco!.cidade!.nome}\n";

    if (nota.cliente!.pessoa!.getTelefonePadrao != null)
      impressao +=
      "Fone: ${nota.cliente!.pessoa!.getTelefonePadrao!.telefone} \n";

    impressao += "============================== \n";
  }

  static String _observacaoPedido(Nota nota) {
    String retorno = "";

    if (nota.consumo!.observacao != null &&
        nota.consumo!.observacao!.isNotEmpty) {
      retorno += "\n\n Obs: " + nota.consumo!.observacao! + "\n";
    }
    return retorno;
  }

  static void percorreNotaItemDelivery(NotaItem notaItem, Modulo modulo) {
    if (!notaItem.cancelado && notaItem.indice != null) {
      qtdeTotalItens += notaItem.quantidade;
      String quantidade;

      if (notaItem.quantidade!.toDouble() != notaItem.quantidade!.toInt())
        quantidade = notaItem.quantidade!.toDouble().toString();
      else
        quantidade = notaItem.quantidade!.toInt().toString();

      if (modulo.ticketReduzido!) {
        impressao += "${notaItem.descricao}   $quantidade   \n";
      } else {
        impressao +=
        "${notaItem.descricao}   $quantidade X  ${Application.getInstance().produtos[notaItem.idProdutoEmpresa]!
            .produto!.unidade}  \n";
      }

      if (notaItem.subitens.isNotEmpty)
        notaItem.subitens
            .forEach((s) => _percorreNotaItemIndividual(s, modulo));
    }
  }


  //  Impressão auto atendimento

  static Future<void> imprimeTicketConsumo(
      PrinterVendaDTO dto, List<NotaItem> itens) async {
    impressao = "";

    impressao += "----------------------------------------" + "\n";

    impressao += "AUTOATENDIMENTO: " +
        dto.dtoNota!.nota!.consumo!.comanda.toString() +
        "\n";

    if (dto.dtoNota!.nota!.consumo!.senhaAtendimento != null)
      impressao += "SENHA: " +
          dto.dtoNota!.nota!.consumo!.senhaAtendimento.toString() +
          "\n";

    impressao += "\n" + dto.dtoNota!.nota!.consumo!.observacao! + "\n\n";

    impressao +=
        "${DateTimeUtils.format(dto.dtoNota!.nota!.dataEmissao, DateTimeUtils.dataHoraFullFormat)} \n\n";
    impressao += "Total de itens: " +
        itens
            .map((n) => n.quantidade)
            .reduce((value, element) => value! + element)
            .toString();
    impressao += "\n\n";
    for (NotaItem notaItem in itens) {
      impressao += "Qtde: " + notaItem.quantidade!.toString() + "\n";
      impressao += notaItem.descricao! + "\n";
      if (notaItem.subitens.isNotEmpty) {
        List<NotaItem> subitens = [];
        notaItem.subitens.forEach((n) {
          _percorreNotaItem(n, subitens);
        });
        for (NotaItem subitem in subitens) {
          if (subitem.quantidade!.compareTo(BigDecimal.ZERO()) > 0) {
            impressao += "  > " +
                subitem.quantidade.toString() +
                "x " +
                subitem.descricao! +
                "\n";
          } else {
            impressao += "  >   " + subitem.descricao! + "\n";
          }
        }
      }
      impressao += "\n";
    }
    impressao += "\n";
    impressao +=
        "|Autoatendimento " + Clients.AUTOATENDIMENTO.versao + "|" + "\n";

    impressao += "\n";
    impressao += "---------------------------- \n";
    impressao += "\n";

    await Application.getInstance().impressoraService.imprime(impressao);
  }

  static Future<void> imprimirTicketVenda(
      PrinterVendaDTO dto, List<NotaItem> itens) async {
     impressao = "";

    imprimeTicketCabecalho("Pagamento", dto.dtoNota!.nota!);
    _imprimeTicketItens(dto.dtoNota!.nota!, dto.servicoAutoAtendimento!, itens);
    _imprimeTicketTotais(dto.dtoNota!.nota!);
    String senha = dto.dtoNota!.nota!.consumo!.senhaAtendimento == null
        ? dto.dtoNota!.nota!.consumo!.comanda.toString()
        : dto.dtoNota!.nota!.consumo!.senhaAtendimento!;
    _imprimeTicketRodape(senha);

    await Application.getInstance().impressoraService.imprime(impressao);
  }

  static void imprimeTicketCabecalho(String descricao, Nota nota) {
  impressao += "Waychef Autoatendimento" + "\n";
  impressao += "========================================" + "\n";
  impressao += descricao + "\n\n";
  if (nota.numero != null)
  impressao += "Controle: " + nota.numero.toString() + "\n";
  impressao += nota.consumo!.modulo.toString() + ": " + nota.consumo!.comanda.toString()
  + " 	" +  "${DateTimeUtils.format(nota.dataEmissao, DateTimeUtils.dataFormat)}"
  + " " + "${DateTimeUtils.format(nota.dataEmissao, DateTimeUtils.dataHora)}" + "\n";
  if (nota.motivoCancelamento != null && nota.motivoCancelamento!.isNotEmpty)
  impressao += "Motivo: " + nota.motivoCancelamento! + "\n";
  impressao += "========================================" + "\n";
  }

  static void _imprimeTicketItens(Nota nota, ServicoAutoAtendimento modulo, List<NotaItem> itens) {
    qtdeTotalItens = BigDecimal.ZERO();

    impressao += "DESCRICAO ITEM" +  " VR.UNIT " + " VR.TOTAL " + "\n";
    impressao += "============================== \n";

    switch (modulo.ticketConsumo.name) {
      case "AGRUPAR":
        List<NotaItem> itemList = [];
        itens.forEach((i) {
          if (i.tipo != "GORJETA") _percorreNotaItem(i, itemList);
        });

        var groupByPreco = Map<BigDecimal?, List<NotaItem>>();
        itemList.forEach((nt) {
          var preco = nt.precoUnitario;
          if (groupByPreco.containsKey(preco))
            groupByPreco[preco]!.add(nt);
          else
            groupByPreco[preco] = [nt];
        });

        var notaItemPorProdutoEPreco =
        Map<int?, Map<BigDecimal?, List<NotaItem>>>();

        groupByPreco.forEach((preco, itens) {
          itens.forEach((item) {
            var idProduto = Application.getInstance().produtos[item.idProdutoEmpresa]!.produto!.id;

            if (notaItemPorProdutoEPreco.containsKey(idProduto)) {
              if (notaItemPorProdutoEPreco[idProduto]!.containsKey(preco)) {
                notaItemPorProdutoEPreco[idProduto]![preco]!.add(item);
              } else {
                notaItemPorProdutoEPreco[idProduto]![preco] = [item];
              }
            } else {
              notaItemPorProdutoEPreco[idProduto] = {
                preco: [item]
              };
            }
          });
        });

        notaItemPorProdutoEPreco.forEach((idProduto, itemPorPreco) {
          itemPorPreco.forEach((precoUnitario, notaItens) {
            var notaItem = notaItens[0];
            notaItem.precoTotal = notaItens
                .map((n) => n.precoTotal)
                .reduce((value, element) => value! + element);
            notaItem.quantidade = notaItens
                .map((n) => n.quantidade)
                .reduce((value, element) => value! + element);
            notaItem.valorDesconto = notaItens
                .map((n) => n.valorDesconto)
                .reduce((value, element) => value! + element);
            notaItem.valorDescontoPromocao = notaItens
                .map((n) => n.valorDescontoPromocao)
                .reduce((value, element) => value! + element);
            qtdeTotalItens += notaItem.quantidade;

            String quantidade;
            if (notaItem.quantidade!.toDouble() != notaItem.quantidade!.toInt())
              quantidade = notaItem.quantidade!.toDouble().toString();
            else
              quantidade = notaItem.quantidade!.toInt().toString();


            impressao +=
                "${notaItem.descricao}   $quantidade X  ${Application.getInstance().produtos[notaItem
                    .idProdutoEmpresa]!.produto!.unidade}  " +
                    "${notaItem.precoUnitario!.toStringAsFixed(2)}  " +
                    "${notaItem.precoTotal!.toStringAsFixed(2)} \n";


            BigDecimal descontoTotal =
                notaItem.valorDesconto! + notaItem.valorDescontoPromocao;
            if (descontoTotal != BigDecimal.ZERO())
              impressao +=
              "Desconto item:   - ${descontoTotal.toStringAsFixed(2)} \n";
          });
        });

        break;

      case "INDIVIDUAL":
        itens.forEach((nt) {
          if (nt.tipo != "GORJETA") _percorreIndividualNotaItem(nt);
        });
        break;

      case "AGRUPAR_INDIVIDUAL":
        itens.forEach((nt) {
          if (nt.tipo != "GORJETA") _percorreIndividualNotaItem(nt);
        });
        break;

    }

    impressao += "------------------------------ \n";
    impressao +=
    "${qtdeTotalItens.toDouble() == qtdeTotalItens.toInt()
        ? "QTDE: (${qtdeTotalItens.toInt()})"
        : ""} \n\n";
  }

  static void _imprimeTicketTotais(Nota nota) {
    bool linha = false;
    bool imprimiuSubtotal = false;


    if (nota.valorDesconto != BigDecimal.ZERO()) {
      if (!imprimiuSubtotal) {
        impressao += "Subtotal: ${nota.valorSubTotal!.toStringAsFixed(2)} \n";
        imprimiuSubtotal = true;
      }

      impressao += "Desconto: ${nota.valorDesconto!.toStringAsFixed(2)} \n";
      linha = true;
    }

    if (nota.valorAcrescimo != BigDecimal.ZERO()) {
      if (!imprimiuSubtotal) {
        impressao += "Subtotal: ${nota.valorSubTotal!.toStringAsFixed(2)} \n";
        imprimiuSubtotal = true;
      }

      impressao += "Acréscimo: ${nota.valorAcrescimo!.toStringAsFixed(2)} \n";
      linha = true;
    }

    if (linha) impressao += "--------------------------- \n";
    impressao += "Vr. Total:  ${nota.valorTotal!.toStringAsFixed(2)} \n";

    if (nota.finalizadoras != null && nota.finalizadoras.isNotEmpty) {
      BigDecimal totalPago;
      totalPago = nota.finalizadoras
          .map((f) => f.valor!)
          .reduce((value, element) => value + element);

      impressao += "--------------------------- \n";
      impressao += "Pago R\$:  ${totalPago.toStringAsFixed(2)} \n";


      BigDecimal troco = nota.finalizadoras
          .map((f) => f.troco != null ? f.troco! : BigDecimal.ZERO())
          .reduce((value, element) => value + element);

      if (troco != BigDecimal.ZERO())
        impressao += "Troco: R\$:  ${troco.toStringAsFixed(2)} \n";

      impressao += "\nFormas de pagamento:\n";
      nota.finalizadoras.forEach((f) {
        impressao +=
        "${f.finalizadoraEmpresa!.finalizadora!.descricao}   ${f.valor!.toStringAsFixed(2)} \n";
      });
    }
  }

   static void _imprimeTicketRodape( String senhaAtendimento) {
     impressao += "\n";
     impressao += "========================================" + "\n";
     impressao += "	NAO E DOCUMENTO FISCAL" + "\n";

     //Imprime senha de atendimento caso existir
     if (senhaAtendimento != null && senhaAtendimento.isNotEmpty) {
       impressao += "\n";
       impressao += "****ATENDIMENTO****" + "\n";
       impressao += senhaAtendimento.toUpperCase() + "\n\n";
     }
     impressao += "\n\n\n";
   }

  static void _percorreNotaItem(NotaItem notaItem, List<NotaItem> itemList) {
    if (!notaItem.cancelado &&
        (notaItem.tipo == "ITEM" ||
            notaItem.tipo == "ITEM_COMBINADO" ||
            notaItem.tipo == "ITEM_COMBO" ||
            notaItem.tipo == "ADICIONAL" ||
            notaItem.tipo == "ITEM_COMPOSTO" ||
            notaItem.tipo == "ITEM_CESTA" ||
            notaItem.tipo == "OBSERVACAO" ||
            notaItem.tipo == "ITEM_RODIZIO")) itemList.add(notaItem);

    if (notaItem.subitens.isNotEmpty)
      notaItem.subitens.forEach((s) => _percorreNotaItem(s, itemList));
  }

  static void _percorreIndividualNotaItem(NotaItem notaItem) {
    if (!notaItem.cancelado &&
        (notaItem.tipo == "ITEM" ||
            notaItem.tipo == "ITEM_COMBINADO" ||
            notaItem.tipo == "ITEM_COMBO" ||
            notaItem.tipo == "ADICIONAL" ||
            notaItem.tipo == "ITEM_COMPOSTO" ||
            notaItem.tipo == "ITEM_CESTA" ||
            notaItem.tipo == "OBSERVACAO" ||
            notaItem.tipo == "ITEM_RODIZIO")) {
      qtdeTotalItens += notaItem.quantidade;
      String quantidade;

      if (notaItem.quantidade!.toDouble() != notaItem.quantidade!.toInt()) {
        quantidade = notaItem.quantidade!.toDouble().toString();
      } else {
        quantidade = notaItem.quantidade!.toInt().toString();
      }

        impressao +=
            " $quantidade  X   ${notaItem.descricao}   " +
                "${notaItem.precoUnitario!.toStringAsFixed(2)}   " +
                "${notaItem.precoTotal!.toStringAsFixed(2)} \n";


      BigDecimal descontoTotal =
          notaItem.valorDesconto! + notaItem.valorDescontoPromocao;
      if (descontoTotal != BigDecimal.ZERO())
        impressao +=
        "Desconto item:   - ${descontoTotal.toStringAsFixed(2)} \n";
    }

    if (notaItem.subitens.isNotEmpty)
      notaItem.subitens.forEach((s) => _percorreIndividualNotaItem(s));
  }
}
