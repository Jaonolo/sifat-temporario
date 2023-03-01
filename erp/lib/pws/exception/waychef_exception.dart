class WaychefException implements Exception {
  final String titulo;
  final String mensagem;
  final exception;

  WaychefException({required this.mensagem, this.exception, this.titulo = ''});

  @override
  String toString() {
    if(mensagem != null && mensagem.isNotEmpty)
      return '$titulo - \n\n Mensagem: $mensagem';
    return titulo;
  }
}
