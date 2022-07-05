part of openapi.api;

enum TipoPacote {
  NENHUM,
  COMBO,
  COMPOSTO,
  RODIZIO,
  CESTA_KIT,
  ADICIONAIS,
}

extension TipoPacoteExtension on TipoPacote{
  String get name => describeEnum(this);

  bool equals(TipoPacote tipo) => this == tipo;

  String get descricao {
    switch (this) {
      case TipoPacote.NENHUM:
        return 'Nenhum';
      case TipoPacote.COMBO:
        return 'Combo';
      case TipoPacote.COMPOSTO:
        return 'Composto';
      case TipoPacote.RODIZIO:
        return 'Rodízio';
      case TipoPacote.CESTA_KIT:
        return 'Cesta/Kit';
      case TipoPacote.ADICIONAIS:
        return 'Adicionais';
    }
  }
}