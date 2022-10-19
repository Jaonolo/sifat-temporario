import 'package:models/model/models.dart';

class SitefProtocoloSocket {
  String? funcao; //TRANSACIONAR ou CANCELAR
  SitefProtocoloSocketParam? param;

  SitefProtocoloSocket(); //CREDITO ou DEBITO

  String toJson() {
    return '{"funcao": "${this.funcao}"${param != null ? ', "param": ${(param != null) ? param!.toJson() : ''}' : ''}}';
  }
}

class SitefProtocoloSocketParam {
  int? cupomFiscal;
  bool confirmaTransacao = false;
  String? tipoPagamentoTEF;
  String? nsu;
  String? data;
  String? horaFiscal;
  BigDecimal valor = BigDecimal.ZERO();

  String toJson() {
    return '{"'
        'cupomFiscal": "${this.cupomFiscal}"'
        ',"confirmaTransacao": "${this.confirmaTransacao}"'
        ',"valor": ${this.valor}'
        ',"nsu": "${this.nsu}"'
        ',"data": "${this.data}"'
        ',"horaFiscal": "${this.horaFiscal}"'
        '${this.tipoPagamentoTEF != null ? ',"tipoPagamentoTEF": "${this.tipoPagamentoTEF}"' : ''}'
        '}';
  }
}
