import 'package:decimal/decimal.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BigDecimal {
  String valor = '0';

  BigDecimal(this.valor) {
    if (valor == null) valor = "0";
    if (valor.isEmpty) valor = '0';
  }

  BigDecimal operator +(BigDecimal bigDecimal) {
    return this.somar(bigDecimal);
  }

  BigDecimal somar(BigDecimal bigDecimal) {
    if (bigDecimal == null) return this;
    Decimal base = Decimal.parse(this.valor);
    Decimal parametro = Decimal.parse(bigDecimal.valor);
    return BigDecimal((base + parametro).toString());
  }

  BigDecimal operator -(BigDecimal bigDecimal) {
    return this.subtrair(bigDecimal);
  }

  BigDecimal subtrair(BigDecimal bigDecimal) {
    if (bigDecimal == null) return this;
    Decimal base = Decimal.parse(this.valor);
    Decimal parametro = Decimal.parse(bigDecimal.valor);
    return BigDecimal((base - parametro).toString());
  }

  BigDecimal operator *(BigDecimal bigDecimal) {
    if (bigDecimal == null) return this;
    return this.multiplicar(bigDecimal);
  }

  BigDecimal operator ~/(BigDecimal bigDecimal) {
    if (bigDecimal == null) return this;
    Decimal base = Decimal.parse(this.valor);
    Decimal parametro = Decimal.parse(bigDecimal.valor);
    return BigDecimal((base ~/ parametro).toString());
  }

  BigDecimal multiplicar(BigDecimal bigDecimal) {
    if (bigDecimal == null) return this;
    Decimal base = Decimal.parse(this.valor);
    Decimal parametro = Decimal.parse(bigDecimal.valor);
    return BigDecimal((base * parametro).toString());
  }

  BigDecimal operator /(BigDecimal bigDecimal) {
    if (bigDecimal == null) return this;
    return this.dividir(bigDecimal);
  }

  BigDecimal dividir(BigDecimal bigDecimal) {
    if (bigDecimal == null) return this;
    Decimal base = Decimal.parse(this.valor);
    Decimal parametro = Decimal.parse(bigDecimal.valor);
    return BigDecimal((base / parametro).toString());
  }

  @override
  bool operator ==(Object bigDecimal) {
    if (bigDecimal is BigDecimal) return this.compareTo(bigDecimal) == 0;
    if (bigDecimal is String)
      return this.compareTo(BigDecimal(bigDecimal)) == 0;

    throw Exception("Tipo não suportado -> $bigDecimal");
  }

  int compareTo(BigDecimal bigDecimal) {
    Decimal base = Decimal.parse(this.valor);
    Decimal parametro = Decimal.parse(bigDecimal.valor);

    if (base == parametro)
      return 0;
    else if (base > parametro)
      return 1;
    else if (base < parametro) return -1;

    return 0;
  }

  bool operator <(BigDecimal bigDecimal) {
    Decimal base = Decimal.parse(this.valor);
    Decimal parametro = Decimal.parse(bigDecimal.valor);
    return base < parametro;
  }

  bool operator <=(BigDecimal bigDecimal) {
    Decimal base = Decimal.parse(this.valor);
    Decimal parametro = Decimal.parse(bigDecimal.valor);
    return base <= parametro;
  }

  bool operator >(BigDecimal bigDecimal) {
    Decimal base = Decimal.parse(this.valor);
    Decimal parametro = Decimal.parse(bigDecimal.valor);
    return base > parametro;
  }

  bool operator >=(BigDecimal bigDecimal) {
    Decimal base = Decimal.parse(this.valor);
    Decimal parametro = Decimal.parse(bigDecimal.valor);
    return base >= parametro;
  }

  BigDecimal abs() {
    Decimal base = Decimal.parse(this.valor);
    valor = base.abs().toString();
    return this;
  }

  int toInt() {
    Decimal base = Decimal.parse(this.valor);
    return base.toBigInt().toInt();
  }

  double toDouble() {
    Decimal base = Decimal.parse(this.valor);
    return base.toDouble();
  }

  String toStringAsFixed(int casasDecimais) {
    Decimal base = Decimal.parse(this.valor);
    return base.toStringAsFixed(casasDecimais);
  }

  @override
  String toString() {
    return valor;
  }

  // ignore: non_constant_identifier_names
  factory BigDecimal.ZERO() => BigDecimal("0");

  // ignore: non_constant_identifier_names
  factory BigDecimal.ONE() => BigDecimal("1");

  factory BigDecimal.fromJson(dynamic d) {
    return BigDecimal(d.toString());
  }

  String toJson() => valor;

  @override
  // TODO: implement hashCode
  int get hashCode => super.hashCode;
}
