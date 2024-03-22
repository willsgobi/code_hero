import 'dart:convert';
import 'package:code_hero/src/helpers/configs.dart';
import 'package:code_hero/src/models/hero_list_model.dart';
import 'package:http/http.dart' as http;

class Repository {
  Future<Heros?> getHeros(int currentPage, String? searchName) async {
    const int limit = 4;
    var offset = 0;

    if (searchName == null || searchName.isEmpty) {
      offset = currentPage == 0 ? 0 : (limit * currentPage) - limit;
    }

    try {
      Map<String, String> queryParameters = {
        "limit": "$limit",
        "offset": "$offset",
        "ts": "1",
        "apikey": Config.apiKey,
        "hash": Config.hash,
      };

      if (searchName != null && searchName.isNotEmpty) {
        queryParameters.addAll({'name': searchName});
        queryParameters.remove("limit");
      }

      var url = Uri.https(
          'gateway.marvel.com:443', '/v1/public/characters', queryParameters);

      var response = await http.get(url);

      if (response.statusCode == 200) {
        var heros = Heros.fromJson(json.decode(response.body));
        return heros;
      }

      return null;
    } catch (error) {
      print(error);
      return null;
    }
  }
}
