import 'package:autoatendimento/app/modules/venda/pos/sitef_pos.dart';
import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/autoatendimento_requester.dart';
import 'package:requester/requester/sitef_requester.dart';
import 'package:flutter/foundation.dart';

class SitefRepository {
  static Future<ServicoSitef> carregarServicoSitef(PWSConfig pwsConfig,
      String token) async {
    return await SitefRequester.buscar(pwsConfig, token).then((response) {
      if (response.status == 200) {
        ServicoSitef servicoSitef = response.content;
        return servicoSitef;
      } else {
        throw WaybeException("Não foi possível carregar o serviço do Sitef",
            exception: response.content);
      }
    }).catchError((e, s) {
      if (e is WaybeException) throw e;
      throw WaybeException("Não foi possível carregar o serviço do Sitef",
          mensagem: "Não foi possível carregar o serviço do Sitef");
    });
  }

  static Future<void> startSitef(PWSConfig configLocal, PWSConfig pwsConfig,
      String token, String caixa, String cnpjEstabelecimento) async {
    ServicoSitef servicoSitef = await carregarServicoSitef(pwsConfig, token);
    if (defaultTargetPlatform == TargetPlatform.windows) {
      await AutoatendimentoRequester.startSitef(
          configLocal, servicoSitef, caixa, cnpjEstabelecimento)
          .then((response) {
        if (response.isSuccess) {} else {
          throw WaybeException(
              "Não foi possivel iniciar o serviço", exception: response.content,
              mensagem: "Não foi possível carregar o serviço do Sitef");
          // throw WaybeException("Não foi possível iniciar o serviço do Sitef",
          //     exception: response.content as Exception);
        }
      });
    } else {
      SitefPOS.configure(servicoSitef);
    }
  }
}
