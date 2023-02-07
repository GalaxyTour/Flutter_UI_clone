class WebtoonModelEpisode {
  final String id, title, rating, date;

  WebtoonModelEpisode.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        rating = json['rating'],
        date = json['date'];
}
