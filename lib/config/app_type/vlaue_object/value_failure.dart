import 'package:equatable/equatable.dart';
enum InputFailureType{
  invalid,
  empty,
  short
}

class ValueFailure<T> extends Equatable{
  final T failedValue;
  final InputFailureType type;

  const ValueFailure({required this.failedValue,required this.type});


  @override
  List<Object?> get props => [failedValue,type];

}