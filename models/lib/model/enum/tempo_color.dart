part of openapi.api;

enum TempoColor { AZUL, VERDE, AMARELO, LARANJA, VERMELHO }

extension TempoColorExtension on TempoColor {
  String get name => describeEnum(this);

  Color get cor {
    switch (this) {
      case TempoColor.AZUL:
        return Color(0xFF51A8B1);
      case TempoColor.VERDE:
        return Color(0xFF5CA47A);
      case TempoColor.AMARELO:
        return Color(0xFFDEC85C);
      case TempoColor.LARANJA:
        return Color(0xFFF58634);
      case TempoColor.VERMELHO:
        return Color(0xFFFE0000);
    }
  }
}
