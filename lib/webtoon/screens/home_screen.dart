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
        builder: (context, futureReturn) {
          if (futureReturn.hasData) {
            /* 1. Simple list
            return ListView(
              children: [
                for (var webtoon in futureReturn.data!) Text(webtoon.title),
              ],
            ); 
            */
            /* 2. load data when it need
           return ListView.builder(
                // scrollDirection: Axis.horizontal,
                itemCount: futureReturn.data!.length,
                itemBuilder: ((context, index) {
                  var webtoon = futureReturn.data![index];
                  print(index);
                  return Text(webtoon.title);
                }));
                */
            // 3. list with separator
            return ListView.separated(
              // scrollDirection: Axis.horizontal,
              itemCount: futureReturn.data!.length,
              itemBuilder: ((context, index) {
                var webtoon = futureReturn.data![index];
                print(index);
                return Text(webtoon.title);
              }),
              separatorBuilder: (context, index) => const SizedBox(
                height: 20,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
