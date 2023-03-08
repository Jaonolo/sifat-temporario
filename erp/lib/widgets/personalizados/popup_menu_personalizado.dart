import 'package:flutter/material.dart';

class PopupMenuPersonalizado extends StatefulWidget {
  final List<PopupMenuItem<Function>> items;
  final ValueChanged<int> onChange;
  final Widget child;
  final int selectedIndex;
  final Color color;

  const PopupMenuPersonalizado({
    required this.items,
    required this.onChange,
    required this.child,
    required this.color,
    this.selectedIndex = 0,
  });

  @override
  _PopupMenuPersonalizadoState createState() => _PopupMenuPersonalizadoState();
}

class _PopupMenuPersonalizadoState extends State<PopupMenuPersonalizado>
    with SingleTickerProviderStateMixin {
  late GlobalKey _key;
  bool isMenuOpen = false;
  late Offset buttonPosition;
  late Size buttonSize;
  late OverlayEntry _overlayEntry;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
    _key = LabeledGlobalKey('popup-button');
    _overlayEntry = _overlayEntryBuilder();
    super.initState();
  }

  /*@override
  void didUpdateWidget(old) {
    super.didUpdateWidget(old);
    print('''
      ${buttonSize.width}\n
      ${buttonSize.height}\n
      ${buttonPosition.dx}\n
      ${buttonPosition.dy}\n
    ''');
  }*/

  /*@override
  void didUpdateWidget(old) {
    _overlayEntry.markNeedsBuild();
    super.didUpdateWidget(old);
  }*/

  @override
  void deactivate() {
    if (isMenuOpen) {
      _overlayEntry.remove();
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
    _animationController.reverse();
    isMenuOpen = !isMenuOpen;
  }

  openMenu() {
    findButton();
    _animationController.forward();
    print(context.widget);
    Overlay.of(context).insert(_overlayEntry);
    isMenuOpen = !isMenuOpen;
  }

  @override
  Widget build(BuildContext context) {
    print("salve");
    /*if (isMenuOpen) {
      _overlayEntry.remove();
      Overlay.of(context).insert(_overlayEntry);
    }*/

    return Container(
      key: _key,
      child: GestureDetector(
        onTap: () => {
          if (isMenuOpen) {closeMenu()} else {openMenu()}
        },
        child: widget.child,
      ),
    );
  }

  OverlayEntry _overlayEntryBuilder() {
    return OverlayEntry(
      builder: (context) {
        print("teste");
        return Positioned(
          top: buttonPosition.dy + buttonSize.height + 20,
          left: buttonPosition.dx,
          child: Container(
            padding: EdgeInsets.all(10),
            width: buttonSize.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6)),
                color: widget.color,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 2),
                      blurRadius: 10,
                      color: Color.fromRGBO(0, 0, 0, 0.18))
                ]),
            child: Material(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  widget.items.length,
                  (index) {
                    return GestureDetector(
                      onTap: () {
                        widget.onChange(index);
                        closeMenu();
                      },
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        color: index == widget.selectedIndex
                            ? Colors.white.withOpacity(0.3)
                            : null,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: widget.items[index].child,
                        ),
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
}
