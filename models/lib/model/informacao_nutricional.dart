part of openapi.api;

class InformacaoNutricional {

  int? idProdutoEmpresa;

  String? descricao;

  int? quantidadePorcao;

  String? unidadePorcao;

  //enum unidadePorcaoEnum {  GRAMAS,  MILILITROS,  UNIDADES,  };{

  int? medidaInteira;

  String? medidaDecimal;

  //enum medidaDecimalEnum {  ZERO,  UM_QUARTO,  UM_TERCO,  MEIA,  DOIS_TERCOS,  TRES_QUARTOS,  };{

  String? medidaCaseira;

  //enum medidaCaseiraEnum {  COLHER_SOPA,  COLHER_CHA,  XICARA,  UNIDADE,  PACOTE,  FATIA,  PEDACO,  FOLHA,  PAO,  BISCOITO,  BISNAGUINHA,  DISCO,  COPO,  PORCAO,  TABLETE,  SACHE,  ALMONDEGA,  BIFE,  FILE,  };{

  String? quantidadeCaloria;

  String? valorDiarioCaloria;

  String? quantidadeCarboidrato;

  String? valorDiarioCarboidrato;

  String? quantidadeProteina;

  String? valorDiarioProteina;

  String? quantidadeGorduraTotal;

  String? valorDiarioGorduraTotal;

  String? quantidadeGorduraSaturada;

  String? valorDiarioGorduraSaturada;

  String? quantidadeGorduraTrans;

  String? valorDiarioGorduraTrans;

  String? quantidadeColesterol;

  String? valorDiarioColesterol;

  String? quantidadeFibra;

  String? valorDiarioFibra;

  String? quantidadeCalcio;

  String? valorDiarioCalcio;

  String? quantidadeFerro;

  String? valorDiarioFerro;

  String? quantidadeSodio;

  String? valorDiarioSodio;

  String? quantidadePotassio;

  String? valorDiarioPotassio;

  InformacaoNutricional();

  @override
  String toString() {
    return 'InformacaoNutricional[idProdutoEmpresa=$idProdutoEmpresa, descricao=$descricao, quantidadePorcao=$quantidadePorcao, unidadePorcao=$unidadePorcao, medidaInteira=$medidaInteira, medidaDecimal=$medidaDecimal, medidaCaseira=$medidaCaseira, quantidadeCaloria=$quantidadeCaloria, valorDiarioCaloria=$valorDiarioCaloria, quantidadeCarboidrato=$quantidadeCarboidrato, valorDiarioCarboidrato=$valorDiarioCarboidrato, quantidadeProteina=$quantidadeProteina, valorDiarioProteina=$valorDiarioProteina, quantidadeGorduraTotal=$quantidadeGorduraTotal, valorDiarioGorduraTotal=$valorDiarioGorduraTotal, quantidadeGorduraSaturada=$quantidadeGorduraSaturada, valorDiarioGorduraSaturada=$valorDiarioGorduraSaturada, quantidadeGorduraTrans=$quantidadeGorduraTrans, valorDiarioGorduraTrans=$valorDiarioGorduraTrans, quantidadeColesterol=$quantidadeColesterol, valorDiarioColesterol=$valorDiarioColesterol, quantidadeFibra=$quantidadeFibra, valorDiarioFibra=$valorDiarioFibra, quantidadeCalcio=$quantidadeCalcio, valorDiarioCalcio=$valorDiarioCalcio, quantidadeFerro=$quantidadeFerro, valorDiarioFerro=$valorDiarioFerro, quantidadeSodio=$quantidadeSodio, valorDiarioSodio=$valorDiarioSodio, quantidadePotassio=$quantidadePotassio, valorDiarioPotassio=$valorDiarioPotassio, ]';
  }

