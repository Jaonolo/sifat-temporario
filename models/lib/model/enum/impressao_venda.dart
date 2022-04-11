part of openapi.api;

enum ImpressaoVenda { NAO_IMPRIME, PERGUNTA, IMPRIME }

extension ImpressaoVendaExtencion on ImpressaoVenda {
  String get name => describeEnum(this);

  String get descricao {
    switch (this) {
      case ImpressaoVenda.NAO_IMPRIME:
        return "Não imprime";

      case ImpressaoVenda.PERGUNTA:
        return "Pergunta";

      case ImpressaoVenda.IMPRIME:
        return "Imprime";
    }
  }

  bool equals(ImpressaoVenda impressaoVenda) => this == impressaoVenda;
}
