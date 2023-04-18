import 'package:erp/pages/menu/botoes_class.dart';
import 'package:erp/widgets/personalizados/popup_menu_personalizado_2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Rodape extends StatefulWidget {
  final bool modoNoturno;
  final List<Botoes> botoesNavegacao;

  const Rodape({required this.modoNoturno, required this.botoesNavegacao});

  @override
  State<Rodape> createState() => _EstadoRodape();
}

class _EstadoRodape extends State<Rodape> {
  late final OverlayEntry overlay;
  final Neutral10 = Color.fromRGBO(255, 255, 255, 1);
  final Neutral30 = Color.fromRGBO(234, 247, 253, 1);
  final Neutral50 = Color.fromRGBO(194, 199, 207, 1);
  final Neutral80 = Color.fromRGBO(52, 55, 58, 1);
  final Neutral90 = Color.fromRGBO(33, 36, 38, 1);
  final Neutral100 = Color.fromRGBO(23, 28, 34, 1);
  final PrimaryBrand = Color.fromRGBO(19, 124, 185, 1);
  final Brand400 = Color.fromRGBO(35, 160, 232, 1);

  @override
  void didUpdateWidget(o) {
    /*WidgetsBinding.instance
      .scheduleFrameCallback((_) {
        overlay.markNeedsBuild();
      });*/

    super.didUpdateWidget(o);
  }

  @override
  void initState() {
    /*overlay = _iconeBusiness();
    WidgetsBinding.instance
        .scheduleFrameCallback((_) {
          print(context);
          Overlay.of(context).insert(overlay);
        });*/
    super.initState();
  }

  @override
  void deactivate() {
    //overlay.remove();

    super.deactivate();
  }

  @override
  Widget build(context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _estruturaFooter(),
        _botaoScrollarAcima(),
      ],
    );
  }

  PopupMenuItem<Function> _gerarItens(Widget child) => PopupMenuItem<Function>(
        padding: EdgeInsets.all(0),
        value: () {},
        child: SizedBox(
          width: double.infinity,
          child: child,
        ),
      );

  List<Widget> _gerarListaAlternada(List list, divisor) => List.generate(
        2 * list.length - 1,
        (i) => i % 2 == 0 ? list[i ~/ 2] : divisor,
      );

  Widget _estruturaFooter() {
    return PopupMenuPersonalizado(
      color: widget.modoNoturno ? Color.fromRGBO(44, 49, 55, 1) : Neutral10,
      items: _gerarListaAlternada(
          _gerarBotoesNavegacao(),
          Divider(
            color: widget.modoNoturno
                ? Color.fromRGBO(255, 255, 255, 0.2)
                : Color.fromRGBO(0, 0, 0, 0.2),
            thickness: 1,
            height: 1,
            indent: 28,
            endIndent: 28,
          )).map<PopupMenuItem<Function>>((e) => _gerarItens(e)).toList(),
      onChange: (a) {
        print("a");
      },
      child: Container(
        decoration: BoxDecoration(
          color: widget.modoNoturno
              ? Color.fromRGBO(33, 36, 38, 1)
              : Color.fromRGBO(243, 243, 243, 1),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 2),
                blurRadius: 10,
                color: Color.fromRGBO(0, 0, 0, 0.16)),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 20),
          height: 60,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Plataforma',
                style: GoogleFonts.sourceSansPro(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: widget.modoNoturno
                        ? Color.fromRGBO(255, 255, 255, 1)
                        : Color.fromRGBO(23, 28, 34, 1)),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: Icon(Icons.arrow_forward_ios,
                    size: 13,
                    color: widget.modoNoturno
                        ? Color.fromRGBO(243, 243, 243, 1)
                        : Color.fromRGBO(23, 28, 34, 1)),
              ),
              Text(
                'Contrato',
                style: GoogleFonts.sourceSansPro(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: widget.modoNoturno
                        ? Color.fromRGBO(255, 255, 255, 1)
                        : Color.fromRGBO(23, 28, 34, 1)),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }

  OverlayEntry _iconeBusiness() {
    return OverlayEntry(builder: (context) {
      return Positioned(
        left: (MediaQuery.of(context).size.width / 2) - 28,
        bottom: 80 - 28,
        child: Container(
          width: 56,
          height: 56,
          decoration: BoxDecoration(
            color: widget.modoNoturno
                ? Color.fromRGBO(33, 36, 38, 1)
                : Color.fromRGBO(243, 243, 243, 1),
            borderRadius: BorderRadius.circular(50),
            boxShadow: widget.modoNoturno
                ? null
                : [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 0.1,
                      blurRadius: 0.1,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              decoration: BoxDecoration(
                color: widget.modoNoturno
                    ? Color.fromRGBO(52, 55, 58, 1)
                    : Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 0.5,
                    blurRadius: 0.5,
                    offset: Offset(0, 2), // changes position of shadow
                  ),
                ],
              ),
              child: Icon(
                Icons.business,
                size: 30,
                color: Color.fromRGBO(35, 160, 232, 1),
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _botaoScrollarAcima() {
    return Positioned(
      bottom: 48,
      right: 10,
      child: InkWell(
          onTap: () {},
          child: Icon(
            size: 25,
            Icons.expand_less_rounded,
            color: Color.fromRGBO(35, 160, 232, 1),
          )),
    );
  }

  /*List<Widget> _gerarBotoesNavegacao() => _botoesNavegacao
      .asMap()
      .entries
      .map(
        (e) => SizedBox(
          height: 24,
          child: Obx(
            () => PopupMenuPersonalizado(
              //isOpenParent: e.key == controller.menuExibido,
              /*onPress: () {
                controller.exibirMenu(e.key);
              },*/
              onChange: (a) {},
              color: controller.widget.modoNoturno
                  ? Color.fromRGBO(44, 49, 55, 1)
                  : Neutral10,
              items: e.value.items
                  .map<PopupMenuItem<Function>>(_gerarItens)
                  .toList(),
              child: Obx(
                () => Container(
                  color: controller.widget.modoNoturno
                      ? Color.fromRGBO(33, 36, 38, 1)
                      : Color.fromRGBO(243, 243, 243, 1),
                  child: Wrap(
                    key: _keysBotoes[e.key],
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 9,
                    children: [
                      FaIcon(
                        e.value.icon,
                        color: controller.widget.modoNoturno ? Neutral10 : Neutral90,
                        size: 20,
                      ),
                      Text(e.value.text,
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: controller.widget.modoNoturno
                                  ? Neutral10
                                  : Neutral90)),
                      Icon(Icons.expand_more,
                          color:
                              controller.widget.modoNoturno ? Neutral10 : Neutral90),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )
      .toList();*/

  List<Widget> _gerarBotoesNavegacao() => widget.botoesNavegacao
      .map(
        (e) => Container(
          height: 72,
          padding: EdgeInsets.all(28),
          child: Row(
            //key: _keysBotoes[e.key],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 11,
                children: [
                  FaIcon(
                    e.icon,
                    color: widget.modoNoturno ? Neutral10 : Neutral90,
                    size: 20,
                  ),
                  Text(
                    e.text,
                    style: GoogleFonts.sourceSansPro(
                        fontSize: 19,
                        fontWeight: FontWeight.w600,
                        color: widget.modoNoturno ? Neutral10 : Neutral90),
                  ),
                ],
              ),
              Icon(Icons.expand_more,
                  color: widget.modoNoturno ? Neutral10 : Neutral90),
            ],
          ),
        ),
      )
      .toList();
}
