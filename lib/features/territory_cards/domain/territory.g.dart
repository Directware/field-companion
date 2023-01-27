// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'territory.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TerritoryAdapter extends TypeAdapter<Territory> {
  @override
  final int typeId = 4;

  @override
  Territory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Territory()
      ..name = fields[4] as String
      ..key = fields[5] as String
      ..populationCount = fields[6] as int
      ..tags = (fields[7] as List).cast<String>()
      ..territoryDrawingId = fields[8] as String
      ..deactivated = fields[9] as bool
      ..comment = fields[10] as String
      ..id = fields[0] as String
      ..creationTime = fields[1] as DateTime
      ..lastUpdated = fields[2] as DateTime
      ..excludeStatistic = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, Territory obj) {
    writer
      ..writeByte(11)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.key)
      ..writeByte(6)
      ..write(obj.populationCount)
      ..writeByte(7)
      ..write(obj.tags)
      ..writeByte(8)
      ..write(obj.territoryDrawingId)
      ..writeByte(9)
      ..write(obj.deactivated)
      ..writeByte(10)
      ..write(obj.comment)
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
      other is TerritoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
