import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:utils/utils/responsive_utils.dart';
import 'package:waycard/widgets/animations/wave_decoration/wave_clipper.dart';
import 'package:waycard/widgets/animations/wave_decoration/wave_clipper_3.dart';

class WaveDecoration extends StatelessWidget {
  final Widget? title;
  final Widget? subtitle;
  final double waveHeight;
  final Color? colorOneWaveOne;
  final Color? colorTwoWaveOne;
  final Color? colorOneWaveTwo;
  final Color? colorTwoWaveTwo;
  final Size appSize;

  const WaveDecoration({
    this.title,
    this.subtitle,
    this.colorOneWaveOne,
    this.colorTwoWaveOne,
    this.colorOneWaveTwo,
    this.colorTwoWaveTwo,
    this.waveHeight = 280,
    required this.appSize,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _wave2(),
        _wave1(),
      ],
    );
  }

  Widget _wave1() {
    return ClipPath(
      clipper: WaveClipper1(),
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: ResponsiveUtils.responsiveSize(
                  appSize: appSize, baseValue: 40),
            ),
            title != null ? title! : Container(),
            SizedBox(
              height: ResponsiveUtils.responsiveSize(
                  appSize: appSize, baseValue: 20),
            ),
            subtitle != null ? subtitle! : Container(),
          ],
        ),
        width: double.infinity,
        height: ResponsiveUtils.responsiveSize(
            appSize: appSize, baseValue: waveHeight),
        decoration: BoxDecoration(gradient: LinearGradient(
            colors: [colorOneWaveOne!, colorTwoWaveOne!])),
      ),
    );
  }

  Widget _wave2() {
    return ClipPath(
      clipper: WaveClipper3(),
      child: Container(
        child: Column(),
        width: double.infinity,
        height: ResponsiveUtils.responsiveSize(
            appSize: appSize, baseValue: waveHeight),
        decoration: BoxDecoration(gradient: LinearGradient(
            colors: [colorOneWaveTwo!, colorTwoWaveTwo!])),
      ),
    );
  }
}
