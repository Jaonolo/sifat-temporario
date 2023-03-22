import 'package:flutter/material.dart';

class PopupMenuPersonalizado extends StatefulWidget {
  final List<PopupMenuItem<Function>> items;
  final ValueChanged<int> onChange;
  final Widget child;
  final int selectedIndex;
  final Color color;
  final bool isOpenParent;
  final VoidCallback? onPress;
  final VoidCallback? onClose;

  const PopupMenuPersonalizado({
    required this.items,
    required this.onChange,
    required this.child,
    required this.color,
    this.onPress,
    this.onClose,
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
  late OverlayEntry _overlayEntry;

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
    _overlayEntry = _overlayEntryBuilder();

    // lembrar de comentar depois
    _overlayEntry1 = _overlayEntryBuilder1();

    super.initState();
  }

  @override
  void didUpdateWidget(old) {
    if(widget.items == old.items) {
      closeMenu();
    } else {
      WidgetsBinding.instance
      .scheduleFrameCallback((_) {
        _overlayEntry.markNeedsBuild();
      });
    }
    super.didUpdateWidget(old);
  }

  @override
  void deactivate() {
    if (isMenuOpen) {
      // if (widget.onPress != null) {
      //   widget.onPress!();
      // }
      _overlayEntry.remove();

      // lembrar de comentar depois
      _overlayEntry1.remove();
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
    _overlayEntry.remove();

    // lembrar de comentar depois
    _overlayEntry1.remove();

    _animationController.reverse();
    isMenuOpen = !isMenuOpen;

    if (widget.onClose != null) {
      widget.onClose!();
    }
  }

  openMenu() {
    findButton();
    _animationController.forward();

    //lembrar de comentar depois
    Overlay.of(context).insert(_overlayEntry1);
    Overlay.of(context).insert(_overlayEntry);

    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      child: GestureDetector(
                              behavior: HitTestBehavior.opaque,

        onTap: () => {
          if (widget.onPress != null) {widget.onPress!()},
          if (isMenuOpen) {closeMenu()} else {openMenu()}
        },
        child: widget.child,
      ),
    );
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        return Positioned(
          top: buttonPosition.dy + buttonSize.height + 20,
          left: buttonPosition.dx,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            width: buttonSize.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: widget.color,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 2),
                    blurRadius: 10,
                    color: Color.fromRGBO(0, 0, 0, 0.18),
                  )
                ]),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  widget.items.length,
                  (index) {
                    return GestureDetector(
                                            behavior: HitTestBehavior.opaque,

                      onTap: () {
                        widget.onChange(index);

                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 4),
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
              ),
            ),
          ),
        );
      },
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
