import 'package:flutter/material.dart';

class AnimatedLoadingButton extends StatelessWidget {
  final Color color;
  final Color textColor;
  final Color progressColor;
  final String text;
  final Function onTap;
  final bool isLoading;
  final double elevation;
  final Duration animationDuration;
  final double borderRadius;

  const AnimatedLoadingButton({
    this.color = Colors.grey,
    this.text = "",
    required this.onTap,
    this.textColor = Colors.white,
    this.isLoading = false,
    this.progressColor = Colors.white,
    this.elevation = 5,
    this.animationDuration = const Duration(milliseconds: 220),
    this.borderRadius = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(4)),
      child: InkWell(
        onTap: isLoading ? null : onTap as void Function()?,
        borderRadius: BorderRadius.all(Radius.circular(4)),
        child: AnimatedContainer(
          duration: animationDuration,
          width: isLoading ? 50 : MediaQuery
              .of(context)
              .size
              .width,
          height: 50,
          alignment: Alignment.center,
          child: isLoading
              ? CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(progressColor),
          )
              : Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
