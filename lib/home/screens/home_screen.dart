import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ricknmorty/components/Header.dart';
import 'package:ricknmorty/home/components/list_characters.dart';
import 'package:ricknmorty/styles/app_colors.dart';

import '../../application/models/character.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Character> characters = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        showBack: true,
      ),
      backgroundColor: AppColors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: Padding(
          padding: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  'Personagens',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontFamily: 'Galano',
                    color: AppColors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Flexible(
                child: ListCharacters(),
                flex: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
