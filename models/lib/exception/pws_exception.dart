part of openapi.api;

class PwsException implements Exception {
  String message = "O erro não foi informado";
  PwsAlert pws = PwsAlert();

  PwsException(this.pws);

  PwsException.fromString(String error){
    pws = PwsAlert();
    pws.message = error;
    message = error;
  }


  @override
  String toString() {
    return 'PwsException{message: $message}';
  }
}
