import 'package:models/model/enum/tipo_item.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/string_utils.dart';
import 'package:collection/collection.dart';

class NotaItemUtils {
  //Criação de objetos

  /*
   *  TipoItem Regra:
   *  1- Se for do tipo CardapioMenu (Combinado) = TipoItem.COMBINADO
   *  2- Se produto não tem pacote = TipoItem.ITEM
   *  3- Se o produto tem Pacote, precisa validar o pacote (Todos os demais)
   */
  static NotaItem instanciar(int idNota, TipoItem tipo,
      ProdutoEmpresa produtoEmpresa, int idTabelaPreco,
      {GradeEmpresa? gradeEmpresa,
        CardapioMenu? cardapioMenu,
        int? idVendedor,
        int? idUsuario}) {
    NotaItem item = NotaItem();
    item.idNota = idNota;
    item.tipo = StringUtils.getEnumValue(tipo);

    //Parâmetros não obrigatórios
    item.idVendedor = idVendedor;
    item.idUsuario = idUsuario;

    item.quantidade = BigDecimal.ONE();
    item.precoUnitario = BigDecimal.ZERO();
    item.precoTotal = BigDecimal.ZERO();
    item.subitens = [];
    item.dataLancamento = DateTime.now();
    item.idTabelaPreco = idTabelaPreco;

    if (tipo == TipoItem.COMBINADO) {
      item.descricao = "[Combinado] " + cardapioMenu!.descricao!;
    } else {
      item.descricao =
      "${produtoEmpresa.produto!.descricao!} ${(produtoEmpresa.produto!.grade !=
          "NENHUMA") ? "(${gradeEmpresa!.grade!.tamanho!.descricao})" : ""}";
      item.idProdutoEmpresa = produtoEmpresa.id;
      item.produtoEmpresa = produtoEmpresa;
      item.idGrade = gradeEmpresa == null
          ? produtoEmpresa.gradePadrao!.id
          : gradeEmpresa.id;
      item.grade =
      gradeEmpresa == null ? produtoEmpresa.gradePadrao : gradeEmpresa;

      if (produtoEmpresa.produto!.grade == "NENHUMA") {
        if (tipo != TipoItem.COMBO) {
          item.precoUnitario = item.grade!.precoVenda(idTabelaPreco);
        } else {
          item.precoUnitario = BigDecimal.ZERO();
        }
      } else {
        item.precoUnitario = item.grade!.precoVenda(idTabelaPreco);
      }
      item.precoTotal = item.quantidade!.multiplicar(item.precoUnitario);
    }

    //Todo validar promoção
    //validarPromocao(item);

    return item;
  }

