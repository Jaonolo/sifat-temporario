part of openapi.api;

@JsonSerializable()
class BigDecimal {
  String valor = '0';

  BigDecimal(this.valor) {
    if (valor.isEmpty) valor = '0';
  }

  BigDecimal operator +(BigDecimal? bigDecimal) {
    return somar(bigDecimal);
  }

  BigDecimal somar(BigDecimal? bigDecimal) {
    if (bigDecimal == null) return this;
    Decimal base = Decimal.parse(valor);
    Decimal parametro = Decimal.parse(bigDecimal.valor);
    return BigDecimal((base + parametro).toString());
  }

  BigDecimal operator -(BigDecimal? bigDecimal) {
    return subtrair(bigDecimal);
  }

  BigDecimal subtrair(BigDecimal? bigDecimal) {
    if (bigDecimal == null) return this;
    Decimal base = Decimal.parse(valor);
    Decimal parametro = Decimal.parse(bigDecimal.valor);
    return BigDecimal((base - parametro).toString());
  }

  BigDecimal operator *(BigDecimal? bigDecimal) {
    if (bigDecimal == null) return this;
    return multiplicar(bigDecimal);
  }

  BigDecimal operator ~/(BigDecimal? bigDecimal) {
    if (bigDecimal == null) return this;
    Decimal base = Decimal.parse(valor);
    Decimal parametro = Decimal.parse(bigDecimal.valor);
    return BigDecimal((base ~/ parametro).toString());
  }

  BigDecimal multiplicar(BigDecimal? bigDecimal) {
    if (bigDecimal == null) return this;
    Decimal base = Decimal.parse(valor);
    Decimal parametro = Decimal.parse(bigDecimal.valor);
    return BigDecimal((base * parametro).toString());
  }

  BigDecimal operator /(BigDecimal? bigDecimal) {
    if (bigDecimal == null) return this;
    return dividir(bigDecimal);
  }

  BigDecimal dividir(BigDecimal? bigDecimal) {
    if (bigDecimal == null) return this;
    Decimal base = Decimal.parse(valor);
    Decimal parametro = Decimal.parse(bigDecimal.valor);
    Rational retornoRational = base / parametro;
    Decimal result = retornoRational.toDecimal(scaleOnInfinitePrecision: 8);

    return BigDecimal(result.toString());
  }

  @override
  bool operator ==(Object bigDecimal) {
    if (bigDecimal is BigDecimal) return compareTo(bigDecimal) == 0;
    if (bigDecimal is String) {
      return compareTo(BigDecimal(bigDecimal)) == 0;
    }

    throw Exception("Tipo não suportado -> $bigDecimal");
  }

  int compareTo(BigDecimal bigDecimal) {
    Decimal base = Decimal.parse(valor);
    Decimal parametro = Decimal.parse(bigDecimal.valor);

    if (base == parametro) {
      return 0;
    } else if (base > parametro) {
      return 1;
    } else if (base < parametro) {
      return -1;
    }

    return 0;
  }

  bool operator <(BigDecimal bigDecimal) {
    Decimal base = Decimal.parse(valor);
    Decimal parametro = Decimal.parse(bigDecimal.valor);
    return base < parametro;
  }

  bool operator <=(BigDecimal bigDecimal) {
    Decimal base = Decimal.parse(valor);
    Decimal parametro = Decimal.parse(bigDecimal.valor);
    return base <= parametro;
  }

  bool operator >(BigDecimal bigDecimal) {
    Decimal base = Decimal.parse(valor);
    Decimal parametro = Decimal.parse(bigDecimal.valor);
    return base > parametro;
  }

  bool operator >=(BigDecimal bigDecimal) {
    Decimal base = Decimal.parse(valor);
    Decimal parametro = Decimal.parse(bigDecimal.valor);
    return base >= parametro;
  }

  BigDecimal abs() {
    Decimal base = Decimal.parse(valor);
    valor = base.abs().toString();
    return this;
  }

  int toInt() {
    Decimal base = Decimal.parse(valor);
    return int.parse(base.toString());
  }

  double toDouble() {
    Decimal base = Decimal.parse(valor);
    return base.toDouble();
  }

  String toStringAsFixed(int casasDecimais) {
    Decimal base = Decimal.parse(valor);
    return base.toStringAsFixed(casasDecimais);
  }

  @override
  String toString() {
    return valor;
  }

  factory BigDecimal.ZERO() => BigDecimal("0");

  factory BigDecimal.ONE() => BigDecimal("1");

  factory BigDecimal.fromJson(dynamic d) {
    return BigDecimal(d.toString());
  }

  String toJson() => valor;

  @override
  int get hashCode => super.hashCode;
}
