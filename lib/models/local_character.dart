import 'package:hive/hive.dart';
part 'local_character.g.dart';

@HiveType(typeId: 0)
class LocalCharacter extends HiveObject {
  @HiveField(0)
  String? name;

  @HiveField(1)
  String? image;

  @HiveField(2)
  String? status;

  @HiveField(3)
  String? species;

  @HiveField(4)
  String? gender;

  @HiveField(5)
  String? origin;

  @HiveField(6)
  String? location;

  @HiveField(7)
  num? id;

}
