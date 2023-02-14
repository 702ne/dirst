import 'dart:convert';

import 'package:dirst/webtoon/models/webtoon_detail_model.dart';
import 'package:dirst/webtoon/models/webtoon_model.dart';
import 'package:http/http.dart' as http;

import '../models/webtoon_episode_model.dart';
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
      //print(webtoonInstances[1].title);
      return webtoonInstances;
    }
    throw Error();
  }

  Future<WebtoonDetailModel> getToonById(String id) async {
    final uri = Uri.parse("$baseUrl/$id");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final dynamic webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  Future<List<WebtoonEpisodeModel>> getLatestEpisodesbyId(String id) async {
    final uri = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(uri);

    List<WebtoonEpisodeModel> webtoonInstances = [];

    if (response.statusCode == 200) {
      final List<dynamic> episodes = jsonDecode(response.body);
      for (var webtoon in episodes) {
        webtoonInstances.add(WebtoonEpisodeModel.fromJson(webtoon));
      }

      return webtoonInstances;
    }
    throw Error();
  }
}


// void main(List<String> args) {
//   ApiService().getTodaysToons();
// }
