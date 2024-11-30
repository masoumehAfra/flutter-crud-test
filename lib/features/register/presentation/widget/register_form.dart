import 'package:flutter/material.dart';
import 'package:mc_crud_test/config/app_const_size/app_space.dart';
import 'package:mc_crud_test/config/app_extension/widget_extension.dart';

import '../../../global_widget/input/text_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        const CrudTestTextField(
          labelText: "First name",
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          textDirection: TextDirection.ltr,
        ),

        CrudTestSpace.margin18.hsp,


        const CrudTestTextField(
          labelText: "last Name",
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.text,
          textDirection: TextDirection.ltr,
        ),

        CrudTestSpace.margin18.hsp,


        const CrudTestTextField(
          labelText: "Phone number",
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.number,
          textDirection: TextDirection.ltr,
        ),

        CrudTestSpace.margin18.hsp,


        const CrudTestTextField(
          labelText: "email",
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          textDirection: TextDirection.ltr,
        ),


        CrudTestSpace.margin18.hsp,


        const CrudTestTextField(
          labelText: "Bank account number",
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.number,
          textDirection: TextDirection.ltr,
        ),




      ],
    );
  }
}
