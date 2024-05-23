import 'package:flutter/material.dart';
import 'package:practica_webservices/models/response_api.dart';
import 'package:practica_webservices/repository/rickmorty_db_api.dart';

import 'detail_character_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Results> _listCharacters = <Results>[];
  final RickmortyDbApi _RickmortyDbApi = RickmortyDbApi();

  Future _getCharacters() async {
    var resultsFuture = await _RickmortyDbApi.getTopRated();
    setState(() {
      resultsFuture.results?.forEach((character) {
        _listCharacters.add(character);
      });
    });
  }

  @override
  void initState() {
    _getCharacters();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rick And Morty DB")),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: ListView.builder(
              itemCount: _listCharacters.length,
              itemBuilder: (context, index) {
                Results character = _listCharacters[index];
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailCharacterPage(character)));
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
                              image: NetworkImage(
                                  "${character.image}")),
                        ),
                        const SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
// cambio para feature/garcia
