import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/home_component.dart';
import 'package:autoatendimento/app/modules/home/home_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/adicional/produto_adicional_page.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/combo/produto_combo_page.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/composto/produto_composto_page.dart';
import 'package:autoatendimento/app/modules/venda/models/produto_carrinho.dart';
import 'package:autoatendimento/app/modules/venda/produto_carrinho_utils.dart';
import 'package:autoatendimento/app/modules/venda/venda_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:models/model/enum/tipo_item.dart';
import 'package:models/model/models.dart';
import 'package:utils/utils/nota_item_utils.dart';

import 'card_cardapio.dart';

class BuildCardCardapio {
  static AppController appController = Modular.get();
  static VendaController vendaController = Modular.get();
  static HomeController homeController = Modular.get();

  static Widget create({ProdutoEmpresa? produtoEmpresa,
    GradeEmpresa? gradeEmpresa,
    required BuildContext context}) {
    try {
      _validacoes(produtoEmpresa!);
    } catch (e) {
      print(e);
      return CardCardapio(() {}, '', e.toString(), '');
    }

    //grade empresa so é passado quando o item tem variaçoes
    if (gradeEmpresa != null) {
      return CardCardapio(() =>
          _functionCardFinal(
              produtoEmpresa, context, gradeTamanho: gradeEmpresa),
          produtoEmpresa.produto?.arquivoPrincipal() != null
              ? produtoEmpresa.produto!.arquivoPrincipal()!.link!
              : "",
          gradeEmpresa.grade!.tamanho!.descricao!,
          'R\$ ${gradeEmpresa.precoVenda(appController.tabelaPreco.id!)
              .toStringAsFixed(2)}');
    }

    if (produtoEmpresa.produto!.grade != "NENHUMA" && gradeEmpresa == null) {
      return _createCardVariacao(produtoEmpresa, context);
    }

    return _createCardFinal(
        produtoEmpresa, produtoEmpresa.gradePadrao!, context);
  }

  //Opções de cards

