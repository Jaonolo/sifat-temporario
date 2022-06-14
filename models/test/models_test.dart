import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:models/model/models.dart';
import 'package:rational/rational.dart';

void main() {
  test('adds one to input values', () {

    // BigDecimal a = new BigDecimal("1");
    // BigDecimal b = new BigDecimal("0");
    //
    //
    // BigDecimal result = b.dividir(a);

    BigDecimal a = new BigDecimal("3");
    BigDecimal b = new BigDecimal("1");


    BigDecimal result = b.dividir(a);
    print(result);
  });

  test("description", () {



    Decimal base = Decimal.parse("1");
    Decimal parametro = Decimal.parse("3");
    Rational result = (base / parametro);
    print("sem o precision " + result.toString());

    Rational result1 = (base / parametro);
    print("com precision " + result1.toDecimal(scaleOnInfinitePrecision: 8).toString());



  });
}
