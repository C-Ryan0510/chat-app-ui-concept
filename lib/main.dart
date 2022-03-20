import 'package:flutter/material.dart';
import 'screens/HomeScreen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chat UI',
      theme: ThemeData(
        primaryColor: Colors.red,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Color(0xFFFEF8E8), // Your accent color
          )
      ),
      home: HomeScreen(),
    );
  }
}