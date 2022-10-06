import 'package:exam3/example/counter_cubit.dart';
import 'package:exam3/example/home.dart';
import 'package:exam3/presentation/tabs/tab_box/tab_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: BlocProvider(
        create: (_)=> CounterCubit(),
      child: HomePage1()

      )
    );
  }
}


//flutter packages pub run build_runner build --delete-conflicting-outputs
