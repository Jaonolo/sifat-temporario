
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconeCarregando extends StatefulWidget {
  final double tamanho;

  const IconeCarregando({Key? key, this.tamanho = 60}) : super(key: key);

  @override
  State<IconeCarregando> createState() => _IconeCarregandoState();
}

class _IconeCarregandoState extends State<IconeCarregando>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        lowerBound: 0.05,
        duration: const Duration(milliseconds: 600),
        vsync: this)
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Container(
              height: widget.tamanho,
              width: widget.tamanho,
              child: const CircularProgressIndicator()),
          Container(
            height: widget.tamanho * 0.7,
            width: widget.tamanho * 0.7,
            child: FadeTransition(
              opacity: _animationController,
              child: ScaleTransition(
                scale: _animationController,
                child: Image.asset("assets/images/img.png"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
