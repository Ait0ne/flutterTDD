// @dart=2.9
import 'package:dartz/dartz.dart';
import 'package:flutterTDD/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutterTDD/features/number_trivia/domain/repositories/number_trivia_repositories.dart';
import 'package:flutterTDD/features/number_trivia/domain/use-cases/getConcreteNumberTrivia.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';

class MockNUmberTriviaRepository extends Mock 
  implements NumberTriviaRepositiry {}

void main() {
  GetConcreteNumberTrivia usecase;
  MockNUmberTriviaRepository mockNUmberTriviaRepository;


  setUp((){
    mockNUmberTriviaRepository = MockNUmberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNUmberTriviaRepository);
  });

  final tNumber = 1;
  final tNumberTrivia = NumberTrivia(number: 1, text:  'test');

  test(
    'should get trivia for the number from the repository',
   () async {

         mockNUmberTriviaRepository = MockNUmberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNUmberTriviaRepository);
     when(mockNUmberTriviaRepository.getConcreteNumberTrivia(tNumber))
     .thenAnswer((realInvocation) async => Right(tNumberTrivia));

      final result = await usecase(Params(number: tNumber));

      expect(result, Right(tNumberTrivia));
      verify(mockNUmberTriviaRepository.getConcreteNumberTrivia(tNumber));
      verifyNoMoreInteractions(mockNUmberTriviaRepository);


   }
   
   );
}