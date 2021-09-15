import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:practical/ui/country_screen.dart';

Dio dio = Dio();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CountryScreen(),
    );
  }
}
