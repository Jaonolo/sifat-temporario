import 'dart:math';

import 'package:flutter/material.dart';
import 'cartao_animation.dart';
import 'cartao_back.dart';
import 'cartao_front.dart';

class Cartao extends StatefulWidget {
  const Cartao({Key? key}) : super(key: key);

  @override
  State<Cartao> createState() => _CartaoState();
}

class _CartaoState extends State<Cartao> with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _frontAnimation;
  late Animation<double> _backtAnimation;
  bool isFrontVisible = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 600),
        vsync: this,
    );
    _setupAnimation();
  }

  void _setupAnimation() {

    bool rotateToLeft = isFrontVisible;

    _frontAnimation = TweenSequence<double>([
      TweenSequenceItem<double>(
          tween: Tween<double>(
              begin: 0.0,
              end: rotateToLeft ? (pi / 2) : (-pi / 2)
          ).chain(CurveTween(curve: Curves.linear)),
          weight: 50,
      ),
      TweenSequenceItem<double>(
          tween: ConstantTween<double>(rotateToLeft ? (-pi / 2) : (pi / 2 )
          ),
          weight: 50,
      ),
    ]).animate(_controller);

    _backtAnimation = TweenSequence<double>([
      TweenSequenceItem(
          tween: ConstantTween<double>(
            rotateToLeft ? (pi / 2) : (-pi / 2),
              ),
          weight: 50,
      ),

      TweenSequenceItem(
          tween: Tween<double>(
            begin: rotateToLeft ? (-pi / 2) : (pi / 2),
            end: 0
          ).chain(CurveTween(curve: Curves.linear)),
          weight: 50
      ),

    ]).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              CartaoAnimacao(
                animation: _frontAnimation,
                  child: CartaoCreditoFront(),
              ),
              const SizedBox(height: 12,),
              CartaoAnimacao(
                animation: _backtAnimation,
                child: CartaoCreditoBack(),
              ),
            ],
          ),
          TextButton(
              onPressed: (){
                setState(() {
                  if(isFrontVisible) {
                    _controller.forward();
                    isFrontVisible = false;
                  }else {
                    _controller.reverse();
                    isFrontVisible = true;
                  }
                });
            },
              child: Text('Virar'),
          ),

        ],
      ),
    );
  }
}