//   static NotaItem digitadaToNotaItem(int idNota, String observacao,
//       {int idVendedor, int idUsuario}) {
//     NotaItem item = NotaItem();
//     item.idNota = idNota;
//     item.descricao = observacao;
//     item.tipo = StringUtils.getEnumValue(TipoItem.OBSERVACAO);
//     item.idVendedor = idVendedor;
//     item.idUsuario = idUsuario;
//     item.dataLancamento = DateTime.now();
//     item.consumoItem = ConsumoItem();
//     return item;
//   }
//
  static NotaItem menuToNotaItem(int idNota, ProdutoMenu menu,
      {int? idVendedor, int? idUsuario}) {
    NotaItem item = NotaItem();
    item.idNota = idNota;
    item.descricao = menu.descricao;
    item.tipo = StringUtils.getEnumValue(TipoItem.MENU);
//    item.idEstacao = AppConfig.application.estacao.id;
    item.idVendedor = idVendedor;
    item.idUsuario = idUsuario;
    item.subitens = [];
    item.dataLancamento = DateTime.now();
    item.consumoItem = ConsumoItem();
    item.consumoItem!.menu = menu;
    item.consumoItem!.idMenu = menu.id;
    return item;
  }

  static NotaItem adicionalToNotaItem(int idNota,
      ProdutoMenuComponente componente, int idEmpresa, int idTabelaPreco,
      {BigDecimal? quantidade, int? idVendedor, int? idUsuario}) {
    ProdutoMenuComponenteEmpresa componenteEmpresa = componente
        .componenteEmpresas
        .firstWhere((ce) => ce.idEmpresa == idEmpresa);

    GradeEmpresa gradeEmpresa = componenteEmpresa.gradeEmpresa!;
    ProdutoEmpresa produtoEmpresa = gradeEmpresa.produtoEmpresa!;

    String descricao = produtoEmpresa.produto!.descricao!;
    if (produtoEmpresa.produto!.grade != "NENHUMA")
      descricao += " (${gradeEmpresa.grade!.tamanho!.descricao})";

    NotaItem item = NotaItem();
    item.idNota = idNota;
    item.descricao = descricao;
    item.idProdutoEmpresa = produtoEmpresa.id;
    item.produtoEmpresa = produtoEmpresa;
    item.tipo = StringUtils.getEnumValue(TipoItem.ADICIONAL);
//    item.idEstacao = AppConfig.application.estacao.id;
    item.idVendedor = idVendedor;
    item.idUsuario = idUsuario;
    item.quantidade = quantidade ?? BigDecimal.ONE();
    item.idGrade = gradeEmpresa.id;
    item.grade = gradeEmpresa;
    item.precoUnitario = gradeEmpresa.precoVenda(idTabelaPreco);
    item.precoTotal = item.quantidade!.multiplicar(item.precoUnitario);
    item.subitens = [];
    item.dataLancamento = DateTime.now();
    item.idTabelaPreco = idTabelaPreco;
    return item;
  }

  static NotaItem observacaoToNotaItem(int idNota,
      ProdutoMenuComponente componente,
      {int? idVendedor, int? idUsuario}) {
    NotaItem item = NotaItem();
    item.idNota = idNota;
    item.descricao = componente.observacao!.descricao;
    item.tipo = StringUtils.getEnumValue(TipoItem.OBSERVACAO);
//    item.idEstacao = AppConfig.application.estacao.id;
    item.idVendedor = idVendedor;
    item.idUsuario = idUsuario;
    item.dataLancamento = DateTime.now();
    return item;
  }

//
  static NotaItem itemComboToNotaItem(int idNota,
      ProdutoMenuComponente componente, int idEmpresa, int idTabelaPreco,
      {BigDecimal? quantidade,int? idVendedor, int? idUsuario}) {
    ProdutoMenuComponenteEmpresa componenteEmpresa = componente
        .componenteEmpresas
        .firstWhere((ce) => ce.idEmpresa == idEmpresa);
    GradeEmpresa gradeEmpresa = componenteEmpresa.gradeEmpresa!;
    ProdutoEmpresa produtoEmpresa = gradeEmpresa.produtoEmpresa!;

    String descricao = produtoEmpresa.produto!.descricao!;
    if (produtoEmpresa.produto!.grade != "NENHUMA")
      descricao += " (${gradeEmpresa.grade!.tamanho!.descricao!})";

    NotaItem item = NotaItem();
    item.idNota = idNota;
    item.descricao = descricao;
    item.idProdutoEmpresa = produtoEmpresa.id;
    item.produtoEmpresa = produtoEmpresa;
    item.tipo = StringUtils.getEnumValue(TipoItem.ITEM_COMBO);
//    item.idEstacao = AppConfig.application.estacao.id;
    item.idVendedor = idVendedor;
    item.idUsuario = idUsuario;
    item.quantidade = quantidade ?? componente.quantidade;
    item.idGrade = gradeEmpresa.id;
    item.grade = gradeEmpresa;
    item.precoUnitario =
        componente.getValorComponente(idEmpresa, idTabelaPreco);
    item.precoTotal = item.quantidade!.multiplicar(item.precoUnitario);
    item.subitens = [];
    item.dataLancamento = DateTime.now();
    item.idTabelaPreco = idTabelaPreco;
    return item;
  }

