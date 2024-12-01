import 'package:equatable/equatable.dart';

class CustomerEntity extends Equatable {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String bankAccountNumber;
  final String dateOfBirth;

  const CustomerEntity({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.bankAccountNumber,
    required this.dateOfBirth,
  });

  @override
  List<Object?> get props =>
      [bankAccountNumber, dateOfBirth, firstName, lastName, phoneNumber, email];
}
