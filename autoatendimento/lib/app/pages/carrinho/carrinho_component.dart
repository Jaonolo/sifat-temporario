import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';
import 'package:models/model/models.dart';
import '../../../../app/icons_auto_atendimento/icons/icons_auto_atendimento.dart';
import 'carrinho_controller.dart';
import 'package:badges/badges.dart' as badges;

class CarrinhoComponent {
  final CarrinhoController controller = Get.find();
  late BuildContext context;
  late double _height;
  late double _width;
  var count = 1.obs;
  List<Produto> produtos = [];


  initialize(BuildContext context) {
    this.context = context;

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
  }

  // ***** TAMANHO E ANIMAÇÃO DO CONTAINER *****
  body() {
    return Obx(() {
      return GestureDetector(
          onTap: () {},
          child: AnimatedContainer(
            width: controller.selected.value ? _width / 2.3 : _width / 10,
            height: controller.selected.value ? _height : _height,
            color: Color.fromRGBO(249, 77, 24, 1),
            duration: const Duration(milliseconds: 250),
            curve: Curves.decelerate,
            child: conteudo(),
          ));
    });
  }

  // ***** TROCA A VISIBILIDADE DO CONTEÚDO DO CARRINHO FECHADO PELO CONTEÚDO DO CARRINHO ABERTO ****
  conteudo() {
    return Visibility(
      visible: controller.visible.value,
      replacement: !controller.selected.value ? iconeCarrinho() : Container(),
      child: GestureDetector(onTap: () {}, child: listaCarrinho()),
    );
  }

