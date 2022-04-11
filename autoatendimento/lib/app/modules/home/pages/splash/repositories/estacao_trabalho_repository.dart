import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/estacao_trabalho_requester.dart';

class EstacaoTrabalhoRepository {
  static Future<EstacaoTrabalho> carregarEstacaoTrabalho(PWSConfig pwsConfig,
      String token, String nomeEstacao) async {
    EstacaoTrabalho estacaoTrabalho = EstacaoTrabalho();

    await EstacaoTrabalhoRequester.buscar(pwsConfig,
        token: token, nomeEstacao: nomeEstacao)
        .then((response) {
      if (response.status == 200) {
        estacaoTrabalho = response.content[0];
      } else {
        throw WaybeException('Erro ao carregar estação de trabalho',
            exception: response.content);
      }
    }).catchError((e) {
      print(e);
      if (e is WaybeException) throw e;
      throw WaybeException('Erro ao carregar estação de trabalho');
    });


    return estacaoTrabalho;
  }
}
