import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud_test/features/register/presentation/widget/header_form.dart';
import '../../../../config/app_const_size/app_space.dart';
import '../bloc/register/register_cubit.dart';
import '../widget/register_button.dart';
import '../widget/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pageHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: pageHeight - MediaQuery.of(context).padding.top,
          ),
          padding: EdgeInsets.fromLTRB(
              CrudTestSpace.margin32,
              CrudTestSpace.screen.upMargin,
              CrudTestSpace.margin32,
              CrudTestSpace.screen.downMargin),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [HeaderForm(), RegisterForm()],
              ),
              RegisterButton(
                onPressed: () {

                  context.read<RegisterCubit>().registerConsumer();
                },
                getState: context.watch<RegisterCubit>().state.dataStatus,
              )
            ],
          ),
        ),
      ),
    );
  }
}
