class WebtoonEpisodeModel {
  final String title, thumb, id, rating, date;

// named constructor
  WebtoonEpisodeModel.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        thumb = json['thumb'],
        rating = json['rating'],
        date = json['date'],
        id = json['id'];
}