  InformacaoNutricional.fromJson(Map<String, dynamic>? json) {
    if (json == null) return;
    if (json['idProdutoEmpresa'] == null) {
      idProdutoEmpresa = null;
    } else {
      idProdutoEmpresa = json['idProdutoEmpresa'];
    }
    if (json['descricao'] == null) {
      descricao = null;
    } else {
      descricao = json['descricao'];
    }
    if (json['quantidadePorcao'] == null) {
      quantidadePorcao = null;
    } else {
      quantidadePorcao = json['quantidadePorcao'];
    }
    if (json['unidadePorcao'] == null) {
      unidadePorcao = null;
    } else {
      unidadePorcao = json['unidadePorcao'];
    }
    if (json['medidaInteira'] == null) {
      medidaInteira = null;
    } else {
      medidaInteira = json['medidaInteira'];
    }
    if (json['medidaDecimal'] == null) {
      medidaDecimal = null;
    } else {
      medidaDecimal = json['medidaDecimal'];
    }
    if (json['medidaCaseira'] == null) {
      medidaCaseira = null;
    } else {
      medidaCaseira = json['medidaCaseira'];
    }
    if (json['quantidadeCaloria'] == null) {
      quantidadeCaloria = null;
    } else {
      quantidadeCaloria = json['quantidadeCaloria'];
    }
    if (json['valorDiarioCaloria'] == null) {
      valorDiarioCaloria = null;
    } else {
      valorDiarioCaloria = json['valorDiarioCaloria'];
    }
    if (json['quantidadeCarboidrato'] == null) {
      quantidadeCarboidrato = null;
    } else {
      quantidadeCarboidrato = json['quantidadeCarboidrato'];
    }
    if (json['valorDiarioCarboidrato'] == null) {
      valorDiarioCarboidrato = null;
    } else {
      valorDiarioCarboidrato = json['valorDiarioCarboidrato'];
    }
    if (json['quantidadeProteina'] == null) {
      quantidadeProteina = null;
    } else {
      quantidadeProteina = json['quantidadeProteina'];
    }
    if (json['valorDiarioProteina'] == null) {
      valorDiarioProteina = null;
    } else {
      valorDiarioProteina = json['valorDiarioProteina'];
    }
    if (json['quantidadeGorduraTotal'] == null) {
      quantidadeGorduraTotal = null;
    } else {
      quantidadeGorduraTotal = json['quantidadeGorduraTotal'];
    }
    if (json['valorDiarioGorduraTotal'] == null) {
      valorDiarioGorduraTotal = null;
    } else {
      valorDiarioGorduraTotal = json['valorDiarioGorduraTotal'];
    }
    if (json['quantidadeGorduraSaturada'] == null) {
      quantidadeGorduraSaturada = null;
    } else {
      quantidadeGorduraSaturada = json['quantidadeGorduraSaturada'];
    }
    if (json['valorDiarioGorduraSaturada'] == null) {
      valorDiarioGorduraSaturada = null;
    } else {
      valorDiarioGorduraSaturada = json['valorDiarioGorduraSaturada'];
    }
    if (json['quantidadeGorduraTrans'] == null) {
      quantidadeGorduraTrans = null;
    } else {
      quantidadeGorduraTrans = json['quantidadeGorduraTrans'];
    }
    if (json['valorDiarioGorduraTrans'] == null) {
      valorDiarioGorduraTrans = null;
    } else {
      valorDiarioGorduraTrans = json['valorDiarioGorduraTrans'];
    }
    if (json['quantidadeColesterol'] == null) {
      quantidadeColesterol = null;
    } else {
      quantidadeColesterol = json['quantidadeColesterol'];
    }
    if (json['valorDiarioColesterol'] == null) {
      valorDiarioColesterol = null;
    } else {
      valorDiarioColesterol = json['valorDiarioColesterol'];
    }
    if (json['quantidadeFibra'] == null) {
      quantidadeFibra = null;
    } else {
      quantidadeFibra = json['quantidadeFibra'];
    }
    if (json['valorDiarioFibra'] == null) {
      valorDiarioFibra = null;
    } else {
      valorDiarioFibra = json['valorDiarioFibra'];
    }
    if (json['quantidadeCalcio'] == null) {
      quantidadeCalcio = null;
    } else {
      quantidadeCalcio = json['quantidadeCalcio'];
    }
    if (json['valorDiarioCalcio'] == null) {
      valorDiarioCalcio = null;
    } else {
      valorDiarioCalcio = json['valorDiarioCalcio'];
    }
    if (json['quantidadeFerro'] == null) {
      quantidadeFerro = null;
    } else {
      quantidadeFerro = json['quantidadeFerro'];
    }
    if (json['valorDiarioFerro'] == null) {
      valorDiarioFerro = null;
    } else {
      valorDiarioFerro = json['valorDiarioFerro'];
    }
    if (json['quantidadeSodio'] == null) {
      quantidadeSodio = null;
    } else {
      quantidadeSodio = json['quantidadeSodio'];
    }
    if (json['valorDiarioSodio'] == null) {
      valorDiarioSodio = null;
    } else {
      valorDiarioSodio = json['valorDiarioSodio'];
    }
    if (json['quantidadePotassio'] == null) {
      quantidadePotassio = null;
    } else {
      quantidadePotassio = json['quantidadePotassio'];
    }
    if (json['valorDiarioPotassio'] == null) {
      valorDiarioPotassio = null;
    } else {
      valorDiarioPotassio = json['valorDiarioPotassio'];
    }
  }

