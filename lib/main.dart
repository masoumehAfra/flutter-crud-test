import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/app_dependency_injection/main_dependency_injection.dart';
import 'features/register/presentation/bloc/register/register_cubit.dart';
import 'features/register/presentation/pages/register_screen.dart';

void main() async{
  await MainDependencyInjection.setup();
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:BlocProvider<RegisterCubit>(
          create: (_) => locator<RegisterCubit>(),
          child:   const RegisterScreen())


    ,
    );
  }
}


