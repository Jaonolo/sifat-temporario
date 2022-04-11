part of openapi.api;

enum VisaoFoto { PORTRAIT, LANDSCAPE }

extension VisaoFotoExtencion on VisaoFoto {
  String get name => describeEnum(this);

  bool equals(VisaoFoto visaoFoto) => this == visaoFoto;
}