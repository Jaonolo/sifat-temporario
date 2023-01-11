part of openapi.api;


enum TipoPendencia {
  EMISSAO_NOTA,
  CANCELAMENTO_NOTA,
  ENVIO_CONTINGENCIA,
  ACUMOLO_QUEST,
  ESTORNO_QUEST,
}

extension TipoPendenciaExtension on TipoPendencia {
  String get name => describeEnum(this);

  bool equals(TipoPendencia tipoOperacao) => this == tipoOperacao;

  String get codigoRetornoSucesso {
    switch (this) {
      case TipoPendencia.EMISSAO_NOTA:
        return "06000";
      case TipoPendencia.CANCELAMENTO_NOTA:
        return "07000";
      case TipoPendencia.ENVIO_CONTINGENCIA:
        return "";
      case TipoPendencia.ACUMOLO_QUEST:
        return "";
      case TipoPendencia.ESTORNO_QUEST:
        return "";
    }
  }
}
