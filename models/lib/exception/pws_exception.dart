part of openapi.api;

class PwsException implements Exception {
  String? message;
  PwsAlert? _pws;

  PwsException(this._pws) {
    if (pws != null) {
      message = _pws!.message;
    }
  }

  PwsException.fromString(String error){
    _pws = PwsAlert();
    _pws!.message = error;
    message = error;
  }

  PwsAlert? get pws => _pws;

  @override
  String toString() {
    return 'PwsException{message: $message}';
  }
}
