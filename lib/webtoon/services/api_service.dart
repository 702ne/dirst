import 'package:http/http.dart' as http;
// Dart package: https://pub.dev/packages/http/install

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  // pub.dev : package repository for the Dart & Flutter
  void getTodaysToons() async {
    final uri = Uri.parse("$baseUrl/$today");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      print(response.body);
      return;
    }
    throw Error();
  }
}

// void main(List<String> args) {
//   ApiService app = ApiService();
//   app.getTodaysToons();
// }