//   static NotaItem itemCompostoToNotaItem(int idNota,
//       ProdutoMenuComponente componente, int idEmpresa, int idTabelaPreco,
//       {int idVendedor, int idUsuario}) {
//     ProdutoMenuComponenteEmpresa componenteEmpresa = componente
//         .componenteEmpresas
//         .firstWhere((ce) => ce.idEmpresa == idEmpresa);
//     GradeEmpresa gradeEmpresa = componenteEmpresa.gradeEmpresa;
//     ProdutoEmpresa produtoEmpresa = gradeEmpresa.produtoEmpresa;
//
//     String descricao = produtoEmpresa.produto.descricao;
//     if (produtoEmpresa.produto.grade != "NENHUMA")
//       descricao += " (${gradeEmpresa.grade.tamanho.descricao})";
//
//     NotaItem item = NotaItem();
//     item.idNota = idNota;
//     item.descricao = descricao;
//     item.idProdutoEmpresa = produtoEmpresa.id;
//     item.produtoEmpresa = produtoEmpresa;
//     item.tipo = StringUtils.getEnumValue(TipoItem.ITEM_COMPOSTO);
// //    item.idEstacao = AppConfig.application.estacao.id;
//     item.idVendedor = idVendedor;
//     item.idUsuario = idUsuario;
//     item.quantidade = componente.quantidade;
//     item.idGrade = gradeEmpresa.id;
//     item.grade = gradeEmpresa;
//     item.precoUnitario =
//         componente.getValorComponente(idEmpresa, idTabelaPreco);
//     item.precoTotal = item.quantidade.multiplicar(item.precoUnitario);
//     item.subitens = [];
//     item.dataLancamento = DateTime.now();
//     item.idTabelaPreco = idTabelaPreco;
//     return item;
//   }
//
//   static NotaItem itemRodizioToNotaItem(int idNota,
//       ProdutoMenuComponente componente, int idEmpresa, int idTabelaPreco,
//       {int idVendedor, int idUsuario}) {
//     ProdutoMenuComponenteEmpresa componenteEmpresa = componente
//         .componenteEmpresas
//         .firstWhere((ce) => ce.idEmpresa == idEmpresa);
//     GradeEmpresa gradeEmpresa = componenteEmpresa.gradeEmpresa;
//     ProdutoEmpresa produtoEmpresa = gradeEmpresa.produtoEmpresa;
//
//     String descricao = produtoEmpresa.produto.descricao;
//     if (produtoEmpresa.produto.grade != "NENHUMA")
//       descricao += " (${gradeEmpresa.grade.tamanho.descricao})";
//
//     NotaItem item = NotaItem();
//     item.idNota = idNota;
//     item.descricao = descricao;
//     item.idProdutoEmpresa = produtoEmpresa.id;
//     item.produtoEmpresa = produtoEmpresa;
//     item.tipo = StringUtils.getEnumValue(TipoItem.ITEM_RODIZIO);
// //    item.idEstacao = AppConfig.application.estacao.id;
//     item.idVendedor = idVendedor;
//     item.idUsuario = idUsuario;
//     item.quantidade = componente.quantidade;
//     item.idGrade = gradeEmpresa.id;
//     item.grade = gradeEmpresa;
//     item.precoUnitario =
//         componente.getValorComponente(idEmpresa, idTabelaPreco);
//     item.precoTotal = item.quantidade.multiplicar(item.precoUnitario);
//     item.subitens = [];
//     item.dataLancamento = DateTime.now();
//     item.idTabelaPreco = idTabelaPreco;
//     return item;
//   }
//
//   static NotaItem itemCombinadoToNotaItem(
//       int idNota, ProdutoEmpresa produtoEmpresa, Tamanho tamanho,
//       {int idVendedor, int idUsuario}) {
//     GradeEmpresa gradeEmpresa = produtoEmpresa.gradesAtivas.firstWhere((ge) =>
//         ge.ativo && ge.grade.ativo && ge.grade.tamanho.id == tamanho.id);
//
//     NotaItem item = NotaItem();
//     item.idNota = idNota;
//     item.descricao =
//         "${produtoEmpresa.produto.descricao} (${tamanho.descricao})";
//     item.idProdutoEmpresa = produtoEmpresa.id;
//     item.produtoEmpresa = produtoEmpresa;
//     item.tipo = StringUtils.getEnumValue(TipoItem.ITEM_COMBINADO);
// //    item.idEstacao = AppConfig.application.estacao.id;
//     item.idVendedor = idVendedor;
//     item.idUsuario = idUsuario;
//     item.idGrade = gradeEmpresa.id;
//     item.grade = gradeEmpresa;
//     item.quantidade = BigDecimal.ONE();
//     item.precoCusto = gradeEmpresa.precoCustoCompra;
//     item.subitens = [];
//     item.dataLancamento = DateTime.now();
//     return item;
//   }
//
//   //Utils (Cálculos)
//
  static NotaItem atualizaTotais(NotaItem notaItem) {
    if (notaItem.tipo != "COMBO" && notaItem.tipo != "COMBINADO") {
      notaItem.precoTotal =
          notaItem.precoUnitario!.multiplicar(notaItem.quantidade);

      if (notaItem.produtoEmpresa != null &&
          notaItem.produtoEmpresa!.cobraTaxaServico! &&
          notaItem.taxaServico!.compareTo(BigDecimal.ZERO()) > 0 &&
          notaItem.tipo != "INGRESSO") {
        notaItem.valorServico = notaItem.precoTotal!
            .multiplicar(notaItem.taxaServico)
            .dividir(BigDecimal("100"));
      }

      notaItem.valorLiquido = notaItem.precoTotal!
          .somar(notaItem.valorServico)
          .subtrair(notaItem.valorDesconto)
          .subtrair(notaItem.valorDescontoRateio)
          .somar(notaItem.valorAcrescimoRateio)
          .somar(notaItem.valorFreteRateio);
    }

    if (notaItem.subitens.isNotEmpty)
      notaItem.subitens.forEach((element) {
        element = atualizaTotais(element);
      });

    return notaItem;
  }