  Map<String, dynamic> toJson() {
    Map <String, dynamic> json = {};
    if (idProdutoEmpresa != null)
      json['idProdutoEmpresa'] = idProdutoEmpresa;
    if (descricao != null)
      json['descricao'] = descricao;
    if (quantidadePorcao != null)
      json['quantidadePorcao'] = quantidadePorcao;
    if (unidadePorcao != null)
      json['unidadePorcao'] = unidadePorcao;
    if (medidaInteira != null)
      json['medidaInteira'] = medidaInteira;
    if (medidaDecimal != null)
      json['medidaDecimal'] = medidaDecimal;
    if (medidaCaseira != null)
      json['medidaCaseira'] = medidaCaseira;
    if (quantidadeCaloria != null)
      json['quantidadeCaloria'] = quantidadeCaloria;
    if (valorDiarioCaloria != null)
      json['valorDiarioCaloria'] = valorDiarioCaloria;
    if (quantidadeCarboidrato != null)
      json['quantidadeCarboidrato'] = quantidadeCarboidrato;
    if (valorDiarioCarboidrato != null)
      json['valorDiarioCarboidrato'] = valorDiarioCarboidrato;
    if (quantidadeProteina != null)
      json['quantidadeProteina'] = quantidadeProteina;
    if (valorDiarioProteina != null)
      json['valorDiarioProteina'] = valorDiarioProteina;
    if (quantidadeGorduraTotal != null)
      json['quantidadeGorduraTotal'] = quantidadeGorduraTotal;
    if (valorDiarioGorduraTotal != null)
      json['valorDiarioGorduraTotal'] = valorDiarioGorduraTotal;
    if (quantidadeGorduraSaturada != null)
      json['quantidadeGorduraSaturada'] = quantidadeGorduraSaturada;
    if (valorDiarioGorduraSaturada != null)
      json['valorDiarioGorduraSaturada'] = valorDiarioGorduraSaturada;
    if (quantidadeGorduraTrans != null)
      json['quantidadeGorduraTrans'] = quantidadeGorduraTrans;
    if (valorDiarioGorduraTrans != null)
      json['valorDiarioGorduraTrans'] = valorDiarioGorduraTrans;
    if (quantidadeColesterol != null)
      json['quantidadeColesterol'] = quantidadeColesterol;
    if (valorDiarioColesterol != null)
      json['valorDiarioColesterol'] = valorDiarioColesterol;
    if (quantidadeFibra != null)
      json['quantidadeFibra'] = quantidadeFibra;
    if (valorDiarioFibra != null)
      json['valorDiarioFibra'] = valorDiarioFibra;
    if (quantidadeCalcio != null)
      json['quantidadeCalcio'] = quantidadeCalcio;
    if (valorDiarioCalcio != null)
      json['valorDiarioCalcio'] = valorDiarioCalcio;
    if (quantidadeFerro != null)
      json['quantidadeFerro'] = quantidadeFerro;
    if (valorDiarioFerro != null)
      json['valorDiarioFerro'] = valorDiarioFerro;
    if (quantidadeSodio != null)
      json['quantidadeSodio'] = quantidadeSodio;
    if (valorDiarioSodio != null)
      json['valorDiarioSodio'] = valorDiarioSodio;
    if (quantidadePotassio != null)
      json['quantidadePotassio'] = quantidadePotassio;
    if (valorDiarioPotassio != null)
      json['valorDiarioPotassio'] = valorDiarioPotassio;
    return json;
  }

  static List<InformacaoNutricional> listFromJson(List<dynamic> json) {
    return json.map((value) => InformacaoNutricional.fromJson(value)).toList();
  }

  static Map<String, InformacaoNutricional> mapFromJson(
      Map<String, dynamic> json) {
    var map = Map<String, InformacaoNutricional>();
    if (json.isNotEmpty) {
      json.forEach((String key, dynamic value) =>
      map[key] = InformacaoNutricional.fromJson(value));
    }
    return map;
  }
}

