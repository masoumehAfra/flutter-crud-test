import 'package:equatable/equatable.dart';

class CustomerParams extends Equatable {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String email;
  final String bankAccountNumber;
  final String dateOfBirth;

  const CustomerParams({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.bankAccountNumber,
    required this.dateOfBirth,
  });

  @override
  List<Object?> get props => [bankAccountNumber, dateOfBirth, firstName, lastName, phoneNumber, email];

  Map<String, dynamic> toMap() {
    return {
      'firstname': firstName,
      'lastname': lastName,
      'dateOfBirth': dateOfBirth,
      'phoneNumber': phoneNumber,
      'email': email,
      'bankAccountNumber': bankAccountNumber,
    };

  }
}