//
//   static void validarSomaComponentes(NotaItem notaItem) {
//     BigDecimal totalLancado = BigDecimal.ZERO();
//     try {
//       if (notaItem.produtoEmpresa != null &&
//           notaItem.produtoEmpresa.produto.menus.isNotEmpty) {
//         notaItem.produtoEmpresa.produto.menus.forEach((menu) {
//           if (menu.quantidadeMinima > 0) {
//             NotaItem itemMenu = notaItem.subitens.firstWhere(
//                 (nt) =>
//                     nt.consumoItem.idMenu == menu.id,
//                 orElse: () => null);
//
//             if (itemMenu == null) {
//               throw "Menu obrigatório não lançado [${menu.descricao}]";
//             } else {
//               itemMenu.subitens.forEach((nt) {
//                 try {
//                   validarSomaComponentes(nt);
//                   if (menu.tipo == "OBSERVACAO")
//                     totalLancado = totalLancado.somar(BigDecimal.ONE());
//                   else
//                     totalLancado = totalLancado.somar(nt.quantidade);
//                 } catch (e) {
//                   throw e;
//                 }
//               });
//               if (totalLancado < BigDecimal(menu.quantidadeMinima.toString()))
//                 throw "Soma dos componentes inválida [${menu.descricao}]";
//             }
//           }
//         });
//       } else {
//         notaItem.subitens.forEach((nt) {
//           try {
//             validarSomaComponentes(nt);
//           } catch (e) {
//             throw e;
//           }
//         });
//       }
//     } catch (e) {
//       throw e;
//     }
//   }
//
//   static bool validarGrade(
//       NotaItem notaItem, OperacaoLancamento operacaoLancamento) {
//     bool result = true;
//     if (notaItem.produtoEmpresa.produto.grade != "NENHUMA" &&
//         operacaoLancamento == OperacaoLancamento.INSERCAO) {
//       if (notaItem.grade == null) return false;
//       if (notaItem.grade.id == notaItem.produtoEmpresa.gradePadrao.id)
//         return false;
//     }
//     return result;
//   }
//
  static BigDecimal calcularAdicionais(NotaItem item) {
    BigDecimal value = BigDecimal.ZERO();
    item.subitens.forEach((subitem) {
      if (subitem.tipo == StringUtils.getEnumValue(TipoItem.ADICIONAL))
        value = value
            .somar(subitem.quantidade!.multiplicar(subitem.precoUnitario));

      value = value.somar(calcularAdicionais(subitem));
    });
    return value;
  }

