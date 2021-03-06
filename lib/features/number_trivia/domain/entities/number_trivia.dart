import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class NumberTrivia extends Equatable {
  final String text;
  final int number;

  NumberTrivia({
    this.text="",
    this.number=0,
  });

  @override
  List<Object> get props => [text, number];
}
