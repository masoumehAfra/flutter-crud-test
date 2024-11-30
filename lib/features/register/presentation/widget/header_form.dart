import 'package:flutter/material.dart';
import 'package:mc_crud_test/config/app_const_size/app_space.dart';
import 'package:mc_crud_test/config/app_extension/widget_extension.dart';

class HeaderForm extends StatelessWidget {
  const HeaderForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       CrudTestSpace.screen.sHeaderBody.hsp,
      const  Text("Welcome", style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500)),
        8.hsp,
      const  Text(
          "Login to use app feature",
          style:TextStyle(color:  Color(0xff8690A2),fontSize: 14,fontWeight: FontWeight.w400),
        ),
        CrudTestSpace.margin32.hsp,
      ],
    );
  }
}
