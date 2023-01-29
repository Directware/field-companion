// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EntityAdapter extends TypeAdapter<Entity> {
  @override
  final int typeId = 0;

  @override
  Entity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Entity()
      ..id = fields[0] as String
      ..creationTime = fields[1] as DateTime
      ..lastUpdated = fields[2] as DateTime
      ..excludeStatistic = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, Entity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.creationTime)
      ..writeByte(2)
      ..write(obj.lastUpdated)
      ..writeByte(3)
      ..write(obj.excludeStatistic);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
