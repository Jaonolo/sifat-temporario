part of openapi.api;

enum SenhaAtendimento {
  NAO_UTILIZA,
  SENHA_NUMERICA_ALEATORIA,
  SENHA_NUMERICA_SEQUENCIAL,
  ALFA_NUMERICA
}

extension SenhaAtendimentoExtencion on SenhaAtendimento {
  String get name => describeEnum(this);

  String get descricao {
    switch (this) {
      case SenhaAtendimento.NAO_UTILIZA:
        return "Não utiliza";

      case SenhaAtendimento.SENHA_NUMERICA_ALEATORIA:
        return "Senha numérica aleatória";

      case SenhaAtendimento.SENHA_NUMERICA_SEQUENCIAL:
        return "Senha numérica sequencial";

      case SenhaAtendimento.ALFA_NUMERICA:
        return "Alfanúmerica (Nome do Cliente)";
    }
  }

  bool equals(SenhaAtendimento senhaAtendimento) => this == senhaAtendimento;
}
