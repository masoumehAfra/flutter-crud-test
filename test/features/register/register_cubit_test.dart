import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/config/app_type/vlaue_object/bank_account_number.dart';
import 'package:mc_crud_test/config/app_type/vlaue_object/email.dart';
import 'package:mc_crud_test/config/app_type/vlaue_object/phone.dart';
import 'package:mc_crud_test/features/register/domain/entities/entities.dart';
import 'package:mc_crud_test/features/register/domain/params/cosumer_param.dart';
import 'package:mc_crud_test/features/register/presentation/bloc/register/register_cubit.dart';
import 'package:mockito/mockito.dart';
import '../../helper/mock/register/register_mock.mocks.dart';

void main() {
  late RegisterCubit registerCubit;
  late MockRegisterUC mockRegisterUser;

  const validEmail = "admin@etlo.com";
  const invalidEmail = "1@";
  const lastName = "afra";

  const registerParams = CustomerParams(
      email: validEmail,
      phoneNumber: "09116602618",
      firstName: "dorsa",
      lastName: "afra",
      bankAccountNumber: "US12ABCD1234",
      dateOfBirth: "2020/12/10");

  setUp(() async {
    mockRegisterUser = MockRegisterUC();
    registerCubit = RegisterCubit(mockRegisterUser);
  });

  /// Dispose bloc
  tearDown(() {
    registerCubit.close();
  });

  ///  Initial data should be editing
  test("Initial data should be EditDataStatus.editing", () {
    expect(registerCubit.state.dataStatus, GetDataStatus.editing);
  });

  blocTest<RegisterCubit, RegisterState>(
    'When input email is invalid should be return  showInvalidMessage: true',
    build: () => registerCubit,
    act: (cubit) {
      cubit.emailChanged(invalidEmail);
      cubit.lastNameChanged(lastName);
      cubit.registerConsumer();
    },
    wait: const Duration(seconds: 1),
    expect: () => [
      RegisterState(
        phoneNumber: PhoneInput(''),
        email: EmailInput(invalidEmail),
        lastName: null,
        bankAccountNumber: BankAccountNumberInput(''),
      ),
      RegisterState(
        phoneNumber: PhoneInput(''),
        email: EmailInput(invalidEmail),
        lastName: lastName,
        bankAccountNumber: BankAccountNumberInput(''),
      ),
      RegisterState(
        showInvalidMessage: true,
        phoneNumber: PhoneInput(''),
        email: EmailInput(invalidEmail),
        lastName: lastName,
        bankAccountNumber: BankAccountNumberInput(''),
      ),
    ],
  );

  blocTest<RegisterCubit, RegisterState>(
    'When repo success get data should be return AuthState.success',
    build: () {
      when(mockRegisterUser.call(any))
          .thenAnswer((_) async => const Left(true));

      return registerCubit;
    },
    act: (cubit) async {
      cubit.emailChanged(registerParams.email);
      cubit.phoneChanged(registerParams.phoneNumber);
      cubit.bankAccountChanged(registerParams.bankAccountNumber);
      cubit.nameChanged(registerParams.firstName);
      cubit.lastNameChanged(registerParams.lastName);
      cubit.dateChanged(const DateEntity(year: 2020, month: 12, day: 10));
      // cubit.acceptConditionsChanged(true);
      cubit.registerConsumer();
    },
    wait: const Duration(seconds: 1),
    expect: () => [
      RegisterState(
        phoneNumber: PhoneInput(''),
        email: EmailInput(registerParams.email),
        bankAccountNumber: BankAccountNumberInput(''),
      ),
      RegisterState(
        phoneNumber: PhoneInput(registerParams.phoneNumber),
        email: EmailInput(registerParams.email),
        bankAccountNumber: BankAccountNumberInput(''),
      ),
      RegisterState(
        phoneNumber: PhoneInput(registerParams.phoneNumber),
        email: EmailInput(registerParams.email),
        bankAccountNumber:
            BankAccountNumberInput(registerParams.bankAccountNumber),
      ),
      RegisterState(
        phoneNumber: PhoneInput(registerParams.phoneNumber),
        email: EmailInput(registerParams.email),
        firstName: registerParams.firstName,
        bankAccountNumber:
            BankAccountNumberInput(registerParams.bankAccountNumber),
      ),
      RegisterState(
        phoneNumber: PhoneInput(registerParams.phoneNumber),
        email: EmailInput(validEmail),
        firstName: registerParams.firstName,
        lastName: registerParams.lastName,
        bankAccountNumber:
            BankAccountNumberInput(registerParams.bankAccountNumber),
      ),
      RegisterState(
        phoneNumber: PhoneInput(registerParams.phoneNumber),
        email: EmailInput(validEmail),
        firstName: registerParams.firstName,
        lastName: registerParams.lastName,
        dateBirth: registerParams.dateOfBirth,
        bankAccountNumber:
            BankAccountNumberInput(registerParams.bankAccountNumber),
      ),
      RegisterState(
        dataStatus: GetDataStatus.loading,
        phoneNumber: PhoneInput(registerParams.phoneNumber),
        email: EmailInput(validEmail),
        firstName: registerParams.firstName,
        lastName: registerParams.lastName,
        dateBirth: registerParams.dateOfBirth,
        bankAccountNumber:
            BankAccountNumberInput(registerParams.bankAccountNumber),
      ),
      RegisterState(
        dataStatus: GetDataStatus.success,
        phoneNumber: PhoneInput(registerParams.phoneNumber),
        email: EmailInput(validEmail),
        firstName: registerParams.firstName,
        lastName: registerParams.lastName,
        dateBirth: registerParams.dateOfBirth,
        bankAccountNumber:
            BankAccountNumberInput(registerParams.bankAccountNumber),
      ),
    ],
  );
}
