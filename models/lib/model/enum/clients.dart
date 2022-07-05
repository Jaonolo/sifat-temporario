import 'package:flutter/foundation.dart';

enum Clients {
  ALFA_SYNC,
  WAITER,
  WAITER_MOBILE,
  CONCENTRADOR,
  ERP,
  API,
  WAYCARD,
  AUTOATENDIMENTO,
  WAYMENU_SERVICE,
  GERENCIADOR_IMPRESSAO,
  AUTOPESAGEM,
}

extension ClientExtension on Clients {
  String get name => describeEnum(this);

  int get id {
    switch (this) {
      case Clients.ALFA_SYNC:
        return 1;
      case Clients.WAITER:
        return 2;
      case Clients.WAITER_MOBILE:
        return 3;
      case Clients.CONCENTRADOR:
        return 4;
      case Clients.WAYCARD:
        return 5;
      case Clients.AUTOATENDIMENTO:
        return 7;
      case Clients.WAYMENU_SERVICE:
        return 8;
      case Clients.AUTOPESAGEM:
        return 9;
      case Clients.ERP:
      case Clients.API:
      case Clients.GERENCIADOR_IMPRESSAO:
        throw Exception("Client não possui id");
    }
  }

  String get versao {
    switch (this) {
      case Clients.ALFA_SYNC:
        return "3.0.00";
      case Clients.WAITER:
        return "3.0.26";
      case Clients.WAITER_MOBILE:
        return "3.0.11";
      case Clients.ERP:
        return "3.0.09";
      case Clients.WAYCARD:
        return "3.0.00";
      case Clients.AUTOATENDIMENTO:
        return "3.0.00";
      case Clients.WAYMENU_SERVICE:
        return "3.0.00";
      case Clients.GERENCIADOR_IMPRESSAO:
        return "3.0.00";
      case Clients.AUTOPESAGEM:
        return "3.0.00";
      case Clients.API:
      case Clients.CONCENTRADOR:
        return "3.0.20";
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
      case Clients.ERP:
        return "ERP";
      case Clients.ALFA_SYNC:
        return "ALFA SYNC";
      case Clients.WAITER:
        return "WAITER";
      case Clients.CONCENTRADOR:
        return "CONCENTRADOR";
      case Clients.API:
        return "API";
      case Clients.WAYMENU_SERVICE:
        return "WAYMENU SERVICE";
      case Clients.GERENCIADOR_IMPRESSAO:
        return "GERENCIADOR DE IMPRESSÃO";
    }
  }

  String get clientKey {
    switch (this) {
      case Clients.ALFA_SYNC:
        return "61F3E3EDEF6E7C187E29DCC1F18A3182";
      case Clients.WAITER:
        return "E025F3A20FDDBAE592467159D82EF089";
      case Clients.WAITER_MOBILE:
        return "F77A955E1ACA9CF52EBC7F7F27884F88";
      case Clients.CONCENTRADOR:
        return "41F0ACFFBB4D23623D4C92052A80506D";
      case Clients.WAYCARD:
        return "6D0BB66067ABE78977EFAADC8048721A";
      case Clients.AUTOATENDIMENTO:
        return "8B419A5451C0AF6D1F8E564BD23E7387";
      case Clients.AUTOPESAGEM:
        return "18AED2DFE67F6BB92D2DA2B76F06DE51";
      case Clients.WAYMENU_SERVICE:
      case Clients.GERENCIADOR_IMPRESSAO:
      case Clients.ERP:
      case Clients.API:
        throw Exception("Client não possui clientKey");
    }
  }
}
