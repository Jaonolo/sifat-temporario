import 'package:autoatendimento/app/app_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/adicional/produto_adicional_controller.dart';
import 'package:autoatendimento/app/modules/home/pages/produto/generic/widgets/produto_compomente/list_view_compomentes.dart';
import 'package:autoatendimento/app/utils/font_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CardProdutoMenu extends StatefulWidget {

  @override
  _CardProdutoMenuState createState() => _CardProdutoMenuState();
}

class _CardProdutoMenuState extends State<CardProdutoMenu> {
  final AppController appController = Modular.get();
  final ProdutoAdicionalController produtoAdicionalController = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Center(
                  child: Text(
                    produtoAdicionalController.produtoMenu!.descricao!.toUpperCase(),
                style: TextStyle(
                    fontSize: FontUtils.h3(context)),
              )),
              _mostrarQuantidade(),
              _listGenerate(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _mostrarQuantidade() {
    if (produtoAdicionalController.produtoMenu!.tipo == 'COMPONENTE_EXTRA' &&
        produtoAdicionalController.produtoMenu!.quantidadeMaxima != 0)
      return Center(
        child: Text(
            (produtoAdicionalController.produtoMenu!.quantidadeMaxima == 1)
                ? 'Escolha no máximo ${produtoAdicionalController.produtoMenu!.quantidadeMaxima} opção'
                : (produtoAdicionalController.produtoMenu!.quantidadeMaxima! > 1)
                    ? 'Escolha no máximo ${produtoAdicionalController.produtoMenu!.quantidadeMaxima} opções'
                    : '',
            style: TextStyle(fontSize: FontUtils.h4(context))),
      );
    else
      return Container();
  }

  Widget _listGenerate() {
    return ListViewCompomentes(produtoAdicionalController);
  }
}
