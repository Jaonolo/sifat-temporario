import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CustomScrollbar extends StatefulWidget {
  const CustomScrollbar({
    Key? key,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.padding,
    this.primary,
    this.physics,
    this.controller,
    this.child,
    this.dragStartBehavior = DragStartBehavior.down,
    this.scrollbarColor,
    this.scrollbarThickness = 6.0,
    this.scrollBarVisible = true,
  }) : super(key: key);

  final Axis scrollDirection;
  final bool reverse;
  final EdgeInsets? padding;
  final bool? primary;
  final ScrollPhysics? physics;
  final ScrollController? controller;
  final Widget? child;
  final DragStartBehavior dragStartBehavior;
  final Color? scrollbarColor;
  final bool scrollBarVisible;
  final double scrollbarThickness;

  @override
  _CustomScrollbarState createState() => _CustomScrollbarState();
}

class _CustomScrollbarState extends State<CustomScrollbar> {
  AlwaysVisibleScrollbarPainter? _scrollbarPainter;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    rebuildPainter();
  }

  @override
  void didUpdateWidget(CustomScrollbar oldWidget) {
    super.didUpdateWidget(oldWidget);
    rebuildPainter();
  }

  void rebuildPainter() {
    final theme = Theme.of(context);
    _scrollbarPainter = AlwaysVisibleScrollbarPainter(
      color: widget.scrollbarColor ?? theme.highlightColor.withOpacity(1.0),
      textDirection: Directionality.of(context),
      thickness: widget.scrollbarThickness,
    );
  }

  @override
  void dispose() {
    _scrollbarPainter?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.scrollBarVisible)
      return SingleChildScrollView(
        scrollDirection: widget.scrollDirection,
        reverse: widget.reverse,
        primary: widget.primary,
        physics: widget.physics,
        controller: widget.controller,
        dragStartBehavior: widget.dragStartBehavior,
        child: Builder(
          builder: (BuildContext context) {
            return widget.child!;
          },
        ),
      );

    return RepaintBoundary(
      child: CustomPaint(
        foregroundPainter: _scrollbarPainter,
        child: RepaintBoundary(
          child: SingleChildScrollView(
            scrollDirection: widget.scrollDirection,
            reverse: widget.reverse,
            padding: widget.padding,
            primary: widget.primary,
            physics: widget.physics,
            controller: widget.controller,
            dragStartBehavior: widget.dragStartBehavior,
            child: Builder(
              builder: (BuildContext context) {
                _scrollbarPainter!.scrollable = Scrollable.of(context);
                return widget.child!;
              },
            ),
          ),
        ),
      ),
    );
  }
}

class AlwaysVisibleScrollbarPainter extends ScrollbarPainter {
  AlwaysVisibleScrollbarPainter({
    required Color color,
    required TextDirection textDirection,
    required double thickness,
  }) : super(
    color: color,
    textDirection: textDirection,
    thickness: thickness,
    fadeoutOpacityAnimation: const AlwaysStoppedAnimation(1.0),
  );

  ScrollableState? _scrollable;

  ScrollableState? get scrollable => _scrollable;

  set scrollable(ScrollableState? value) {
    _scrollable?.position.removeListener(_onScrollChanged);
    _scrollable = value;
    _scrollable?.position.addListener(_onScrollChanged);
    _onScrollChanged();
  }

  void _onScrollChanged() {
    update(_scrollable!.position, _scrollable!.axisDirection);
  }

  @override
  void dispose() {
    _scrollable?.position.removeListener(notifyListeners);
    super.dispose();
  }
}
