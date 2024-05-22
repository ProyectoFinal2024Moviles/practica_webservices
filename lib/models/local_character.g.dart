// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_character.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalCharacterAdapter extends TypeAdapter<LocalCharacter> {
  @override
  final int typeId = 0;

  @override
  LocalCharacter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalCharacter()
      ..name = fields[0] as String?
      ..image = fields[1] as String?
      ..status = fields[2] as String?
      ..species = fields[3] as String?
      ..gender = fields[4] as String?
      ..origin = fields[5] as String?
      ..location = fields[6] as String?
      ..id = fields[7] as num?;
  }

  @override
  void write(BinaryWriter writer, LocalCharacter obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.status)
      ..writeByte(3)
      ..write(obj.species)
      ..writeByte(4)
      ..write(obj.gender)
      ..writeByte(5)
      ..write(obj.origin)
      ..writeByte(6)
      ..write(obj.location)
      ..writeByte(7)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalCharacterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
