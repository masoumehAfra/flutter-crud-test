import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/config/app_type/vlaue_object/phone.dart';
import '../../../../../config/app_type/vlaue_object/bank_account_number.dart';
import '../../../../../config/app_type/vlaue_object/email.dart';
import '../../../domain/entities/date_entity.dart';
import '../../../domain/params/cosumer_param.dart';
import '../../../domain/use_cases/register.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  final RegisterUC _registerUC;

  RegisterCubit(this._registerUC) : super(RegisterState.initial());

  Future<void> registerConsumer() async {
    if (!checkValidations()) return;
    emit(state.copyWith(dataStatus: GetDataStatus.loading));

    final result = await _registerUC.call(CustomerParams(
        firstName: state.firstName!,
        lastName: state.lastName!,
        email: state.email.input,
        phoneNumber: state.phoneNumber.input,
        bankAccountNumber: state.bankAccountNumber.input,
        dateOfBirth: state.dateBirth!));

    result.fold(
        (success) {
          if(success){
            emit(state.copyWith(dataStatus: GetDataStatus.success));
          }else{
            emit(state.copyWith(dataStatus: GetDataStatus.failure));
          }
        },
        (error) => emit(state.copyWith(dataStatus: GetDataStatus.failure)));
  }

  void emailChanged(String value) {
    emit(state.copyWith(email: EmailInput(value)));
  }

  void bankAccountChanged(String value) {
    emit(state.copyWith(bankAccountNumber: BankAccountNumberInput(value)));
  }

  void phoneChanged(String value) {
    emit(state.copyWith(phoneNumber: PhoneInput(value)));
  }

  void nameChanged(String value) {
    emit(state.copyWith(firstName: value));
  }

  void lastNameChanged(String value) {
    emit(state.copyWith(lastName: value));
  }

  void dateChanged(DateEntity value) {
    emit(
        state.copyWith(dateBirth: "${value.year}/${value.month}/${value.day}"));
  }

  bool checkValidations() {
    if (

    (state.firstName?.trim().isEmpty ?? true) ||
        (state.lastName?.trim().isEmpty ?? true) ||
        (!state.email.value.isRight())
    ||
        (state.dateBirth?.trim().isEmpty ?? true) ||
        (!state.phoneNumber.value.isRight())
       ||  (!state.bankAccountNumber.value.isRight())


    ) {
      emit(state.copyWith(
        showInvalidMessage: true,
      ));
      return false;
    }

    return true;
  }
}
