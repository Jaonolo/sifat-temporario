part of openapi.api;

class WaybeException implements Exception {
  String titulo = '';
  String? mensagem = '';
  var exception;

  WaybeException(this.titulo, {this.mensagem, this.exception});

  @override
  String toString() {
    if (mensagem != null && mensagem!.isNotEmpty) {
      return '$titulo - \n\n Mensagem: $mensagem';
    }
    return titulo;
  }
}
