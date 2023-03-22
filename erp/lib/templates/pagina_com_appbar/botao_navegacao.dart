import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../pages/menu/botoes_class.dart';
import '../../widgets/personalizados/popup_menu_personalizado.dart';

class BotaoNavegacao extends StatefulWidget {
  final List<MenuEntries> items;
  final String text;
  final IconData? icon;
  final bool modoNoturno;
  
  const BotaoNavegacao({
    required this.items,
    required this.text,
    required this.icon,
    required this.modoNoturno
  });

  @override
  _EstadoBotaoNavegacao createState() => _EstadoBotaoNavegacao();
}

class _EstadoBotaoNavegacao extends State<BotaoNavegacao> {

  late List<MenuEntries> oldItems;
  late List<MenuEntries> items;
  
  final Neutral10 = Color.fromRGBO(255, 255, 255, 1);
  final Neutral30 = Color.fromRGBO(234, 247, 253, 1);
  final Neutral50 = Color.fromRGBO(194, 199, 207, 1);
  final Neutral80 = Color.fromRGBO(52, 55, 58, 1);
  final Neutral90 = Color.fromRGBO(33, 36, 38, 1);
  final Neutral100 = Color.fromRGBO(23, 28, 34, 1);
  final PrimaryBrand = Color.fromRGBO(19, 124, 185, 1);
  final Brand400 = Color.fromRGBO(35, 160, 232, 1);

  @override
  void initState() {
    items = widget.items;
    oldItems = [];

    super.initState();
  }

  Function() onClick(a) {
    return () => setState(() {
                        items = oldItems;
                        oldItems = a;
                      });
  }

  @override
  Widget build(context) {
    return SizedBox(
          height: 24,
          child: PopupMenuPersonalizado(
              //isOpenParent: e.key == widget.menuExibido,
              /*onPress: () {
                widget.exibirMenu(e.key);
              },*/
              onClose: () {
                setState(() {
                  items = widget.items;
                  oldItems = [];
                });
              },
              onChange: (a) {
                print(a);
                if(items[a].items.length != 0) {
                  setState(() {
                    List older = oldItems;
                    oldItems = items;
                    items = [MenuEntries(text: items[a].text, onClick: onClick(older)), ...items[a].items];
                  });
                } else {
                  items[a].onClick();
                }
              },
              color: widget.modoNoturno
                  ? Color.fromRGBO(44, 49, 55, 1)
                  : Neutral10,
              items: oldItems.length == 0 ? items
                  .map<PopupMenuItem<Function>>(_gerarItens)
                  .toList() : [
                    _botaoVolta(items[0]),
                    ...items.sublist(1).map<PopupMenuItem<Function>>(_gerarItens).toList()
                  ],
              child: Container(
                  color: widget.modoNoturno
                      ? Color.fromRGBO(33, 36, 38, 1)
                      : Color.fromRGBO(243, 243, 243, 1),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 9,
                    children: [
                      FaIcon(
                        widget.icon,
                        color: widget.modoNoturno ? Neutral10 : Neutral90,
                        size: 20,
                      ),
                      Text(widget.text,
                          style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: widget.modoNoturno
                                  ? Neutral10
                                  : Neutral90)),
                      Icon(Icons.expand_more,
                          color:
                              widget.modoNoturno ? Neutral10 : Neutral90),
                    ],
                  ),
                ),
              ),
        );
  }
  
    PopupMenuItem<Function> _gerarItens(MenuEntries e) => PopupMenuItem<Function>(
        padding: EdgeInsets.all(0),
        value: e.onClick,
        child: Padding(padding: EdgeInsets.only(right: 4), child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text(
              softWrap: true,
              style: GoogleFonts.sourceSansPro(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: widget.modoNoturno ? Neutral30 : Neutral80,
              ),
              e.text)),
            e.items.length == 0 ? SizedBox.shrink() : Icon(Icons.keyboard_arrow_right, color: widget.modoNoturno ? Neutral10 : Color.fromRGBO(50, 50, 50, 1) , size: 16,),
          ],),),
        );

    PopupMenuItem<Function> _botaoVolta(MenuEntries e) => PopupMenuItem<Function>(
        padding: EdgeInsets.all(0),
        value: e.onClick,
        child: Row(
          children: [
            Icon(Icons.keyboard_arrow_left, color: widget.modoNoturno ? Neutral10 : Color.fromRGBO(50, 50, 50, 1), size: 24,),
            SizedBox(height: 0, width: 8),
            Text(
              style: GoogleFonts.sourceSansPro(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: widget.modoNoturno ? Neutral30 : Neutral80,
              ),
              e.text,
              ),],
        ),
      );
}