import 'package:flutter/material.dart';

class StyleUtils {
  static Shadow shadowDefault() {
    return Shadow(
      offset: const Offset(3.0, 3.0),
      blurRadius: 3.0,
      color: Colors.black.withOpacity(0.2),
    );
  }

  static DecorationImage fundoTransparencia() {
    return DecorationImage(
      colorFilter:
      ColorFilter.mode(Colors.white.withOpacity(0.9), BlendMode.lighten),
      image: const AssetImage("assets/background3.png"),
      fit: BoxFit.cover,
    );
  }
}
