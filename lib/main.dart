import 'package:dumper/Screens/Welcome/splash_screen.dart';
import 'package:dumper/constants/constants.dart';
import 'package:flutter/material.dart';

const SERVER_IP = 'http://localhost:8080';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dumper',
      theme: ThemeData(
          primaryColor: kPrimaryColor, scaffoldBackgroundColor: Colors.white),
      home: const SplashScreen(),
    );
  }
}
