import 'dart:convert';

import 'package:dirst/webtoon/models/webtoon_model.dart';
import 'package:http/http.dart' as http;
// Dart package: https://pub.dev/packages/http/install

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  // pub.dev : package repository for the Dart & Flutter
  Future<List<WebtoonModel>> getTodaysToons() async {
    final uri = Uri.parse("$baseUrl/$today");
    final response = await http.get(uri);
    List<WebtoonModel> webtoonInstances = [];

    if (response.statusCode == 200) {
      // print(response.body);
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        var jsonData = WebtoonModel.fromJson(webtoon);
        //print(jsonData.title);
        webtoonInstances.add(jsonData);
      }
      print(webtoonInstances[1].title);
      return webtoonInstances;
    }
    throw Error();
  }
}

// void main(List<String> args) {
//   ApiService app = ApiService();
//   app.getTodaysToons();
// }
