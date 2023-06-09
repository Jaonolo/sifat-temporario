import 'dart:math';

import 'package:flutter/material.dart';

class PopupMenuPersonalizado extends StatefulWidget {
  final List<PopupMenuItem<Function>> items;
  final ValueChanged<int> onChange;
  final Widget child;
  final int selectedIndex;
  final Color color;
  final bool isOpenParent;
  final VoidCallback? onPress;

  const PopupMenuPersonalizado({
    required this.items,
    required this.onChange,
    required this.child,
    required this.color,
    this.onPress,
    this.selectedIndex = 0,
    this.isOpenParent = false,
  });

  @override
  _PopupMenuPersonalizadoState createState() => _PopupMenuPersonalizadoState();
}

class _PopupMenuPersonalizadoState extends State<PopupMenuPersonalizado>
    with SingleTickerProviderStateMixin {
  late GlobalKey _key;
  late bool isMenuOpen;
  late Offset buttonPosition;
  late Size buttonSize;

  // lembrar de comentar depois
  late OverlayEntry _overlayEntry1;

  late AnimationController _animationController;

  @override
  void initState() {
    isMenuOpen = widget.isOpenParent;
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _key = LabeledGlobalKey('popup-button');

    // lembrar de comentar depois
    _overlayEntry1 = _overlayEntryBuilder1();

    super.initState();
  }

  // ANALISAR DPS URGENTE
  @override
  void didUpdateWidget(old) {
    if (isMenuOpen) {
      closeMenu();
    }
    super.didUpdateWidget(old);
  }

  @override
  void deactivate() {
    if (isMenuOpen) {
      // if (widget.onPress != null) {
      //   widget.onPress!();
      // }

      // lembrar de comentar depois
      //_overlayEntry1.remove();
    }
    super.deactivate();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  findButton() {
    RenderBox? renderBox =
        _key.currentContext!.findRenderObject() as RenderBox?;
    buttonSize = renderBox!.size;
    buttonPosition = renderBox.localToGlobal(Offset.zero);
  }

  closeMenu() {
    // lembrar de comentar depois
    //_overlayEntry1.remove();

    _animationController.reverse();

    // ANALISAR DPS
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  openMenu() {
    findButton();
    _animationController.forward();

    //lembrar de comentar depois
    //Overlay.of(context).insert(_overlayEntry1);

    // ANALISAR DPS
    setState(() {
      isMenuOpen = !isMenuOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (isMenuOpen) {
    //   // if (widget.onPress != null) {
    //   //   widget.onPress!();
    //   // }
    //   closeMenu();
    // }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        //isMenuOpen ? Popup() : SizedBox.shrink(),
        /*Stack(
          children: [
            isMenuOpen
                ? ColoredBox(
                    color: widget.color,
                    child: SizedBox(
                      width: double.infinity,
                      height: buttonSize.height,
                    ),
                  )
                : SizedBox.shrink(),*/
        Container(
          key: _key,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => {
              showModalBottomSheet(
                  isScrollControlled: true,
                  //constraints: BoxConstraints(minHeight: min((72 * widget.items.length).toDouble(), MediaQuery.of(context).size.height - 60)),
                  context: context,
                  builder: Popup),
              //if (widget.onPress != null) {widget.onPress!()}
            },
            child: widget.child,
          ),
        ),
        /*],
        ),*/
      ],
    );
  }

  Widget Popup(context) {
    print(widget.items.length);
    double buttons = (widget.items.length + 1) / 2;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: min((60 * widget.items.length).toDouble(),
                  MediaQuery.of(context).size.height) -
              80,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
            color: widget.color,
          ),
          child: Material(
            color: Colors.transparent,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  ...List.generate(
                    widget.items.length,
                    (index) {
                      return GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          widget.onChange(index);
                          closeMenu();
                        },
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: /*Row(
                                  children: [*/
                              widget.items[index].child,
                          /*ExpandIcon(
                                      isExpanded: isMenuOpen,
                                      onPressed: (o) {},
                                    )
                                  ],
                                ),*/
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        GestureDetector(
          child: widget.child,
          onTap: () => Navigator.pop(context),
        )
      ],
    );
  }

  OverlayEntry _overlayEntryBuilder1() {
    return OverlayEntry(
      builder: (context) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => {closeMenu()},
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
          ),
        );
      },
    );
  }
}
