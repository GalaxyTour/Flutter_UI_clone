import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:webtoon_app/models/webtoon_model.dart';
import 'package:webtoon_app/models/webtoon_model_detail.dart';
import 'package:webtoon_app/models/webtoon_model_episode.dart';

class ApiService {
  static const String baseUrl =
      "https://webtoon-crawler.nomadcoders.workers.dev";
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodaysToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoons = jsonDecode(response.body);

      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }

      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonModelDetail> getToonById(String id) async {
    final url = Uri.parse('$baseUrl/$id');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonModelDetail.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonModelEpisode>> getLatestEpisodeById(
      String id) async {
    List<WebtoonModelEpisode> episodesInstances = [];
    final url = Uri.parse('$baseUrl/$id/episodes');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (var episode in episodes) {
        episodesInstances.add(WebtoonModelEpisode.fromJson(episode));
      }
      return episodesInstances;
    }
    throw Error();
  }
}
