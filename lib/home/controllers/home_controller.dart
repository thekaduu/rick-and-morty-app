import 'dart:convert';

import 'package:ricknmorty/application/models/character.dart';
import 'package:ricknmorty/home/components/list_characters.dart';
import 'package:http/http.dart' as http;

class HomeController {
  List<Character> characters = [];
  String nextPage = '';
  String prevPage = '';
  bool loading = false;

  Future<List<Character>> loadCharacters() async {
    if (nextPage.isEmpty && prevPage.isNotEmpty) {
      throw Exception('Nenhum resultado encontrado');
    }

    if (loading) {
      return characters;
    }

    loading = true;

    var url = nextPage.isEmpty
        ? 'https://rickandmortyapi.com/api/character'
        : nextPage;

    Uri uri = Uri.parse(url);

    http.Response response = await http.get(uri);
    var body = jsonDecode(response.body);
    nextPage = body['info']['next'].toString();
    prevPage = body['info']['prev'].toString();

    List<dynamic> results = body['results'];
    results.forEach(_buildCharacter);
    print(url);
    loading = false;

    return characters;
  }

  void _buildCharacter(json) {
    Character character = Character.fromJson(json);

    characters.add(character);
  }
}
