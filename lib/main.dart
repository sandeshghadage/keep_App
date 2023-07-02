import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Color(0xff202124)),
      debugShowCheckedModeBanner: false,
      title: 'Keep App',
      home: HomePage(),
    );
  }
}
