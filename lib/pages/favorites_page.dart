import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practica_webservices/models/local_character.dart';

import '../boxes.dart';
import 'detail_character_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Boxes.getFavoritesCharacters().listenable(),
      builder: (context, box, _) {
        final favoriteCharacterBox = box.values.toList().cast<LocalCharacter>();
        return ListView.builder(
          itemCount: favoriteCharacterBox.length,
          itemBuilder: (BuildContext context, int index) {
            final character = favoriteCharacterBox[index];
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailCharacterPage(character),
                  ),
                );
              },
              child: Card(
                surfaceTintColor: Colors.blue,
                elevation: 4,
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        character.name!,
                        style: TextStyle(color: Colors.black, fontSize: 24),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      height: 300,
                      width: 300,
                      child: Ink.image(
                        image: NetworkImage(character.image!),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
