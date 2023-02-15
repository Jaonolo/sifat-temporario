import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/widgets.dart';
import '../../../../app/icons_auto_atendimento/icons/icons_auto_atendimento.dart';
import 'carrinho_controller.dart';

class CarrinhoComponent {
  final CarrinhoController controller = Get.find();
  late BuildContext context;
  late double _height;
  late double _width;
  var count = 1.obs;

  initialize(BuildContext context) {
    this.context = context;

    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
  }

  body() {
    return Obx(() {
      return GestureDetector(
          onTap: () {
            if (controller.selected.value == false) controller.trocaSelecao();
          },
          child: AnimatedContainer(
            width: controller.selected.value ? _width / 2.3 : _width / 10,
            height: controller.selected.value ? _height : _height,
            color: Color.fromRGBO(249, 77, 24, 1),
            duration: const Duration(milliseconds: 200),
            curve: Curves.decelerate,
            child: conteudo(),
          ));
    });
  }

  conteudo() {
    return Visibility(
      visible: controller.visible.value,
      replacement: !controller.selected.value ? iconeCarrinho() : Container(),
      child: GestureDetector(
          onTap: () {
            if (controller.selected.value == true) controller.trocaSelecao();
          },
          child: listaCarrinho()),
    );
  }

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
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Container(
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
                                  child: Obx(
                                    () => Icon(
                                      count <= 1
                                          ? IconsAutoCarrinhoperson.trash
                                          : IconsAutoCarrinho.minus,
                                      size: 17,
                                      color: Color.fromRGBO(231, 74, 59, 1),
                                    ),
                                  ),
                                  onTap: () => count--,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Obx(
                                  () => Text(
                                    "$count",
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
                                   onTap: () => count++,
                                 ),
                               ),
                              Container(
                                child: Expanded(
                                  child: Text(
                                    'Cachorro quente com molho especial em dobro',
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(94, 94, 94, 1),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8, left: 8),
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
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Container(
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
                                  child: Obx(
                                        () => Icon(
                                      count <= 1
                                          ? IconsAutoCarrinhoperson.trash
                                          : IconsAutoCarrinho.minus,
                                      size: 17,
                                      color: Color.fromRGBO(231, 74, 59, 1),
                                    ),
                                  ),
                                  onTap: () => count--,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Obx(
                                      () => Text(
                                    "$count",
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
                                  onTap: () => count++,
                                ),
                              ),
                              Container(
                                child: Expanded(
                                  child: Text(
                                    'X Burguer',
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(94, 94, 94, 1),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8, left: 8),
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
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Container(
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
                                  child: Obx(
                                        () => Icon(
                                      count <= 1
                                          ? IconsAutoCarrinhoperson.trash
                                          : IconsAutoCarrinho.minus,
                                      size: 17,
                                      color: Color.fromRGBO(231, 74, 59, 1),
                                    ),
                                  ),
                                  onTap: () => count--,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Obx(
                                      () => Text(
                                    "$count",
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
                                  onTap: () => count++,
                                ),
                              ),
                              Container(
                                child: Expanded(
                                  child: Text(
                                    'X Burguer',
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(94, 94, 94, 1),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8, left: 8),
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
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Container(
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
                                  child: Obx(
                                        () => Icon(
                                      count <= 1
                                          ? IconsAutoCarrinhoperson.trash
                                          : IconsAutoCarrinho.minus,
                                      size: 17,
                                      color: Color.fromRGBO(231, 74, 59, 1),
                                    ),
                                  ),
                                  onTap: () => count--,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Obx(
                                      () => Text(
                                    "$count",
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
                                  onTap: () => count++,
                                ),
                              ),
                              Container(
                                child: Expanded(
                                  child: Text(
                                    'X Burguer',
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(94, 94, 94, 1),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8, left: 8),
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
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Container(
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
                                  child: Obx(
                                        () => Icon(
                                      count <= 1
                                          ? IconsAutoCarrinhoperson.trash
                                          : IconsAutoCarrinho.minus,
                                      size: 17,
                                      color: Color.fromRGBO(231, 74, 59, 1),
                                    ),
                                  ),
                                  onTap: () => count--,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Obx(
                                      () => Text(
                                    "$count",
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
                                  onTap: () => count++,
                                ),
                              ),
                              Container(
                                child: Expanded(
                                  child: Text(
                                    'X Burguer',
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(94, 94, 94, 1),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8, left: 8),
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
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Container(
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
                                  child: Obx(
                                        () => Icon(
                                      count <= 1
                                          ? IconsAutoCarrinhoperson.trash
                                          : IconsAutoCarrinho.minus,
                                      size: 17,
                                      color: Color.fromRGBO(231, 74, 59, 1),
                                    ),
                                  ),
                                  onTap: () => count--,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Obx(
                                      () => Text(
                                    "$count",
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
                                  onTap: () => count++,
                                ),
                              ),
                              Container(
                                child: Expanded(
                                  child: Text(
                                    'X Burguer',
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(94, 94, 94, 1),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8, left: 8),
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
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Container(
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
                                  child: Obx(
                                        () => Icon(
                                      count <= 1
                                          ? IconsAutoCarrinhoperson.trash
                                          : IconsAutoCarrinho.minus,
                                      size: 17,
                                      color: Color.fromRGBO(231, 74, 59, 1),
                                    ),
                                  ),
                                  onTap: () => count--,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Obx(
                                      () => Text(
                                    "$count",
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
                                  onTap: () => count++,
                                ),
                              ),
                              Container(
                                child: Expanded(
                                  child: Text(
                                    'X Burguer',
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(94, 94, 94, 1),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8, left: 8),
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
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Container(
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
                                  child: Obx(
                                        () => Icon(
                                      count <= 1
                                          ? IconsAutoCarrinhoperson.trash
                                          : IconsAutoCarrinho.minus,
                                      size: 17,
                                      color: Color.fromRGBO(231, 74, 59, 1),
                                    ),
                                  ),
                                  onTap: () => count--,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Obx(
                                      () => Text(
                                    "$count",
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
                                  onTap: () => count++,
                                ),
                              ),
                              Container(
                                child: Expanded(
                                  child: Text(
                                    'X Burguer',
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(94, 94, 94, 1),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8, left: 8),
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
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 8),
                        child: Container(
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
                                  child: Obx(
                                        () => Icon(
                                      count <= 1
                                          ? IconsAutoCarrinhoperson.trash
                                          : IconsAutoCarrinho.minus,
                                      size: 17,
                                      color: Color.fromRGBO(231, 74, 59, 1),
                                    ),
                                  ),
                                  onTap: () => count--,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: Obx(
                                      () => Text(
                                    "$count",
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
                                  onTap: () => count++,
                                ),
                              ),
                              Container(
                                child: Expanded(
                                  child: Text(
                                    'X Burguer',
                                    style: GoogleFonts.sourceSansPro(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color.fromRGBO(94, 94, 94, 1),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 8, left: 8),
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
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 35, right: 59),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
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

  iconeCarrinho() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: _height / 3,
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
}
