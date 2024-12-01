part of 'register_cubit.dart';

enum GetDataStatus { loading, success, failure, editing }

class RegisterState extends Equatable {
  final GetDataStatus dataStatus;
  final bool showInvalidMessage;
  final String? firstName;
  final String? lastName;
  final String? dateBirth;
  final PhoneInput phoneNumber;
  final EmailInput email;
  final BankAccountNumberInput bankAccountNumber;

  const RegisterState({
    this.dataStatus = GetDataStatus.editing,
    this.showInvalidMessage = false,
    this.firstName,
    this.dateBirth,
    this.lastName,
   required this.phoneNumber,
   required this.email,
   required this.bankAccountNumber,
  });

  factory RegisterState.initial() =>  RegisterState(
    email: EmailInput(''),
    phoneNumber: PhoneInput(''),
    bankAccountNumber: BankAccountNumberInput(''),
  );

  @override
  List<Object?> get props => [
        dataStatus,
    showInvalidMessage,
        firstName,
        dateBirth,
        lastName,
        phoneNumber,
        email,
        bankAccountNumber
      ];

  RegisterState copyWith(
      {String? firstName,
      GetDataStatus? dataStatus,
      bool? showInvalidMessage,
      String? lastName,
      String? dateBirth,
      PhoneInput? phoneNumber,
        EmailInput? email,
        BankAccountNumberInput? bankAccountNumber}) {
    return RegisterState(
      dataStatus: dataStatus ?? this.dataStatus,
      showInvalidMessage: showInvalidMessage ?? this.showInvalidMessage,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dateBirth: dateBirth ?? this.dateBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      email: email ?? this.email,
      bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
    );
  }
}
