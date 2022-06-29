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
  List<Character> characters = [];

  @override
  void initState() {
    super.initState();
    fetch();
  }

  fetch() async {
    try {
      final List<Character> response = await _homeController.loadCharacters();
      setState(() {
        characters = response;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index >= characters.length / 2) {
          fetch();
        }
        final character = characters[index];
        return CharacterCard(character: character);
      },
      itemCount: characters.length,
    );
  }
}
