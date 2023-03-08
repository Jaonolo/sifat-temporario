import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:models/model/models.dart';

import '../../widgets/responsive.dart';
import 'selecionar_empresa_page_controller.dart';

class SelecionarEmpresaPage extends GetView<SelecionarEmpresaPageController> {
  @override
  Widget build(BuildContext context) {
//-------------------------------------------------- VARIAVEIS ------------------------------------------------------------

//------------------------------------------------ EstruturaPrincipal -----------------------------------------------------

    return Scaffold(
      backgroundColor: controller.getTemaNoturnoAtivo
          ? Color.fromRGBO(33, 36, 38, 1)
          : Color.fromRGBO(252, 252, 255, 1),
      body: Responsive(
        mobile: Container(), //ainda sem Design Mobile criado.
        desktop: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 15),
          child: Column(children: [
            _AreaTopo(),
            _Divider(),
            _GridEmpresas(context),
          ]),
        ),
      ),
    );
  }

//-------------------------------------------------- WIDGETS --------------------------------------------------------------

  Widget _AreaTopo() {
    return Container(
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _TextoTopo(),
          _BotaoCancelarTopo(),
        ],
      ),
    );
  }

  Widget _TextoTopo() {
    return Flexible(
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Text(
          'Selecione a empresa para completar o login',
          softWrap: true,
          style: GoogleFonts.comfortaa(
            fontSize: 26,
            fontWeight: FontWeight.w500,
            color: controller.getTemaNoturnoAtivo
                ? Colors.white
                : Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
      ),
    );
  }

  Widget _BotaoCancelarTopo() {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: controller.getTemaNoturnoAtivo
              ? Color.fromRGBO(76, 149, 216, 1)
              : Color.fromRGBO(19, 124, 185, 1),
          padding: const EdgeInsets.symmetric(
            horizontal: 80.0,
            vertical: 16.0,
          ),
          textStyle: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        onPressed: () {
          controller.voltarTela();
        },
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            "Cancelar",
            style: GoogleFonts.sourceSansPro(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
              letterSpacing: 0.25,
            ),
          ),
        ),
      ),
    );
  }

  Widget _GridEmpresas(context) {
    return Expanded(
      child: Container(
        margin:
            EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.045),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 350,
            crossAxisSpacing: 25,
            mainAxisSpacing: 30,
            childAspectRatio: 5 / 2,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return _CardEmpresa();
          },
        ),
      ),
    );
  }

  Widget _CardEmpresa() {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        //controller.setEmpresaSelecionada(Empresa);
      },
      child: Card(
        color: controller.getTemaNoturnoAtivo
            ? Color.fromRGBO(62, 66, 70, 1)
            : Color.fromRGBO(253, 253, 253, 1),
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Expanded(flex: 3, child: _imagemCardEmpresa()),
            Expanded(flex: 5, child: _infosCardEmpresa(Empresa())),
          ],
        ),
      ),
    );
  }

  Widget _infosCardEmpresa(Empresa empresa) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          'Nome da Empresa',
          softWrap: true,
          style: GoogleFonts.comfortaa(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: controller.getTemaNoturnoAtivo
                ? Color.fromRGBO(194, 199, 207, 1)
                : Color.fromRGBO(0, 0, 0, 1),
          ),
        ),
        Text(
          'Matriz',
          style: GoogleFonts.sourceSansPro(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: controller.getTemaNoturnoAtivo
                ? Color.fromRGBO(194, 199, 207, 1)
                : Color.fromRGBO(140, 145, 153, 1),
          ),
        ),
        Text(
          'Número da loja: 03',
          style: GoogleFonts.sourceSansPro(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: controller.getTemaNoturnoAtivo
                ? Colors.white
                : Color.fromRGBO(52, 55, 58, 1),
          ),
        ),
      ],
    );
  }

  Widget _imagemCardEmpresa() {
    return Container(
        height: double.infinity,
        margin: EdgeInsets.only(right: 5),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
          child: Image.network(
              fit: BoxFit.cover,
              'https://i.ibb.co/BPHsPmm/Food-Logo-Template-png.png'),
        ));
  }

  Widget _Divider() {
    return Divider(
        color: controller.getTemaNoturnoAtivo
            ? Color.fromRGBO(255, 255, 255, 0.2)
            : Color.fromRGBO(0, 0, 0, 0.2));
  }
}
