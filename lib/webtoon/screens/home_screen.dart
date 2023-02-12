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
            return Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Expanded(child: makeList(futureReturn)),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> futureReturn) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: futureReturn.data!.length,
      itemBuilder: ((context, index) {
        var webtoon = futureReturn.data![index];
        print(index);
        return Column(
          children: [
            SizedBox(width: 250, child: Image.network(webtoon.thumb)),
            Text(webtoon.title),
          ],
        );
      }),
      separatorBuilder: (context, index) => const SizedBox(
        width: 20,
      ),
    );
  }
}
