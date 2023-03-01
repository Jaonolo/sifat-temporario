import 'package:flutter_test/flutter_test.dart';

import 'fixture_reader.dart';

void main() {
  setUp(() {});

  test('Deve retornar um json', () async {
    //Arrange
    //Act
    final json =
        FixtureReader.getJsonData('core/fixture/fixture_reader_test.json');

    //Assert
    expect(json, allOf([
      isNotEmpty
    ]));
  });


  test('Deve retornar um Map<String, dynamic', () async {
    //Arrange
    //Act
    final data =
    FixtureReader.getData<Map<String,dynamic>>('core/fixture/fixture_reader_test.json');

    //Assert
    expect(data, allOf([
      isA<Map<String,dynamic>>()
    ]));
    expect(data['id'], 1);

  });

  test('Deve retornar uma Lista, ou seja o json é um Array<String, dynamic', () async {
    //Arrange
    //Act
    final data =
    FixtureReader.getData<List>('core/fixture/fixture_reader_list_test.json');

    //Assert
    expect(data, isA<List>());
    expect(data.isNotEmpty, isTrue);
    expect(data.first['id'], 'e048dbb3-6116-11ed-a5cb-20898409f05a');


  });







}
