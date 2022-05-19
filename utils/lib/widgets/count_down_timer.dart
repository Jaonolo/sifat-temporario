import 'dart:math' as math;

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CountDownTimer extends StatefulWidget {
  String label;
  Duration duration;
  Color progressColor;
  bool showButton;
  bool autoStart;
  Function? onTimerEnd;

  CountDownTimer({required this.label,
    required this.duration,
    this.progressColor = Colors.red,
    this.showButton = true,
    this.autoStart = false,
    this.onTimerEnd});

  @override
  _CountDownTimerState createState() => _CountDownTimerState();
}

class _CountDownTimerState extends State<CountDownTimer>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  late bool started;
  AnimationController? controller;

  String get timerString {
    Duration duration = controller!.duration! * controller!.value;
    if (widget.onTimerEnd != null && started) {
      var zero = Duration();
      if (duration == zero) {
        started = false;
        widget.onTimerEnd!();
      }
    }
    return '${duration.inMinutes}:${(duration.inSeconds % 60)
        .toString()
        .padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    started = false;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.autoStart) {
        start();
        started = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller!,
        builder: (context, child) {
          return Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.center,
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: CustomPaint(
                                    painter: CustomTimerPainter(
                                      animation: controller,
                                      backgroundColor: Colors.white,
                                      color: widget.progressColor,
                                    )),
                              ),
                              Align(
                                alignment: FractionalOffset.center,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Text(
                                      widget.label,
                                      style: TextStyle(
                                          fontSize: 20.0, color: Colors.white),
                                    ),
                                    Text(
                                      timerString,
                                      style: TextStyle(
                                          fontSize: 112.0, color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    widget.showButton
                        ? AnimatedBuilder(
                        animation: controller!,
                        builder: (context, child) {
                          return FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                if (controller!.isAnimating)
                                  controller!.stop();
                                else
                                  start();
                              });
                            },
                            child: Icon(controller!.isAnimating
                                ? Icons.pause
                                : Icons.play_arrow),
                          );
                        })
                        : Container(),
                  ],
                ),
              ),
            ],
          );
        });
  }

  void start() {
    controller!.reverse(
        from: controller!.value == 0.0 ? 1.0 : controller!.value);
  }
}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double>? animation;
  final Color? backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor!
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color!;
    double progress = (1.0 - animation!.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation!.value != old.animation!.value || color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}
