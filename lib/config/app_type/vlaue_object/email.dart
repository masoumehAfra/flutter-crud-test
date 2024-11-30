import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mc_crud_test/config/app_extension/string_extension.dart';
import 'package:mc_crud_test/config/app_type/vlaue_object/value_failure.dart';

class EmailInput extends Equatable {
  final Either<ValueFailure, String> value;
  final String input;

  const EmailInput._({required this.input, required this.value});

  factory EmailInput(String input) {
    final inputTrim = input.trim();
    return EmailInput._(input: inputTrim, value: _validateEmail(inputTrim));
  }

  @override
  List<Object?> get props => [value, input];
}

Either<ValueFailure, String> _validateEmail(String input) {
  if (input.isEmpty) {
    return left(
      ValueFailure(
        type: InputFailureType.empty,
        failedValue: input,
      ),
    );
  } else if (!input.isValidEmail()) {
    return left(
      ValueFailure(
        type: InputFailureType.invalid,
        failedValue: input,
      ),
    );
  } else {
    return right(input);
  }
}
