import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:practica_webservices/models/local_character.dart';
import 'package:practica_webservices/pages/home_page.dart';

import 'pages/list_page.dart';

Future<void> main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(LocalCharacterAdapter());

  await Hive.openBox<LocalCharacter>('favorites_characters');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
