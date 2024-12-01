import '../../domain/entities/customer_entity.dart';

class CustomerModel extends CustomerEntity {
  const CustomerModel({
    required super.firstName,
    required super.lastName,
    required super.dateOfBirth,
    required super.bankAccountNumber,
    required super.email,
    required super.phoneNumber,
  });

  CustomerEntity toEntity() => this;

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      firstName: map['firstname'] as String,
      lastName: map['lastname'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
      phoneNumber: map['phoneNumber'] as String,
      email: map['email'] as String,
      bankAccountNumber: map['bankAccountNumber'] as String,
    );
  }

}
