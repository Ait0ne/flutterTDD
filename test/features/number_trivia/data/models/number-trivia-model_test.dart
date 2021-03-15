// @dart=2.9
import 'dart:convert';

import 'package:flutterTDD/features/number_trivia/data/models/number-trivia-model.dart';
import 'package:flutterTDD/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';


void main() {
  final tNumberTriviaModel = NumberTriviaModel(number: 1, text: 'Test Text');

  test('should be a subclass of NumberTrivia entity', () async {
    expect(tNumberTriviaModel, isA<NumberTrivia>());


  });

  group('fromJson', () {
    test('should return a valid model', () async {
      final Map<String, dynamic> jsonMap = json.decode(fixture('trivia.json'));

      final result = NumberTriviaModel.fromJson(jsonMap);

      expect(result, tNumberTriviaModel);

    });
  });


  group('toJson', () {
    test('should return a JSON map', () async {
      final result = tNumberTriviaModel.toJson();

      final expectedJSON = {
        "text": "Test Text",
        "number": 1,
      };

      expect(result, expectedJSON);

    });
  });

}