// import 'package:autoatendimento/app/modules/home/pages/splash/model/cardapio_dto.dart';
// import 'package:models/model/models.dart';
// import 'package:requester/config/pws_config.dart';
// import 'package:requester/requester/cardapio_requester.dart';
// import 'package:requester/requester/produto_empresa_requester.dart';
// import 'package:requester/requester/produto_menu_requester.dart';
// import 'package:requester/response/response_pws.dart';
//
// class CardapioRepository {
//   static Future<CardapioDTO> obterCardapioTipoItens(
//       PWSConfig config, String token, String idCardapio) async {
//     return await CardapioRequester.buscar(config, token, idCardapio)
//         .then((response) async {
//       if (response.isSuccess) {
//         List<CardapioMenu> cardapioMenus = [];
//
//         cardapioMenus = response.content;
//
//         List<ProdutoEmpresa> listProduto = [];
//         ResponsePws pws =
//             await ProdutoEmpresaRequester.buscarPaginado(config, token);
//         if (pws.isSuccess) {
//           listProduto = pws.content;
//         } else {
//           throw PwsException(pws.content);
//         }
//
//         List<ProdutoMenu> listMenu = [];
//         pws = await ProdutoMenuRequester.buscarPaginado(config, token);
//         if (pws.isSuccess) {
//           listMenu = pws.content;
//         } else {
//           throw PwsException(pws.content);
//         }
//
//         return _montaCardapioTipoItens(cardapioMenus, listProduto, listMenu);
//       } else {
//         throw WaybeException('Erro ao carregar cardapio',
//             exception: response.content);
//       }
//     }).catchError((e, s) {
//       print(e);
//       print(s);
//       if (e is WaybeException) throw e;
//       throw WaybeException('Erro ao carregar cardapio');
//     });
//   }
//
//   static Future<CardapioDTO> _montaCardapioTipoItens(
//       List<CardapioMenu> listCardapio,
//       List<ProdutoEmpresa> listProduto,
//       List<ProdutoMenu> listMenu) async {
//     //-------------------- Cria os Maps --------------------
//
//     Map<num, ProdutoMenu> mapMenus =
//         Map.fromIterable(listMenu, key: (pm) => pm.id, value: (pm) => pm);
//
//     Map<num, ProdutoEmpresa> mapProdutos =
//         Map.fromIterable(listProduto, key: (p) => p.id, value: (p) => p);
//
//     //-------------------- Alimenta os objetos ProdutoMenu --------------------
//
//     Map<num, Grade> mapGrade = Map<num, Grade>();
//     listProduto.forEach((p) {
//       p.produto!.grades.forEach((g) => mapGrade[g.id!] = g);
//     });
//
//     Map<num, GradeEmpresa> mapGradeEmpresa = Map<num, GradeEmpresa>();
//     listProduto.forEach((p) {
//       p.grades.forEach((ge) {
//         ge.produtoEmpresa = mapProdutos[ge.idProdutoEmpresa]!.clone();
//         mapGradeEmpresa[ge.id!] = ge;
//
//         mapGrade.forEach((k, g) {
//           if (ge.idGrade == g.id) {
//             g.idProduto = p.produto!.id;
//             ge.grade = g;
//           }
//         });
//       });
//     });
//
//     for (var k in mapMenus.keys) {
//       var produtoMenu = mapMenus[k];
//       List<ProdutoMenuComponente> componentesARemover = [];
//       for (ProdutoMenuComponente c in produtoMenu!.componentes) {
//         c.grade = mapGrade[c.idGrade];
//         for (ProdutoMenuComponenteEmpresa ce in c.componenteEmpresas) {
//           GradeEmpresa? gradeEmpresa = mapGradeEmpresa[ce.idGradeEmpresa];
//           if (gradeEmpresa == null) {
//             componentesARemover.add(c);
//           } else {
//             ce.gradeEmpresa = mapGradeEmpresa[ce.idGradeEmpresa];
//           }
//         }
//       }
//       for (ProdutoMenuComponente remove in componentesARemover) {
//         produtoMenu.componentes
//             .removeWhere((element) => element.id == remove.id);
//       }
//     }
//
//     //-------------------- Alimenta os objetos ProdutoEmpresa com os menus --------------------
//     mapProdutos.keys.forEach((k) {
//       List<ProdutoMenu> menus = [];
//       var produtoEmpresa = mapProdutos[k];
//       produtoEmpresa!.produto!.menus.forEach((m) {
//         if (mapMenus[m.id!] != null) menus.add(mapMenus[m.id!]!);
//       });
//
//       produtoEmpresa.produto!.menus = menus;
//     });
//
//     mapMenus.values.forEach((m) {
//       m.componentes.forEach((c) {
//         c.componenteEmpresas.forEach((ce) {
//           if (ce.gradeEmpresa != null) {
//             List<ProdutoMenu> menus = [];
//             if (ce.gradeEmpresa!.produtoEmpresa != null &&
//                 ce.gradeEmpresa!.produtoEmpresa!.produto != null) {
//               ce.gradeEmpresa!.produtoEmpresa!.produto!.menus.forEach((menu) {
//                 if (mapMenus[menu.id!] != null) menus.add(mapMenus[menu.id!]!);
//               });
//               ce.gradeEmpresa!.produtoEmpresa!.produto!.menus = menus;
//             }
//           }
//         });
//       });
//     });
//
//     //-------------------- Alimenta os dados dentro do menu do cardápio --------------------
//
//     listCardapio.forEach((cardapioMenu) {
//       if (cardapioMenu.tipo == "ITENS" && cardapioMenu.itens.isNotEmpty) {
//         List<ProdutoEmpresa> listProdutoEmpresa = [];
//         cardapioMenu.itens.forEach((element) {
//           if (mapProdutos[element.id!] != null) {
//             ProdutoEmpresa produtoEmpresa = (mapProdutos[element.id!]!);
//             listProdutoEmpresa.add(produtoEmpresa);
//           }
//         });
//         cardapioMenu.itens = listProdutoEmpresa;
//       }
//     });
//
//     CardapioDTO dto = CardapioDTO();
//     dto.listCardapioMenu = listCardapio;
//     dto.mapProdutos = mapProdutos;
//     dto.mapMenu = mapMenus;
//     return dto;
//   }
//
//   static Future<List<CardapioMenu>> atualizaCardapio(PWSConfig config, String token, List<CardapioMenu> listCardapioMenu,
//       Map<num, ProdutoEmpresa> mapProdutos) async {
//     List<int> listIdProdutosCardapio = [];
//     for (CardapioMenu cardapioMenu in listCardapioMenu){
//       if(cardapioMenu.itens.isNotEmpty){
//         for(ProdutoEmpresa produtoEmpresa in cardapioMenu.itens){
//           listIdProdutosCardapio.add(produtoEmpresa.id!);
//         }
//
//       }
//     }
//       ResponsePws pws = await ProdutoEmpresaRequester.validarProdutosCardapio(config, token, listIdProdutosCardapio);
//       if (pws.isSuccess) {
//         List<ProdutoEmpresa> listProdutoEmpresa = [];
//         List<String>? strings =  pws.body?.replaceAll("{", "").replaceAll("]", "").replaceAll("[", "").split(",");
//         listCardapioMenu.forEach((cardapioMenu) {
//           if (cardapioMenu.tipo == "ITENS" && cardapioMenu.itens.isNotEmpty) {
//             cardapioMenu.itens.forEach((element) {
//               if (strings!.contains(element.id.toString())) {
//                 ProdutoEmpresa produtoEmpresa = (mapProdutos[element.id!]!);
//                listProdutoEmpresa.add(produtoEmpresa);
//               }
//             });
//           }
//         });
//
//       if(listProdutoEmpresa.isNotEmpty){
//           for(ProdutoEmpresa produtoEmpresa in listProdutoEmpresa){
//             listCardapioMenu.forEach((cardapioMenu) {
//               cardapioMenu.itens.remove(produtoEmpresa);
//             });
//           }
//         }
//         return listCardapioMenu;
//       } else {
//         throw PwsException(pws.content);
//       }
//   }
//
// //  static Future<Map<num, ProdutoEmpresa>> obterCardapio(
// //      PWSConfig config, String token, String idCardapio) async {
// //    return await CardapioRequester.buscar(config, token, idCardapio)
// //        .then((response) async {
// //      if (response.isSuccess) {
// //        List<CardapioMenu> cardapioMenus = response.content;
// //
// //        List<ProdutoEmpresa> produtos;
// //        ResponsePws pws =
// //            await ProdutoEmpresaRequester.buscarPaginado(config, token);
// //        if (pws.isSuccess)
// //          produtos = pws.content;
// //        else
// //          throw PwsException(pws.content);
// //
// //        List<ProdutoMenu> menus;
// //        pws = await ProdutoMenuRequester.buscarPaginado(config, token);
// //        if (pws.isSuccess)
// //          menus = pws.content;
// //        else
// //          throw PwsException(pws.content);
// //
// //        List<ProdutoGrupo> grupos;
// //        pws = await ProdutoGrupoRequester.listar(config, token);
// //        if (pws.isSuccess)
// //          grupos = pws.content;
// //        else
// //          throw PwsException(pws.content);
// //
// //        return _montarCardapio(cardapioMenus, produtos, menus, grupos);
// //      } else {
// //        throw PwsException(response.content);
// //      }
// //    }).catchError((error, stackTrace) {
// //      print('[Erro] CardapioRequester.buscar() -> $error');
// //    });
// //  }
// //
// //  static Map<num, ProdutoEmpresa> _montarCardapio(
// //      List<CardapioMenu> listCardapio,
// //      List<ProdutoEmpresa> listProduto,
// //      List<ProdutoMenu> listMenu,
// //      List<ProdutoGrupo> listGrupo) {
// //    //-------------------- Cria os Maps --------------------
// //
// //    Map<num, ProdutoMenu> mapMenus =
// //        Map.fromIterable(listMenu, key: (pm) => pm.id, value: (pm) => pm);
// //
// //    Map<num, ProdutoEmpresa> mapProdutos =
// //        Map.fromIterable(listProduto, key: (p) => p.id, value: (p) => p);
// //
// //    Map<num, ProdutoGrupo> mapGrupos =
// //        Map.fromIterable(listGrupo, key: (g) => g.id, value: (g) => g);
// //    _preencherMapGrupo(listGrupo, mapGrupos);
// //
// //    //-------------------- Alimenta os objetos ProdutoMenu --------------------
// //
// //    Map<num, Grade> mapGrade = Map<num, Grade>();
// //    listProduto.forEach((p) {
// //      p.produto.grades.forEach((g) => mapGrade[g.id] = g);
// //    });
// //
// //    Map<num, GradeEmpresa> mapGradeEmpresa = Map<num, GradeEmpresa>();
// //    listProduto.forEach((p) {
// //      p.grades.forEach((ge) {
// //        ge.produtoEmpresa = mapProdutos[ge.idProdutoEmpresa].clone();
// //        mapGradeEmpresa[ge.id] = ge;
// //
// //        mapGrade.forEach((k, g) {
// //          if (ge.idGrade == g.id) {
// //            g.idProduto = p.produto.id;
// //            ge.grade = g;
// //          }
// //        });
// //      });
// //    });
// //
// //    mapMenus.keys.forEach((k) {
// //      var produtoMenu = mapMenus[k];
// //      produtoMenu.componentes.forEach((c) {
// //        c.grade = mapGrade[c.idGrade];
// //        c.componenteEmpresas.forEach((ce) {
// //          ce.gradeEmpresa = mapGradeEmpresa[ce.idGradeEmpresa];
// //        });
// //      });
// //    });
// //
// //    //-------------------- Alimenta os objetos ProdutoEmpresa com os menus --------------------
// //
// //    mapProdutos.keys.forEach((k) {
// //      List<ProdutoMenu> menus = [];
// //      var produtoEmpresa = mapProdutos[k];
// //
// //      produtoEmpresa.produto.menus.forEach((m) {
// //        menus.add(mapMenus[m.id]);
// //      });
// //
// //      produtoEmpresa.produto.menus = menus;
// //    });
// //
// //    mapMenus.values.forEach((m) {
// //      m.componentes.forEach((c) {
// //        c.componenteEmpresas.forEach((ce) {
// //          List<ProdutoMenu> menus = [];
// //          ce.gradeEmpresa.produtoEmpresa.produto.menus.forEach((menu) {
// //            menus.add(mapMenus[menu.id]);
// //          });
// //          ce.gradeEmpresa.produtoEmpresa.produto.menus = menus;
// //        });
// //      });
// //    });
// //
// //    //-------------------- Alimenta os objetos ProdutoGrupo --------------------
// //
// //    mapGrupos.forEach((key, grupo) {
// //      _preencherGrupo(grupo, listProduto);
// //    });
// //
// //    //-------------------- Alimenta os dados dentro do menu do cardápio --------------------
// //
// //    listCardapio.forEach((cm) {
// //      switch (cm.tipo) {
// //        case "ITEM":
// //          cm.produto = mapProdutos[cm.produto.id];
// //          break;
// //
// //        case "GRUPO":
// //          cm.grupo = mapGrupos[cm.idProdutoGrupo];
// //          break;
// //
// //        case "COMBINADO":
// //          List<ProdutoEmpresa> sabores = [];
// //          cm.combinadoSabores.forEach((cs) {
// //            sabores.add(mapProdutos[cs.id]);
// //          });
// //          cm.combinadoSabores = sabores;
// //          break;
// //      }
// //    });
// //
// //    return Map.from(mapProdutos);
// //  }
// //
// //  static void _preencherMapGrupo(
// //      List<ProdutoGrupo> listGrupo, Map<num, ProdutoGrupo> mapGrupos) {
// //    listGrupo.forEach((g) {
// //      if (!mapGrupos.containsKey(g.id)) {
// //        mapGrupos[g.id] = g;
// //      }
// //
// //      if (g.subgrupos != null && g.subgrupos.isNotEmpty)
// //        _preencherMapGrupo(g.subgrupos, mapGrupos);
// //    });
// //  }
// //
// //  static void _preencherGrupo(
// //      ProdutoGrupo grupo, List<ProdutoEmpresa> listProduto) {
// //    List<ProdutoEmpresa> matched =
// //        listProduto.where((p) => p.produto.idGrupo == grupo.id).toList();
// //    grupo.produtos = matched;
// //
// //    grupo.subgrupos.forEach((s) {
// //      _preencherGrupo(s, listProduto);
// //    });
// //  }
//
// }
