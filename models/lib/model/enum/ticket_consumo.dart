part of openapi.api;

enum TicketConsumo { AGRUPAR, INDIVIDUAL, AGRUPAR_INDIVIDUAL }

extension TicketConsumoExtencion on TicketConsumo {
  String get name => describeEnum(this);

  String get descricao {
    switch (this) {
      case TicketConsumo.AGRUPAR:
        return "Agrupar por item";

      case TicketConsumo.INDIVIDUAL:
        return "Individual por item";

      case TicketConsumo.AGRUPAR_INDIVIDUAL:
        return "Individual por item + agrupar subitens";
    }
  }

  bool equals(TicketConsumo ticketConsumo) => this == ticketConsumo;
}
