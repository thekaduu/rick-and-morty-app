import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ricknmorty/styles/app_colors.dart';

import '../../application/models/character.dart';

class CharacterCard extends StatelessWidget {
  final Character character;

  const CharacterCard({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle tilteCardStyle = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 24.0,
      color: AppColors.white,
      leadingDistribution: TextLeadingDistribution.even,
      height: 1.1,
    );
    return Card(
      elevation: 0.0,
      color: AppColors.black,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: [
          Image.network(
            character.picture,
            width: 120.0,
            height: 180.0,
            fit: BoxFit.cover,
          ),
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    character.fullName,
                    style: tilteCardStyle,
                  ),
                  Text(
                    "${character.statusTranslated} - ${character.species}",
                    style: TextStyle(
                      color: AppColors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Última Localização:',
                          style: TextStyle(
                              color: AppColors.disabled,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          character.lastKnowLocation,
                          style: TextStyle(
                            color: AppColors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Primeira vez visto:',
                          style: TextStyle(
                              color: AppColors.disabled,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          character.origin,
                          style: TextStyle(
                            color: AppColors.white,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
