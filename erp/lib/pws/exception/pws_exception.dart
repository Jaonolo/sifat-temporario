import '../pws_alert.dart';

class PwsException implements Exception {
  String message = '';
  PwsAlert _pws = PwsAlert();

  PwsException(this._pws) {
    message = _pws.toString();
  }

  PwsException.fromString(String error){
    _pws = PwsAlert();
    _pws.message = error;
    this.message = error;
  }

  PwsAlert get pws => _pws;

  @override
  String toString() {
    return 'PwsException{message: $message}';
  }
}
