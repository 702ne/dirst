import 'package:dirst/webtoon/screens/home_screen.dart';
import 'package:dirst/webtoon/services/api_service.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  ApiService().getTodaysToons();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}