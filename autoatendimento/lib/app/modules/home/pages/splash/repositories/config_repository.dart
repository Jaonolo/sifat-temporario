// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:models/model/models.dart';
import 'package:requester/config/pws_config.dart';
import 'package:requester/requester/autoatendimento_requester.dart';

class ConfigRepository {
  static Future<ConfigPropertiesDTO?> carregaConfiguracao(
      PWSConfig configLocal) async {
    return await AutoatendimentoRequester.carregaArquivoProperties(configLocal)
        .then((response) {
      if (response.status == 200) {
        String? encoded = response.body;
        String decoded = utf8.decode(base64.decode(encoded!));
        return _convertBase64ToConfig(decoded);
      } else if (response.status == 204) {
        return null;
      } else {
        throw WaybeException('Problema ao carregar arquivo de inicialização',
            exception: response.content);
      }
    }).catchError((e, s) {
      if (e is WaybeException) throw e;
      throw WaybeException('Problema ao carregar arquivo de inicialização');
    });
  }

  static Future<void> criaConfiguracao(PWSConfig configLocal,
      ConfigPropertiesDTO dto) async {
    return await AutoatendimentoRequester.insereArquivoProperties(
        configLocal, dto)
        .then((response) {
      if (response.isSuccess) {} else {
        throw WaybeException('Problema ao criar arquivo de configuracao.',
            exception: response.content);
      }
    }).catchError((e, s) {
      if (e is WaybeException) throw e;
      throw WaybeException('Problema ao criar arquivo de configuracao. $e');
    });
  }

  static Future<String?> carregaNomeEstacao(PWSConfig configLocal) async {
    return await AutoatendimentoRequester.carregaNomeEstacao(configLocal)
        .then((response) {
      if (response.isSuccess) {
        return response.body;
      } else {
        throw WaybeException('Problema ao carregar o nome da estação',
            exception: response.content);
      }
    }).catchError((e, s) {
      print(s);
      if (e is WaybeException) throw e;
      throw WaybeException('Problema ao carregar o nome da estação');
    });
  }

  static ConfigPropertiesDTO _convertBase64ToConfig(String base64) {
    ConfigPropertiesDTO dto = ConfigPropertiesDTO();
    var split = base64.split("\n");
    split.forEach((element) {
      if (element.startsWith('cnpj')) dto.cnpj = element.split(' = ')[1];
      //Epspaço no host para diferenciar do gateway
      if (element.startsWith('host ')) dto.host = element.split('= ')[1];
      if (element.startsWith('hostGateway')) dto.hostGateway = element.split(' = ')[1];
      if (element.startsWith('clientSecret')) {
        dto.clientSecret = element.split(' = ')[1];
      }
    });

    if (dto.cnpj == null) {
      throw WaybeException(
          'Não foi possível localizar o CNPJ no arquivo de configurações');
    }

    if (dto.host == null) {
      throw WaybeException(
          'Não foi possível localizar o host no arquivo de configurações');
    }

    if (dto.hostGateway == null) {
      throw WaybeException(
          'Não foi possível localizar o host gateway no arquivo de configurações');
    }

    if (dto.clientSecret == null) {
      throw WaybeException(
          'Não foi possível localizar o clientSecret no arquivo de configurações');
    }

    return dto;
  }
}
