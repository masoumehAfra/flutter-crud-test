import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mc_crud_test/config/app_const_size/app_space.dart';
import 'package:mc_crud_test/config/app_extension/widget_extension.dart';
import 'package:mc_crud_test/features/register/domain/entities/date_entity.dart';
import 'package:mc_crud_test/features/register/presentation/widget/date_picker.dart';

import '../../../../config/app_type/vlaue_object/value_failure.dart';
import '../../../global_widget/input/text_field.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../bloc/register/register_cubit.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, RegisterState>(
      listenWhen: (previous, current) {
        /// if state doesn't change => don't listen to changes

        if (current.dataStatus == previous.dataStatus) {
          return false;
        } else if (current.dataStatus == GetDataStatus.loading) {
          return false;
        }
        return true;
      },
      listener: (context, state) async {
        switch (state.dataStatus) {
          case GetDataStatus.success:
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const HomeScreen()));
            break;
          case GetDataStatus.failure:
            Fluttertoast.showToast(
              msg: "Email must be unique",
              toastLength: Toast.LENGTH_SHORT, // or Toast.LENGTH_LONG
              gravity: ToastGravity.BOTTOM, // Can be TOP, BOTTOM, CENTER
              backgroundColor: Colors.black,
              textColor: Colors.white,
              fontSize: 16.0,
            );
            break;
          default:
            break;
        }
      },
      child:
          BlocBuilder<RegisterCubit, RegisterState>(builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        return Column(
          children: [
            CrudTestTextField(
              labelText: "First name",
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              textDirection: TextDirection.ltr,
              onChanged: cubit.nameChanged,
              valid: (v) => v?.isEmpty != false ? "Please enter name" : null,
              autovalidateMode: state.showInvalidMessage
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
            ),
            CrudTestSpace.margin18.hsp,
            CrudTestTextField(
              labelText: "Last Name",
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.text,
              onChanged: cubit.lastNameChanged,
              textDirection: TextDirection.ltr,
              valid: (v) =>
                  v?.isEmpty != false ? "Please enter last name" : null,
              autovalidateMode: state.showInvalidMessage
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
            ),
            CrudTestSpace.margin18.hsp,
            CrudTestTextField(
              labelText: "Phone number",
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              textDirection: TextDirection.ltr,
              onChanged: cubit.phoneChanged,
              autovalidateMode: state.showInvalidMessage
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              valid: (_) {
                return state.phoneNumber.value.fold<String?>(
                  (f) {
                    switch (f.type) {
                      case InputFailureType.invalid:
                        return "invalid phone error";
                      case InputFailureType.empty:
                        return "empty phone error";
                      default:
                        return "invalid phone error";
                    }
                  },
                  (_) => null,
                );
              },
            ),
            CrudTestSpace.margin18.hsp,
            CrudTestTextField(
              labelText: "Email",
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              textDirection: TextDirection.ltr,
              onChanged: cubit.emailChanged,
              autovalidateMode: state.showInvalidMessage
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              valid: (_) {
                return state.email.value.fold<String?>(
                  (f) {
                    switch (f.type) {
                      case InputFailureType.invalid:
                        return "invalid email error";
                      case InputFailureType.empty:
                        return "empty email error";
                      default:
                        return "invalid email error";
                    }
                  },
                  (_) => null,
                );
              },
            ),
            CrudTestSpace.margin18.hsp,
            CrudTestTextField(
              labelText: "Bank account number",
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              textDirection: TextDirection.ltr,
              onChanged: cubit.bankAccountChanged,
 /*             autovalidateMode: state.showInvalidMessage
                  ? AutovalidateMode.always
                  : AutovalidateMode.disabled,
              valid: (_) {
                return state.bankAccountNumber.value.fold<String?>(
                  (f) {
                    switch (f.type) {
                      case InputFailureType.invalid:
                        return "invalid bank account number error";
                      case InputFailureType.empty:
                        return "empty bank account number error";
                      default:
                        return "invalid bank account number error";
                    }
                  },
                  (_) => null,
                );
              },*/
            ),
            CrudTestSpace.margin18.hsp,
            CrudTestDatePicker(dateChanged: cubit.dateChanged),
            CrudTestSpace.screen.sHeaderBody.hsp,
          ],
        );
      }),
    );
  }
}