//   static void multiplicarSubitens(NotaItem item, NotaItem itemPai) {
//     if (item.subitens != null && item.subitens.isNotEmpty) {
//       if (item.tipo != "MENU") itemPai = item;
//       item.subitens.forEach((subitem) {
//         switch (subitem.tipo) {
//           case "ADICIONAL":
//           case "ITEM_COMBO":
//           case "ITEM_COMPOSTO":
//           case "ITEM_RODIZIO":
//             subitem.quantidade =
//                 subitem.quantidade.multiplicar(itemPai.quantidade);
//             subitem.precoTotal =
//                 subitem.precoUnitario.multiplicar(subitem.quantidade);
//             break;
//
//           default:
//         }
//         multiplicarSubitens(subitem, itemPai);
//       });
//     }
//   }
//
//   static void dividirSubitens(NotaItem item, NotaItem itemPai) {
//     if (item.subitens != null && item.subitens.isNotEmpty) {
//       if (item.tipo != "MENU") itemPai = item;
//       item.subitens.forEach((subitem) {
//         dividirSubitens(subitem, itemPai);
//       });
//     }
//
//     switch (item.tipo) {
//       case "ADICIONAL":
//       case "ITEM_COMBO":
//       case "ITEM_COMPOSTO":
//       case "ITEM_RODIZIO":
//         item.quantidade = item.quantidade.dividir(itemPai.quantidade);
//         item.precoTotal = item.precoUnitario.multiplicar(item.quantidade);
//         break;
//
//       default:
//     }
//   }
//
//   static void calcularSubitensCombinado(
//       NotaItem item, BigDecimal quantidadeCombinado,
//       {bool multiplicar = false, bool dividir = false}) {
//     if (item.subitens != null && item.subitens.isNotEmpty) {
//       item.subitens.forEach((subitem) {
//         if (subitem.tipo == "ADICIONAL") {
//           if (multiplicar)
//             subitem.quantidade =
//                 subitem.quantidade.multiplicar(quantidadeCombinado);
//           if (dividir)
//             subitem.quantidade =
//                 subitem.quantidade.dividir(quantidadeCombinado);
//           subitem.precoTotal =
//               subitem.precoUnitario.multiplicar(subitem.quantidade);
//         }
//         calcularSubitensCombinado(subitem, quantidadeCombinado,
//             multiplicar: multiplicar, dividir: dividir);
//       });
//     }
//   }
//
//   static BigDecimal quantidadeSelecionadaMenu(NotaItem itemMenu) {
//     BigDecimal qtdeSelecionada = BigDecimal.ZERO();
//     if (itemMenu != null) {
//       itemMenu.subitens.forEach((ni) {
//         if (ni.tipo != "OBSERVACAO") {
//           if (ni.cancelado == null || !ni.cancelado)
//             qtdeSelecionada = qtdeSelecionada.somar(ni.quantidade);
//         } else {
//           qtdeSelecionada = qtdeSelecionada.somar(BigDecimal.ONE());
//         }
//       });
//     }
//     return qtdeSelecionada;
//   }
//
//   static BigDecimal quantidadeSelecionadaComponente(
//       NotaItem itemMenu, ProdutoMenuComponenteEmpresa componente) {
//     BigDecimal qtdeSelecionada = BigDecimal.ZERO();
//     if (itemMenu != null) {
//       itemMenu.subitens.forEach((ni) {
//         if ((ni.cancelado == null || !ni.cancelado) &&
//             ni.produtoEmpresa.id == componente.gradeEmpresa.idProdutoEmpresa)
//           qtdeSelecionada = qtdeSelecionada.somar(ni.quantidade);
//       });
//     }
//     return qtdeSelecionada;
//   }
//
//   static void recalcularPrecos(
//       NotaItem notaItem, TipoModulo currentModulo, int idTabelaPreco) {
//     if (GradeEmpresaUtils.validaPromocaoPrecoFixo(
//         notaItem.grade, currentModulo.toString())) {
//       notaItem.precoUnitario = notaItem.grade.precoPromocional;
//     } else {
//       notaItem.precoUnitario = notaItem.grade.precoVenda(idTabelaPreco);
//     }
//
//     notaItem.precoTotal =
//         notaItem.quantidade.multiplicar(notaItem.precoUnitario);
//   }
//
//   static void calcularValorCombinado(
//       CardapioMenu menu, NotaItem notaItem, int idTabelaPreco) {
//     notaItem.precoUnitario = BigDecimal.ZERO();
//     notaItem.precoTotal = BigDecimal.ZERO();
//
//     List<NotaItem> sabores =
//         notaItem.subitens.where((nt) => nt.tipo == "ITEM_COMBINADO").toList();
//
//     switch (menu.precoCombinado) {
//       case "MEDIA_PRECO":
//         BigDecimal preco = BigDecimal.ZERO();
//         BigDecimal partes = BigDecimal.ZERO();
//         sabores.forEach((nt) {
//           preco = preco.somar(
//               nt.grade.precoVenda(idTabelaPreco).multiplicar(nt.quantidade));
//           partes += nt.quantidade;
//         });
//         if (preco.compareTo(BigDecimal.ZERO()) > 0) {
//           preco = preco.dividir(partes);
//           notaItem.precoUnitario = preco;
//           sabores.forEach((nt) {
//             nt.precoUnitario = preco;
//             nt.precoTotal = nt.quantidade.multiplicar(nt.precoUnitario);
//           });
//         }
//         break;
//
//       case "MAIOR_PRECO":
//         sabores.forEach((nt) {
//           if (notaItem.precoUnitario
//                   .compareTo(nt.grade.precoVenda(idTabelaPreco)) <
//               0) notaItem.precoUnitario = nt.grade.precoVenda(idTabelaPreco);
//         });
//         sabores.forEach((nt) {
//           nt.precoUnitario = notaItem.precoUnitario;
//           nt.precoTotal = nt.quantidade.multiplicar(nt.precoUnitario);
//         });
//         break;
//     }
//     notaItem.precoTotal =
//         notaItem.quantidade.multiplicar(notaItem.precoUnitario);
//   }
//
//   static void calcularValorCombo(NotaItem combo) {
//     BigDecimal valor = BigDecimal.ZERO();
//     combo.subitens.forEach((menu) {
//       menu.subitens.forEach((item) {
//         if (item.tipo != "OBSERVACAO") valor = valor.somar(item.precoTotal);
//       });
//     });
//     combo.precoUnitario = valor;
//     combo.precoTotal = combo.quantidade.multiplicar(valor);
//   }
//
//   static void tratativasEdicao(
//       NotaItem notaItem, Map<num, ProdutoEmpresa> produtos) {
//     preencherProdutoEmpresaNotaItem(notaItem, produtos);
//
//     if (notaItem.tipo != "RODIZIO")
//       NotaItemUtils.dividirSubitens(notaItem, notaItem);
//
//     switch (notaItem.tipo) {
//       case "COMBO":
//         calcularValorCombo(notaItem);
//         break;
//     }
//   }
//
//   static void preencherProdutoEmpresaNotaItem(
//       NotaItem notaItem, Map<num, ProdutoEmpresa> produtos) {
//     if (notaItem.idProdutoEmpresa != null)
//       notaItem.produtoEmpresa = produtos[notaItem.idProdutoEmpresa].clone();
//
//     if (notaItem.subitens != null && notaItem.subitens.isNotEmpty)
//       notaItem.subitens
//           .forEach((s) => preencherProdutoEmpresaNotaItem(s, produtos));
//   }
//
//   static void ordenarMenusNotaItem(NotaItem notaItem) {
//     if (notaItem.subitens != null && notaItem.subitens.isNotEmpty) {
//       notaItem.subitens.sort((o1, o2) => o1.descricao.compareTo(o2.descricao));
//       notaItem.subitens.forEach((s) => ordenarMenusNotaItem(s));
//     }
//   }
//
//   static void validarPromocao(
//       NotaItem notaItem, TipoModulo currentModulo, String vendaPromocao) {
//     if (notaItem.produtoEmpresa != null) {
//       if (notaItem.grade.promocao != null) {
//         if (GradeEmpresaUtils.validaPromocao(
//             notaItem.grade, currentModulo.toString())) {
//           Promocao p = notaItem.grade.promocao;
//           switch (p.modalidade) {
//             case "PRECO_FIXO_UNIDADE":
//               notaItem.promocao = p;
//               notaItem.precoPromocao = notaItem.grade.precoPromocional;
//               switch (vendaPromocao) {
//                 case "DESCONTO_ITEM":
//                   notaItem.valorDescontoPromocao =
//                       notaItem.precoUnitario - notaItem.precoPromocao;
//                   break;
//                 case "VALOR_LIQUIDO":
//                   notaItem.precoUnitario = notaItem.precoPromocao;
//                   notaItem.precoTotal =
//                       notaItem.precoUnitario * notaItem.quantidade;
//                   break;
//               }
//               break;
//             case "COMPRE_PAGUE":
//               notaItem.promocao = p;
//               notaItem.precoPromocao = notaItem.precoUnitario;
//               break;
//           }
//         }
//       }
//     }
//   }
//
  static NotaItem? localizaMenuJaLancado(NotaItem itemOriginal,
      ProdutoMenu produtoMenu) {
    if (itemOriginal.subitens.isEmpty) {
      return null;
    }

    return itemOriginal.subitens.firstWhereOrNull(
            (ni) =>
        ni.consumoItem != null && ni.consumoItem!.idMenu == produtoMenu.id);
  }

  static NotaItem? localizaObservacaoJaLancada(NotaItem itemOriginal,
      ProdutoMenu produtoMenu, ProdutoMenuComponente produtoMenuComponente) {
    NotaItem? menuLocalizado = localizaMenuJaLancado(itemOriginal, produtoMenu);
    //Se não localizou menu, já interrompe o fluxo
    if (menuLocalizado == null) return null;

    //Localiza no menu se existe alguma observação lançada
    return menuLocalizado.subitens.firstWhereOrNull(
            (ni) =>
        ni.descricao == produtoMenuComponente.observacao!.descricao!);
  }

  static NotaItem? localizaSubitemJaLancado(NotaItem itemOriginal,
      ProdutoMenu produtoMenu, ProdutoMenuComponente produtoMenuComponente) {
    NotaItem? menuLocalizado = localizaMenuJaLancado(itemOriginal, produtoMenu);
    //Se não localizou menu, já interrompe o fluxo
    if (menuLocalizado == null) return null;

    //Captura o produtoMenuComponenteEmpresa para utilizar do id gradeEmpresa
    ProdutoMenuComponenteEmpresa componenteEmpresa =
    produtoMenuComponente.componenteEmpresas.firstWhere(
            (ce) => ce.idEmpresa == itemOriginal.produtoEmpresa!.idEmpresa!);

    //Localiza no menu se existe algum subitem lançado
    return menuLocalizado.subitens.firstWhereOrNull(
            (ni) => ni.idGrade == componenteEmpresa.gradeEmpresa!.id!);
  }


  static List<NotaItem> getItensCombo(NotaItem notaItem) {
    List<NotaItem> list = [];

    if (notaItem.tipo == "ITEM_COMBO" || notaItem.tipo == "ADICIONAL")
      list.add(notaItem);

    if (notaItem.subitens.isNotEmpty)
      notaItem.subitens.forEach((element) {
        var itensCombo = getItensCombo(element);
        list.addAll(itensCombo);
      });

    return list;
  }

  static BigDecimal getSubtotal(NotaItem item) {
    BigDecimal subTotal = BigDecimal.ZERO();

    if (item.cancelado == false)
      subTotal = subTotal.somar(item.precoTotal!.subtrair(item.valorDesconto));

    item.subitens.forEach((subitem) {
      subTotal = subTotal.somar(getSubtotal(subitem));
    });

    return subTotal;
  }

  ///
  static BigDecimal verificaDiferencaCombo(ProdutoMenu produtoMenu,
      int idEmpresa, int idTabelaPreco) {
    BigDecimal? menorValor;
    produtoMenu.componentes.forEach((pmc) {
      var valorComponente = pmc.getValorComponente(idEmpresa, idTabelaPreco);
      if (menorValor == null || valorComponente!.compareTo(menorValor!) < 0) {
        menorValor = valorComponente;
      }
    });

    if (menorValor == null) throw new Exception('Valor do item igual a null');

    return menorValor ?? BigDecimal.ZERO();
  }

