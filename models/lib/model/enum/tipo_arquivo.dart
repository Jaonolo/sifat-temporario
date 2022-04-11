part of openapi.api;

enum TipoArquivo { IMAGEM, DOCUMENTO }

extension TipoArquivoExtencion on TipoArquivo {
  String get name => describeEnum(this);

  String get descricao {
    switch (this) {
      case TipoArquivo.IMAGEM:
        return "Imagem";
      case TipoArquivo.DOCUMENTO:
        return "Documento";
    }
  }

  bool equals(TipoArquivo tipoArquivo) => this == tipoArquivo;
}
