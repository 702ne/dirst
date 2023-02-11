import 'package:dirst/webtoon/models/webtoon_model.dart';
import 'package:dirst/webtoon/services/api_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  Future<List<WebtoonModel>> toons = ApiService().getTodaysToons();
// webtoons = await ApiService().getTodaysToons();
  @override
  Widget build(BuildContext context) {
    // print(webtoons);
    // print(isLoading);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          '오늘의 웹툰',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.green,
        elevation: 2,
      ),
      body: FutureBuilder(
        future: toons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const Text("This is a Data");
          }
          return const Text("Loading");
        },
      ),
    );
  }
}
