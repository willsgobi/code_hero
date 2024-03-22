import 'package:code_hero/src/app_widget.dart';
import 'package:code_hero/src/helpers/configs.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Hero',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(seedColor: Config.mainColor),
        useMaterial3: true,
      ),
      home: const AppWidget(),
    );
  }
}
