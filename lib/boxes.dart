import 'package:hive/hive.dart';
import 'models/local_character.dart';

class Boxes{
  static Box<LocalCharacter> getFavoritesCharacters() => Hive.box<LocalCharacter>('favorites_characters');
}