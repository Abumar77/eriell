// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ObjectsHiveAdapter extends TypeAdapter<ObjectsHive> {
  @override
  final int typeId = 2;

  @override
  ObjectsHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ObjectsHive(
      data: (fields[7] as Map?)?.cast<String, double>(),
    );
  }

  @override
  void write(BinaryWriter writer, ObjectsHive obj) {
    writer
      ..writeByte(1)
      ..writeByte(7)
      ..write(obj.data);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ObjectsHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