  // **** WIDGETS QUE COMPÕEM O CARRINHO ABERTO ****
  listaCarrinho() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 26, right: 11, bottom: 20, top: 16),
          child: Row(
            children: [
              Expanded(
                flex: 88,
                child: Text(
                  'Meu Carrinho',
                  style: GoogleFonts.righteous(
                    fontSize: 35,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: _height / 9,
                width: _width / 15,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(
                    IconsAutoCarrinho.close,
                    size: 40,
                    color: Color.fromRGBO(231, 74, 59, 1),
                  ),
                  onPressed: () {
                    controller.trocaSelecao();
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          width: _width / 2.5,
          height: _height / 1.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 16, left: 36, bottom: 2),
                    child: Text(
                      'Para Viagem',
                      style: GoogleFonts.sourceSansPro(
                        fontSize: 16,
                        color: Color.fromRGBO(94, 94, 94, 1),
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 35, right: 37, bottom: 15),
                child: Divider(thickness: 1),
              ),
              // **** LISTA DOS PRODUTOS ADICIONADOS ****
              Expanded(
                  child: ListView.separated(
                      padding: EdgeInsets.only(left: 34, right: 50),
                      itemBuilder: (context, index) => produtoCarrinho(index),
                      separatorBuilder: (context, index) =>
                          Padding(padding: EdgeInsets.only(top: 8)),
                      itemCount: controller.list.value.length),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35, right: 59),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () => confirmarLimparCarrinho(),
                      child: Text(
                        'Limpar Carrinho',
                        style: GoogleFonts.sourceSansPro(
                          fontSize: 16,
                          color: Color.fromRGBO(231, 74, 59, 1),
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Total: R\$25,00',
                      style: GoogleFonts.sourceSansPro(
                        fontSize: 24,
                        color: Color.fromRGBO(0, 150, 93, 1),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 45),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: _width / 2.5,
              height: _height / 11,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  'Pagar',
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 30,
                    color: Color.fromRGBO(249, 77, 24, 1),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 15),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: _width / 2.5,
              height: _height / 11,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Center(
                child: Text(
                  'Cancelar pedido',
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  // **** ICONE DO CARRINHO QUANDO ELE ESTIVER FECHADO ****
  iconeCarrinho() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          count != 0
              ? badges.Badge(
                  badgeAnimation: badges.BadgeAnimation.slide(),
                  badgeContent: Text(
                    controller.list.length.toString(),
                    style: TextStyle(
                      color: Color.fromRGBO(46, 46, 46, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  position: badges.BadgePosition.topEnd(end: 3, top: -12),
                  badgeStyle: badges.BadgeStyle(
                      borderSide: BorderSide(
                        color: Color.fromRGBO(249, 77, 24, 1),
                        width: 4,
                      ),
                      elevation: 0,
                      badgeColor: Color.fromRGBO(244, 179, 76, 1),
                      padding: EdgeInsets.all(14)),
                  child: Container(
                    height: _height / 7,
                    width: _width / 12,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      icon: Icon(
                        IconsCarrinhoPerson.bxs_cart,
                        size: 60,
                        color: Color.fromRGBO(231, 74, 59, 1),
                      ),
                      onPressed: () {
                        controller.trocaSelecao();
                      },
                    ),
                  ),
                )
              : Container(
                  height: _height / 7,
                  width: _width / 12,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(
                      IconsCarrinhoPerson.bxs_cart,
                      size: 60,
                      color: Color.fromRGBO(231, 74, 59, 1),
                    ),
                    onPressed: () {
                      controller.trocaSelecao();
                    },
                  ),
                ),
        ],
      ),
    );
  }

  produtoCarrinho(int index) {
    return Obx(()=>
      Container(
        width: _width / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Color.fromRGBO(245, 245, 245, 1),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: GestureDetector(
                child: Icon(
                    controller.list.value[index].quantidade! <= BigDecimal.ONE()
                        ? IconsAutoCarrinhoperson.trash
                        : IconsAutoCarrinho.minus,
                    size: 20,
                    color: Color.fromRGBO(231, 74, 59, 1),
                  ),
                onTap: () => confirmarExclusaoProduto( controller.list.value[index]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Obx(
                () => Text(
                  controller.list.value[index].quantidade.toString(),
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(94, 94, 94, 1),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 7, right: 12),
              child: GestureDetector(
                child: Icon(
                  IconsAutoCarrinho.plus,
                  size: 19,
                  color: Color.fromRGBO(235, 76, 27, 1),
                ),
                onTap: () => controller.addProduto(controller.list.value[index]),
              ),
            ),
            Container(
              child: Expanded(
                child: Text(
                  controller.list.value[index].descricao!,
                  style: GoogleFonts.sourceSansPro(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(94, 94, 94, 1),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Text(
                'R\$25,00',
                style: GoogleFonts.sourceSansPro(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(0, 150, 93, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // **** ALERT DIALOG SOBRE A EXCLUSÃO DOS ITENS UNITÁRIOS ****
  confirmarExclusaoProduto(NotaItem notaItem){
    if (notaItem.quantidade! == BigDecimal.ONE()) {
      Get.dialog(
        AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80),
          ),
          title: Container(
            width: _width / 1.7,
            height: _height / 1.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 23),
                  child: Text(
                    'Excluir produto',
                    style: GoogleFonts.righteous(
                      fontSize: 60,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(187, 59, 19, 1),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    'Esse produto será retirado do seu \n carrinho',
                    style: GoogleFonts.sourceSansPro(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(94, 94, 94, 1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 80, top: 130),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Container(
                          width: _width / 4.5,
                          height: _height / 8,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Color.fromRGBO(235, 76, 27, 1)),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              'Cancelar',
                              style: GoogleFonts.sourceSansPro(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Color.fromRGBO(235, 76, 27, 1),
                              ),
                            ),
                          ),
                        ),
                        onTap: () => Get.back(),
                      ),
                      SizedBox(width: 27),
                      GestureDetector(
                        onTap: () => controller.deletarProduto(notaItem),
                        child: Container(
                          width: _width / 4.5,
                          height: _height / 8,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(235, 76, 27, 1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              'Excluir',
                              style: GoogleFonts.sourceSansPro(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else if ( notaItem.quantidade! == BigDecimal.ZERO()) {
      null;
    }else {
      notaItem.quantidade!.subtrair(BigDecimal.ONE());
    }

  }

  // **** ALERT DIALOG SOBRE A EXCLUSÃO DA LISTA DE ITENS  ****
  confirmarLimparCarrinho() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
        title: Container(
          width: _width / 1.7,
          height: _height / 1.5,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 40, bottom: 23),
                child: Center(
                  child: Text(
                    'Limpar o carrinho',
                    style: GoogleFonts.righteous(
                      fontSize: 60,
                      fontWeight: FontWeight.w400,
                      color: Color.fromRGBO(187, 59, 19, 1),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 50, right: 50, bottom: 130),
                child: Center(
                  child: Text(
                    'Você deseja excluir todos os \n produtos do seu carrinho?',
                    style: GoogleFonts.sourceSansPro(
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(94, 94, 94, 1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: Container(
                      width: _width / 4.5,
                      height: _height / 8,
                      decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Color.fromRGBO(235, 76, 27, 1)),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          'Cancelar',
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Color.fromRGBO(235, 76, 27, 1),
                          ),
                        ),
                      ),
                    ),
                    onTap: () => Get.back(),
                  ),
                  SizedBox(width: 25),
                  GestureDetector(
                    child: Container(
                      width: _width / 4.5,
                      height: _height / 8,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(235, 76, 27, 1),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          'Sim',
                          style: GoogleFonts.sourceSansPro(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      controller.deletarListaProduto();
                      Navigator.of(context).pop();
                    }
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
