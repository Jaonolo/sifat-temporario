import 'package:flutter/foundation.dart';

enum Clients {
  WAITER_MOBILE,
  WAYCARD,
  AUTOATENDIMENTO,
  AUTOPESAGEM,
}

extension ClientExtension on Clients {
  String get name => describeEnum(this);

  int get id {
    switch (this) {
      case Clients.WAITER_MOBILE:
        return 3;
      case Clients.WAYCARD:
        return 5;
      case Clients.AUTOATENDIMENTO:
        return 7;
      case Clients.AUTOPESAGEM:
        return 9;
    }
  }

  String get versao {
    switch (this) {
      case Clients.WAITER_MOBILE:
        return "3.0.05";
      case Clients.WAYCARD:
        return "3.0.00";
      case Clients.AUTOATENDIMENTO:
        return "3.0.00";
      case Clients.AUTOPESAGEM:
        return "3.0.00";
    }
  }

  String get descricao {
    switch (this) {
      case Clients.WAITER_MOBILE:
        return "WAYCHEF MOBILE";
      case Clients.WAYCARD:
        return "WAYCARD";
      case Clients.AUTOATENDIMENTO:
        return "AUTOATENDIMENTO";
      case Clients.AUTOPESAGEM:
        return "AUTOPESAGEM";
    }
  }

  String get clientKey {
    switch (this) {
      case Clients.WAITER_MOBILE:
        return "F77A955E1ACA9CF52EBC7F7F27884F88";
      case Clients.WAYCARD:
        return "6D0BB66067ABE78977EFAADC8048721A";
      case Clients.AUTOATENDIMENTO:
        return "8B419A5451C0AF6D1F8E564BD23E7387";
      case Clients.AUTOPESAGEM:
        return "18AED2DFE67F6BB92D2DA2B76F06DE51";
    }
  }
}
