import 'package:flutter/foundation.dart';

enum TipoModulo { GERAL, MESA, FICHA, DELIVERY, CARTAO, BALCAO, DRIVE_THRU, }

extension TipoModuloExtension on TipoModulo{
  String get name => describeEnum(this);

  String? get descricao {
    switch (this) {
      case TipoModulo.BALCAO:
        return 'BALCÃO';
      case TipoModulo.MESA:
        return 'Mesa';
      case TipoModulo.FICHA:
        return 'FICHA';
      case TipoModulo.DELIVERY:
        return 'DELIVERY';
      case TipoModulo.DRIVE_THRU:
        return 'DRIVE THRU';
      case TipoModulo.CARTAO:
        return 'CARTÃO';
      default:
        return null;
    }
  }

}