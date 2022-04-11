part of openapi.api;

enum NivelPrivilegio { CONSULTAR_PERMITIR, INSERIR, ALTERAR, EXCLUIR }

extension NivelPrivilefioExtension on NivelPrivilegio {
  String get name => describeEnum(this);

  int get nivel {
    switch (this) {
      case NivelPrivilegio.CONSULTAR_PERMITIR:
        return 1;
      case NivelPrivilegio.INSERIR:
        return 2;
      case NivelPrivilegio.ALTERAR:
        return 3;
      case NivelPrivilegio.EXCLUIR:
        return 4;
      default:
        return 9999;
    }
  }
}
