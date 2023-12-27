import 'package:flutter/material.dart';
import 'package:post_request/presentation/screens/home.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // color: Color(0xff1E1F27),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color(0xff1E1F27), brightness: Brightness.dark)),
      home: HomePage(),
    );
  }
}

void main(List<String> args) {
  runApp(MyApp());
}
