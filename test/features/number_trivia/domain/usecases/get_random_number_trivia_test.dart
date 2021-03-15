// @dart=2.9
import 'package:dartz/dartz.dart';
import 'package:flutterTDD/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutterTDD/features/number_trivia/domain/use-cases/getRandomNumberTrivia.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutterTDD/features/number_trivia/domain/repositories/number_trivia_repositories.dart';
import "package:flutterTDD/core/usecases/usecase.dart";

class MockNumberTriviaRepository extends Mock
  implements NumberTriviaRepositiry {}


void main() {
  GetRandomNumberTrivia usecase;

  MockNumberTriviaRepository mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);
  });

  final tNumberTrivia = NumberTrivia(number: 1, text: 'test');

  test (
    'should get trivia from the repository',
    () async {
      mockNumberTriviaRepository = MockNumberTriviaRepository();
      usecase = GetRandomNumberTrivia(mockNumberTriviaRepository);

      when(mockNumberTriviaRepository.getRandomNumberTrivia())
      .thenAnswer((_) async => Right(tNumberTrivia));

      final result = await usecase(NoParams());

      expect(result, Right(tNumberTrivia));
      verify(mockNumberTriviaRepository.getRandomNumberTrivia());
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    }
  );
}