//
  static atualizaQuantidadeSubitens(NotaItem item, BigDecimal qtdeAtual,
      BigDecimal qtdeNova) {
    if (item.quantidade!.compareTo(BigDecimal.ZERO()) > 0) {
      //Encontra a quantidade original do subitem para cada quantidade do item principal
      BigDecimal qtdePorItemPrincipal = item.quantidade!.dividir(qtdeAtual);
      item.quantidade = qtdePorItemPrincipal.multiplicar(qtdeNova);
    }

    item.subitens.forEach((element) {
      atualizaQuantidadeSubitens(element, qtdeAtual, qtdeNova);
    });
  }

//
  static bool verificaAlcoolica(NotaItem item) {
    if (item.produtoEmpresa != null &&
        item.produtoEmpresa!.produto!.fiscal!.especie == "BEBIDA_ALCOOLICA")
      return true;

    for (NotaItem subs in item.subitens) {
      if (verificaAlcoolica(subs)) return true;
    }

    return false;
  }

  static NotaItem preparaSerializacao(NotaItem item) {
    item.produtoEmpresa = null;
    item.nota = null;
    item.grade = null;
    item.vendedor = null;
    if (item.subitens.isNotEmpty) {
      item.subitens.forEach((subitem) {
        preparaSerializacao(subitem);
      });
    }
    return item;
  }
}
