part of openapi.api;

enum FormatoArquivo {
  PNG,
  JPG,
  JPEG,
  BMP,
  PDF,
  DOC,
  XML,
  XLS,
  XLSX,
  TXT,
  ZIP,
  RAR
}

extension FormatoArquivoExtencion on FormatoArquivo {
  String get name => describeEnum(this);


  bool equals(FormatoArquivo formatoArquivo) => this == formatoArquivo;
}
