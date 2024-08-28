// features/character/presentation/widgets/character_list_item.dart
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:test_app_marvels/core/extensions/string_extension.dart';
import 'package:test_app_marvels/core/routing/routes.dart';
import 'package:test_app_marvels/core/utils/constants.dart';

import '../../domain/entities/character.dart';

class CharacterListItem extends StatelessWidget {
  final Character character;

  const CharacterListItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kLighterGray,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      height: 420,
      margin: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: CachedNetworkImage(
              imageUrl: character.imageUrl,
              fit: BoxFit.cover,
              height: 220,
              width: double.infinity,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...[
                    const SizedBox(height: 10),
                    Text(
                      character.name,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    Text(
                      character.description.isEmpty
                          ? 'No description'
                          : character.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 20),
                  ],
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigate to the details page or perform an action
                        context.push(
                          Routes.characterDetails.ls,
                          extra: character,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 15),
                      ),
                      child: const Text(
                        'Details',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
