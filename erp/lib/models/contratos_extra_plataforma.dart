class ContratosExtraPlataforma implements _contratos_extra_plataforma {
  final String aplicacao;
  final String nome;
  final String detalhes;
  final double valor;
  final Map<String, bool> integradores;
  final bool disponivel;

  const ContratosExtraPlataforma({
    required this.aplicacao,
    required this.nome,
    this.detalhes = '',
    required this.valor,
    required this.integradores,
    this.disponivel = false,
  });
}

abstract class _contratos_extra_plataforma {
  String get aplicacao;
  String get nome;
  String get detalhes;
  double get valor;
  Map<String, bool> get integradores;
  bool get disponivel;
}
