import 'package:flutter/material.dart';
import 'package:practica_webservices/models/local_character.dart';
import 'package:practica_webservices/models/response_api.dart';

import '../boxes.dart';

class DetailCharacterPage extends StatefulWidget {
  final dynamic character;

  DetailCharacterPage(this.character);

  @override
  State<DetailCharacterPage> createState() =>
      _DetailCharacterPageState(character);
}

class _DetailCharacterPageState extends State<DetailCharacterPage> {
  final dynamic character;

  _DetailCharacterPageState(this.character);

  var isFavorite = false;

  void _getFavoritesCharacters() {
    final box = Boxes.getFavoritesCharacters();
    box.values.forEach((element) {
      if (element.id == character.id) {
        print("${element.name} está en favoritos");
        setState(() {
          isFavorite = true;
        });
      }
    });
  }

  void _onFavoriteButtonClicked() {
    var localCharacter = LocalCharacter()
      ..name = character.name
      ..image = character.image
      ..status = character.status
      ..species = character.species
      ..gender = character.gender
      ..origin =
          character.origin is String ? character.origin : character.origin?.name
      ..location = character.location is String
          ? character.location
          : character.location?.name
      ..id = character.id;

    final box = Boxes.getFavoritesCharacters();
    if (isFavorite) {
      print("Eliminando");
      box.delete(localCharacter.id);
    } else {
      print("Agregando");
      box.put(localCharacter.id, localCharacter);
    }
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  void initState() {
    _getFavoritesCharacters();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character.name ?? "Name"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                "${character.image}",
                scale: 0.75,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                    child: IconButton(
                      alignment: Alignment.topRight,
                      icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border),
                      color: Colors.red,
                      onPressed: () {
                        _onFavoriteButtonClicked();
                      },
                    ),
                  ),
                ],
              ),
              Text("Status: ${character.status}",
                  style: TextStyle(fontSize: 20)),
              const SizedBox(
                height: 8,
              ),
              Text("Specie: ${character.species}",
                  style: TextStyle(fontSize: 20)),
              const SizedBox(
                height: 8,
              ),
              Text("Gender: ${character.gender}",
                  style: TextStyle(fontSize: 20)),
              const SizedBox(
                height: 8,
              ),
              Text(
                  "Origin: ${character.origin is String ? character.origin : character.origin?.name}",
                  style: TextStyle(fontSize: 20)),
              const SizedBox(
                height: 8,
              ),
              Text(
                  "Location: ${character.location is String ? character.location : character.location?.name}",
                  style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}