  static Widget _createCardVariacao(ProdutoEmpresa produtoEmpresa,
      BuildContext context) {
    GradeEmpresa gradeMaisBarata = produtoEmpresa.gradesAtivas[0];
    produtoEmpresa.gradesAtivas.forEach((element) {
      if (element.precoVenda(appController.tabelaPreco.id!).compareTo(
          gradeMaisBarata.precoVenda(appController.tabelaPreco.id!)) <
          0) gradeMaisBarata = element;
    });

    return CardCardapio(() =>
        _functionCardVariacao(produtoEmpresa, context),
      produtoEmpresa.produto!.arquivoPrincipal() != null
          ? produtoEmpresa.produto!.arquivoPrincipal()!.link!
          : "",
      produtoEmpresa.produto!.descricaoAbreviada!,
      'A partir de R\$ ${gradeMaisBarata.precoVenda(
          appController.tabelaPreco.id!).toStringAsFixed(2)}',
      subdescricao: '',
    );
  }

  static Widget _createCardFinal(ProdutoEmpresa produtoEmpresa,
      GradeEmpresa gradeEmpresa, BuildContext context) {
    String price;
    if (produtoEmpresa.produto!.pacote.equals(TipoPacote.COMBO)) {
      price =
      "A partir de R\$ ${gradeEmpresa.precoVenda(appController.tabelaPreco.id!)
          .toStringAsFixed(2)}";
    } else {
      price =
      'R\$ ${gradeEmpresa.precoVenda(appController.tabelaPreco.id!)
          .toStringAsFixed(2)}';
    }

    return CardCardapio(() =>
        _functionCardFinal(produtoEmpresa, context),
      produtoEmpresa.produto!.arquivoPrincipal() != null
          ? produtoEmpresa.produto!.arquivoPrincipal()!.link!
          : "",
      produtoEmpresa.produto!.descricaoAbreviada!,
      price,
      subdescricao: '',
    );
  }

  //Functions

  static Function _functionCardVariacao(ProdutoEmpresa produtoEmpresa,
      BuildContext context) {
    //atualiza o palco para as variaçoes do item utilizando o mesmo cardapio da home
    return () {
      homeController.addPalco(
          HomeComponent().cardapio(produtoEmpresa: produtoEmpresa, c: context));
    };
  }

  static Function _functionCardFinal(ProdutoEmpresa produtoEmpresa,
      BuildContext context,
      {GradeEmpresa? gradeTamanho}) {
    return () async {
      try {
        //Verifica se a nota é null
        if (vendaController.nota.id == null) {
          await vendaController.insereNotaAPI(context);
        }
        appController.reiniciaTimer();
        switch (produtoEmpresa.produto!.pacote) {
          case TipoPacote.NENHUM:
            GradeEmpresa? grade = gradeTamanho != null
                ? gradeTamanho
                : produtoEmpresa.gradePadrao;

            if (_validaPrecoZero(grade!)) return;

            var notaItem = NotaItemUtils.instanciar(vendaController.nota.id!,
                TipoItem.ITEM, produtoEmpresa, appController.tabelaPreco.id!,
                gradeEmpresa: grade);

            if (NotaItemUtils.verificaAlcoolica(notaItem, (idProdutoEmpresa){
              return appController.mapProdutos[idProdutoEmpresa];
            })) {
              bool permitido =
              await ProdutoCarrinhoUtils.podeVenderBebidaAlcoolica(
                  notaItem);
              if (!permitido) {
                throw Exception('Venda de bebida alcoolica não permitida');
              }
            }

            vendaController.adicionarProdutoCarrinho(ProdutoCarrinho(notaItem));
            break;
          case TipoPacote.ADICIONAIS:
            homeController.habilitarCarrinho = true;
            GradeEmpresa? grade = gradeTamanho != null
                ? gradeTamanho
                : produtoEmpresa.gradePadrao;
            if (_validaPrecoZero(grade!)) return;

            var notaItem = NotaItemUtils.instanciar(vendaController.nota.id!,
                TipoItem.ITEM, produtoEmpresa, appController.tabelaPreco.id!,
                gradeEmpresa: grade);

            if(notaItem.grade!.produtoEmpresa!.produto!.menus.isNotEmpty) {
              homeController
                  .addPalco(ProdutoAdicionalPage(ProdutoCarrinho(notaItem)));
            } else {
              homeController.habilitarCarrinho = false;
              if (NotaItemUtils.verificaAlcoolica(notaItem, (idProdutoEmpresa) {
                return appController.mapProdutos[idProdutoEmpresa];
              })) {
                bool permitido =
                    await ProdutoCarrinhoUtils.podeVenderBebidaAlcoolica(
                        notaItem);
                if (!permitido) {
                  throw Exception('Venda de bebida alcoolica não permitida');
                }
              }

              vendaController
                  .adicionarProdutoCarrinho(ProdutoCarrinho(notaItem));
            }
            break;
          case TipoPacote.COMBO:
            homeController.habilitarCarrinho = true;
            var notaItem = NotaItemUtils.instanciar(vendaController.nota.id!,
                TipoItem.COMBO, produtoEmpresa, appController.tabelaPreco.id!);
            homeController
                .addPalco(ProdutoComboPage(ProdutoCarrinho(notaItem)));
            break;
          case TipoPacote.COMPOSTO:
            homeController.habilitarCarrinho = true;
            var notaItem = NotaItemUtils.instanciar(vendaController.nota.id!,
                TipoItem.COMPOSTO, produtoEmpresa, appController.tabelaPreco.id!);
            homeController.addPalco(ProdutoCompostoPage(ProdutoCarrinho(notaItem)));
            break;

          default:
            throw Exception("TipoPacote não implementado");
        }
      } catch (e, s) {
        print('## [ERRO] _functionCardFinal');
        print(e);
        print(s);
      }
    };
  }

  static void _validacoes(ProdutoEmpresa? produtoEmpresa) {
    if (produtoEmpresa == null) {
      throw Exception('Impossível criar CardCardapio: produtoEmpresa null');
    }

    if (produtoEmpresa.gradesAtivas.isEmpty) {
      throw Exception(
          'Impossível criar CardCardapio: [idProdutoEmpresa: ${produtoEmpresa
              .id}] nenhuma grade ativa');
    }

    if (produtoEmpresa.gradesAtivas.length < 1 &&
        produtoEmpresa.gradePadrao == null) {
      throw Exception(
          'Impossível criar CardCardapio: [idProdutoEmpresa: ${produtoEmpresa
              .id}] nenhuma grade padrão');
    }
  }

  static bool _validaPrecoZero(GradeEmpresa gradeEmpresa) {
    if (gradeEmpresa
        .precoVenda(appController.tabelaPreco.id!)
        .compareTo(BigDecimal.ZERO()) ==
        0) {
      print('#### Produto com valor zero #######');
      return true;
    }
    return false;
  }
}
