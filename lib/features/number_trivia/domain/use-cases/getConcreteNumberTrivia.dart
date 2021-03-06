import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterTDD/core/Error/failures.dart';
import 'package:flutterTDD/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:flutterTDD/features/number_trivia/domain/repositories/number_trivia_repositories.dart';
import '../../../../core/usecases/usecase.dart';

class GetConcreteNumberTrivia extends UseCase<NumberTrivia, Params> {
  final NumberTriviaRepositiry repository;

  GetConcreteNumberTrivia(this.repository);

  
  Future<Either<Failure, NumberTrivia>>  call(Params params) async {
    return await repository.getConcreteNumberTrivia(params.number);
  }

}


class Params extends Equatable {
  final int number;

  Params({this.number=0});

  @override
  List<Object> get props => [number];
}