import 'package:flutter/cupertino.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:service/permissoes/supervisor_dialog/supervisor_dialog.dart';

class VerificaPermissaoService {
  final PWSConfig _pwsConfig;
  final String _token;
  final UsuarioPerfilEmpresa _usuarioPerfilEmpresa;
  final NivelPrivilegio _nivelPrivilegio = NivelPrivilegio.CONSULTAR_PERMITIR;

  //Ao instaciar passsar as config padroes
  VerificaPermissaoService(this._pwsConfig, this._token,
      this._usuarioPerfilEmpresa);

  void verificaPermissaoComSupervisor(BuildContext context,
      PrivilegioCodigo privilegioCodigo,
      Function onSucess, {String mensagem = "Informe o pin do supervisor"}) {
    //Verifica se possui a permissão
    bool isPossuiPermissao =
    verificaSePossuiPermissao(privilegioCodigo);

    //Caso não possua pede o supervisor
    if (!isPossuiPermissao) {
      SupervisorDialog.dialogSupervisor(
          context, _pwsConfig, _token, privilegioCodigo, onSucess, mensagem);
    } else {
      onSucess.call();
    }
  }

  bool verificaSePossuiPermissao(PrivilegioCodigo privilegioCodigo) {
    // Se for master possui permissao
    if (_usuarioPerfilEmpresa.master!) {
      return true;
    }

    //firstWhereOrNull retorna o objecto ou null por conta do nullSafe link util https://stackoverflow.com/questions/26504074/adding-orelse-function-to-firstwhere-method
    UsuarioPerfilEmpresaPrivilegio? privilegio =
    _usuarioPerfilEmpresa.usuarioPerfilEmpresaPrivilegios.firstWhere(
            (p) => p.privilegioCodigo!.equals(privilegioCodigo),
        orElse: () => UsuarioPerfilEmpresaPrivilegio()
    );

    if (privilegio.id != null) {
      if (privilegio.nivelPrivilegio!.nivel >= _nivelPrivilegio.nivel) {
        return true;
      }
    }

    return false;
  }
}
