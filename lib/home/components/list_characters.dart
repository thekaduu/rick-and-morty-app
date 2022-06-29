import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ricknmorty/application/models/character.dart';
import 'package:ricknmorty/home/components/character_card.dart';
import 'package:ricknmorty/home/controllers/home_controller.dart';

class ListCharacters extends StatefulWidget {
  const ListCharacters({Key? key}) : super(key: key);

  @override
  State<ListCharacters> createState() => _ListCharactersState();
}

class _ListCharactersState extends State<ListCharacters> {
  HomeController _homeController = HomeController();

  late Future<List<Character>> futureCharacters;

  @override
  void initState() {
    super.initState();
    futureCharacters = _homeController.loadCharacters();
  }

  void fetchCharacters() {
    futureCharacters = _homeController.loadCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureCharacters,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Character> characters = snapshot.data! as List<Character>;

          return ListView.builder(
              itemCount: characters.length,
              itemBuilder: (context, index) {
                final Character character = characters[index];
                if (index >= characters.length / 2) {
                  fetchCharacters();
                  print(index);
                }
                return CharacterCard(character: character);
              });
        }

        if (snapshot.hasError) {
          return Text('Deu ruim');
        }

        return CircularProgressIndicator();
      },
    );
  }
}
