class Masks {
  static String _cpf = "XXX.XXX.XXX-XX";

  static String _cnpj = "XX.XXX.XXX/XXXX-XX";

  static String cpf({String? char}) =>
      char != null ? _cpf.replaceAll("X", char) : _cpf;

  static String cnpj({String? char}) =>
      char != null ? _cnpj.replaceAll("X", char) : _cnpj;

  static String tel() => "(##)#####-####";

  static String cel() => "(##)#####-####";

  static String cep() => "#####-###";

  static String data() => "##/##/####";
}
