import 'package:flutter/material.dart';

class PopupMenuMore extends StatefulWidget {
  final List<PopupMenuItem<Function>> items;
  final ValueChanged<int> onChange;
  final Widget child;
  final int selectedIndex;
  final Color color;
  final bool isOpenParent;
  final VoidCallback? onPress;
  final double offsetx;
  final double offsety;

  const PopupMenuMore({
    required this.items,
    required this.onChange,
    required this.child,
    required this.color,
    this.onPress,
    this.selectedIndex = 0,
    this.isOpenParent = false,
    this.offsetx = 0,
    this.offsety = 0,
  });

  @override
  _PopupMenuMoreState createState() => _PopupMenuMoreState();
}

class _PopupMenuMoreState extends State<PopupMenuMore>
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
    /*if (isMenuOpen && !widget.isOpenParent) {
      closeMenu();
    }*/
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
    if (isMenuOpen) {
      // if (widget.onPress != null) {
      //   widget.onPress!();
      // }
      closeMenu();
    }

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
          top: buttonPosition.dy + widget.offsety + 18,
          left: buttonPosition.dx + widget.offsetx - 126,
          child: Container(
            width: 126,
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
