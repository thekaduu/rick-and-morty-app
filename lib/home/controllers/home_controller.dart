import 'dart:convert';

import 'package:ricknmorty/application/models/character.dart';
import 'package:ricknmorty/home/components/list_characters.dart';
import 'package:http/http.dart' as http;

class HomeController {
  List<Character> characters = [];
  String nextPage = '';

  Future<List<Character>> loadCharacters() async {
    var url = nextPage.isNotEmpty
        ? nextPage
        : 'https://rickandmortyapi.com/api/character';

    Uri uri = Uri.parse(url);

    http.Response response = await http.get(uri);
    var body = jsonDecode(response.body);
    nextPage = body['info']['next'];

    List<dynamic> results = body['results'];
    results.forEach(_buildCharacter);
    return characters;
  }

  void _buildCharacter(json) {
    Character character = Character.fromJson(json);

    characters.add(character);
  }
}
