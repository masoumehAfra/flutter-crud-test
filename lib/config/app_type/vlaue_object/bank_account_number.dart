import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:mc_crud_test/config/app_extension/string_extension.dart';
import 'package:mc_crud_test/config/app_type/vlaue_object/value_failure.dart';

class BankAccountNumberInput extends Equatable {
  final Either<ValueFailure, String> value;
  final String input;

  const BankAccountNumberInput._({required this.input, required this.value});

  factory BankAccountNumberInput(String input) {
    final inputTrim = input.trim();
    return BankAccountNumberInput._(
      input: inputTrim,
      value: _validatePhone(inputTrim),
    );
  }

  @override
  List<Object?> get props => [input, value];
}

Either<ValueFailure, String> _validatePhone(String input) {
  if (input.isEmpty) {
    return left(
      ValueFailure(
        type: InputFailureType.empty,
        failedValue: input,
      ),
    );
  } else if (!input.isValidBankAccountNumber() || input.length < 5) {
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
