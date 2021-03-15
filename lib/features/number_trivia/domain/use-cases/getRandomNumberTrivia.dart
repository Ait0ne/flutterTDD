import 'package:dartz/dartz.dart';
import 'package:flutterTDD/core/Error/failures.dart';
import 'package:flutterTDD/core/usecases/usecase.dart';
import 'package:flutterTDD/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutterTDD/features/number_trivia/domain/repositories/number_trivia_repositories.dart';

class GetRandomNumberTrivia extends UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepositiry repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return await repository.getRandomNumberTrivia();
  }
}