import 'package:flutter/foundation.dart';

enum Client {
  WAITER_MOBILE,
  WAYCARD,
  AUTOATENDIMENTO,
  AUTOPESAGEM,
}

extension ClientExtension on Client {
  String get name => describeEnum(this);

  int get id {
    switch (this) {
      case Client.WAITER_MOBILE:
        return 3;
      case Client.WAYCARD:
        return 5;
      case Client.AUTOATENDIMENTO:
        return 7;
      case Client.AUTOPESAGEM:
        return 9;
    }
  }

  String get versao {
    switch (this) {
      case Client.WAITER_MOBILE:
        return "3.0.05";
      case Client.WAYCARD:
        return "3.0.00";
      case Client.AUTOATENDIMENTO:
        return "3.0.00";
      case Client.AUTOPESAGEM:
        return "3.0.00";
    }
  }

  String get descricao {
    switch (this) {
      case Client.WAITER_MOBILE:
        return "WAYCHEF MOBILE";
      case Client.WAYCARD:
        return "WAYCARD";
      case Client.AUTOATENDIMENTO:
        return "AUTOATENDIMENTO";
      case Client.AUTOPESAGEM:
        return "AUTOPESAGEM";
    }
  }

  String get clientKey {
    switch (this) {
      case Client.WAITER_MOBILE:
        return "F77A955E1ACA9CF52EBC7F7F27884F88";
      case Client.WAYCARD:
        return "6D0BB66067ABE78977EFAADC8048721A";
      case Client.AUTOATENDIMENTO:
        return "8B419A5451C0AF6D1F8E564BD23E7387";
      case Client.AUTOPESAGEM:
        return "18AED2DFE67F6BB92D2DA2B76F06DE51";
    }
  }
}
