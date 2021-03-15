import 'package:dartz/dartz.dart';

import '../../../../core/Error/failures.dart';
import '../entities/number_trivia.dart';

abstract class NumberTriviaRepositiry {
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(int number);

  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia();
}