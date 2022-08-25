import 'package:exam3/presentation/tabs/tab_box/tab_box.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Third Exam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TabBox(),
    );
  }
}


//flutter packages pub run build_runner build --delete-conflicting-outputs
