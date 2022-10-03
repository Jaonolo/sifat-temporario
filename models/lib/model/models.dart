library openapi.api;

import 'dart:convert';

import 'package:decimal/decimal.dart';
import 'package:models/model/abstract/cloneable.dart';
import 'package:models/model/enum/origem_intregacao.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rational/rational.dart';
import 'enum/clients.dart';


//#################### EXCEPTION ########################
part '../exception/pws_exception.dart';

part '../exception/waybe_exception.dart';

//#################### ENUM ########################
part 'enum/tempo_color.dart';

part 'enum/nivel_privilegio.dart';

part 'enum/privilegio_codigo.dart';

part 'enum/ticket_consumo.dart';

part 'enum/impressao_venda.dart';

part 'enum/senha_atendimento.dart';

part 'enum/tipo_arquivo.dart';

part 'enum/visao_foto.dart';

part 'enum/formato_arquivo.dart';

part 'enum/tipo_pacote.dart';

part 'enum/tipo_pendencia.dart';

//#################### OBJECT  ########################
part 'big_decimal.dart';

part 'alfa_sync.dart';

part 'aplicativo_versao.dart';

part 'aplicativo_versao_detalhe.dart';

part 'atribuir_produto_empresa_dto.dart';

part 'cliente_autorizado.dart';

part 'auxiliar_producao.dart';

part 'bairro.dart';

part 'banco.dart';

part 'bandeira_cartao.dart';

part 'bandeira_cartao_dados_integracao.dart';

part 'cadastro_estacao_trabalho_dto.dart';

part 'cadastro_impressora_producao_dto.dart';

part 'campanha.dart';

part 'cardapio.dart';

part 'cardapio_menu.dart';

part 'cest.dart';

part 'cfop.dart';

part 'cidade.dart';

part 'classificacao.dart';

part 'client.dart';

part 'client_empresa.dart';

part 'cliente.dart';

part 'cliente_cartao.dart';

part 'cliente_crediario.dart';

part 'cliente_mensalista.dart';

part 'cliente_ocorrencia.dart';

part 'cliente_quest_dto.dart';

part 'cliente_referencia.dart';

part 'cliente_referencia_pk.dart';

part 'cliente_vinculo.dart';

part 'colecao.dart';

part 'combinado_tamanho.dart';

part 'combinado_tamanho_pk.dart';

part 'condicao_pagamento.dart';

part 'conferencia_caixa.dart';

part 'consumo.dart';

part 'consumo_item.dart';

part 'consumo_mapa.dart';

part 'conta_contabil.dart';

part 'conta_corrente.dart';

part 'contrato_extra.dart';

part 'controle_cadastro.dart';

part 'controle_registro.dart';

part 'cop.dart';

part 'cor.dart';

part 'credenciais_ifood.dart';

part 'csosn_icms.dart';

part 'cst_icms.dart';

part 'cst_pis_cofins.dart';

part 'desdobramento_garcom.dart';

part 'desdobramento_modulo.dart';

part 'desdobramento_venda.dart';

part 'documento_fiscal.dart';

part 'driver_impressora.dart';

part 'dto_nota.dart';

part 'emissor_fiscal.dart';

part 'emitente_cheque.dart';

part 'empresa.dart';

part 'empresa_contrato.dart';

part 'empresa_contrato_extra.dart';

part 'empresa_dto.dart';

part 'empresa_fiscal.dart';

part 'empresa_fuso_horario.dart';

part 'empresa_venda.dart';

part 'endereco.dart';

part 'endereco_dados_integracao.dart';

part 'endereco_estoque.dart';

part 'envio_pre_cadastro.dart';

part 'equipamento_impressao.dart';

part 'especie_titulo.dart';

part 'estacao_balanca.dart';

part 'estacao_impressora.dart';

part 'estacao_leitor.dart';

part 'estacao_pre_cadastro_dto.dart';

part 'estacao_trabalho.dart';

part 'estacao_trabalho_dto.dart';

part 'estacao_trabalho_simplificado_dto.dart';

part 'evento.dart';

part 'finalizadora.dart';

part 'finalizadora_empresa.dart';

part 'fornecedor.dart';

part 'fornecedor_vinculo.dart';

part 'fox_consumo.dart';

part 'funcionario.dart';

part 'gerenciador.dart';

part 'grade.dart';

part 'grade_empresa.dart';

part 'grupo_estacao.dart';

part 'grupo_impressora.dart';

part 'historico_compras.dart';

part 'ibpt.dart';

part 'icms.dart';

part 'incrementar_contador_dto.dart';

part 'informacao_nutricional.dart';

part 'inline_object.dart';

part 'inline_object1.dart';

part 'integracao.dart';

part 'local_estocado.dart';

part 'local_producao.dart';

part 'log.dart';

part 'logradouro.dart';

part 'lojista.dart';

part 'mapa_comanda_dto.dart';

part 'models.g.dart';

part 'modulo.dart';

part 'modulo_mapeamento.dart';

part 'motivo_cancelamento.dart';

part 'movimento.dart';

part 'ncm.dart';

part 'nota.dart';

part 'nota_dados_integrador.dart';

part 'nota_evento.dart';

part 'nota_finalizadora.dart';

part 'nota_fiscal.dart';

part 'nota_item.dart';

part 'nota_item_dados_integracao.dart';

part 'nota_item_fiscal.dart';

part 'nota_quest.dart';

part 'nova_empresa_dto.dart';

part 'observacao.dart';

part 'operacao.dart';

part 'operacao_finalizadora.dart';

part 'operacao_finalizadora_pk.dart';

part 'origem_mercadoria.dart';

part 'pais.dart';

part 'participante.dart';

part 'participante_telefone.dart';

part 'pendencia.dart';

part 'perfil.dart';

part 'pessoa.dart';

part 'pessoa_dados_integracao.dart';

part 'pessoa_fisica.dart';

part 'pessoa_juridica.dart';

part 'pis_cofins.dart';

part 'produto.dart';

part 'produto_empresa.dart';

part 'produto_familia.dart';

part 'produto_fiscal.dart';

part 'produto_grupo.dart';

part 'produto_marca.dart';

part 'produto_menu.dart';

part 'produto_menu_componente.dart';

part 'produto_menu_componente_empresa.dart';

part 'programa_fidelidade.dart';

part 'promocao.dart';

part 'pws_alert.dart';

part 'quest.dart';

part 'ramo_atividade.dart';

part 'recebimento_parcial.dart';

part 'regiao.dart';

part 'reserva_mesa.dart';

part 'retorno_token.dart';

part 'servico_catraca.dart';

part 'servico_four_all.dart';

part 'servico_ifood.dart';

part 'servico_impressao.dart';

part 'servico_impressao_dto.dart';

part 'servico_sitef.dart';

part 'setor.dart';

part 'solicitar_configuracao_dto.dart';

part 'status_credito.dart';

part 't_ret_cons_stat_serv.dart';

part 'tabela_preco.dart';

part 'tamanho.dart';

part 'telefone.dart';

part 'transacao_cartao.dart';

part 'turno.dart';

part 'turno_fechamento.dart';

part 'turno_fechamento_pk.dart';

part 'unidade_federativa.dart';

part 'usuario.dart';

part 'usuario_empresa.dart';

part 'vendedor.dart';

part 'version_info.dart';

part 'waycard_autorizacao_pgto_dto.dart';

part 'waycard_fatura.dart';

part 'waycard_transacao.dart';

part 'xml_dto.dart';

part 'contrato_configuracao.dart';

part 'wizard_buscar_planos_envelop.dart';

part 'wizard_buscar_empresa_envelop.dart';

part 'wizard_buscar_empresa_dto.dart';

part 'wizard_validar_master_dto.dart';

part 'receitaws_empresa.dart';

part 'canal_venda.dart';

part 'canal_venda_empresa.dart';

part 'grade_empresa_preco.dart';

part 'produto_menu_componente_empresa_preco.dart';

part 'total_recebimento_parcial_dto.dart';

part 'produto_arquivo.dart';

part 'biblioteca_icone.dart';

part 'printer_nfce_dto.dart';

part 'printer_venda_dto.dart';

part 'config_properties_dto.dart';

part 'conferencia_caixa_dto.dart';

part 'turno_simplificado_dto.dart';

part 'total_finalizadora_dto.dart';

part 'operacao_dto.dart';

part 'extrato_turno_dto.dart';

part 'nota_simplificada_dto.dart';

part 'vendas_gracom_dto.dart';

part 'desdobramento_venda_dto.dart';

part 'vendas_modulo_dto.dart';

part 'desdobramento_produto_dto.dart';

part 'desdobramento_grupo_produtos_dto.dart';

part 'turno_fechamento_dto.dart';

part 'contingencia_fiscal.dart';

part 'regiao_empresa.dart';

part 'cliente_simplificado_dto.dart';

part 'nota_xml.dart';

part 'historico_pedido_dto.dart';

part 'pedido_dto.dart';

part 'pedido_item_dto.dart';

part 'empresa_integrador.dart';

part 'cliente_extrato_dto.dart';

part 'cliente_conta.dart';

part 'cliente_fatura.dart';

part 'cliente_conta_concentrador.dart';

part 'conta.dart';

part 'conta_corrente_carteira.dart';

part 'conta_classificacao.dart';

part 'conta_centro_custo.dart';

part 'conta_lote.dart';

part 'lote_controle_cartao.dart';

part 'remessa_bancaria.dart';

part 'apuracao_royalty.dart';

part 'apuracao_royalty_loja.dart';

part 'centro_custo.dart';

part 'plano_conta.dart';

part 'configuracoes_auto_pesagem_dto.dart';

part 'client_auto_pesagem.dart';

part 'layout_controle.dart';

part 'layout_controle_tempo.dart';

part 'usuario_perfil_empresa.dart';

part 'usuario_perfil_empresa_privilegio.dart';

part 'ticket_impressao_dto.dart';

part 'item_dto.dart';

part 'servico_auto_atendimento.dart';

part 'arquivo_auto_atendimento.dart';

part 'login_auto_atendimento_dto.dart';

part 'login_client_dto.dart';

part 'token_dto.dart';

part 'printer_tef_dto.dart';