// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'assignment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AssignmentAdapter extends TypeAdapter<Assignment> {
  @override
  final int typeId = 7;

  @override
  Assignment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Assignment(
      publisher: fields[4] as Publisher,
      endTime: fields[6] as DateTime?,
    )
      ..startTime = fields[5] as DateTime
      ..id = fields[0] as String
      ..creationTime = fields[1] as DateTime
      ..lastUpdated = fields[2] as DateTime
      ..excludeStatistic = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, Assignment obj) {
    writer
      ..writeByte(7)
      ..writeByte(4)
      ..write(obj.publisher)
      ..writeByte(5)
      ..write(obj.startTime)
      ..writeByte(6)
      ..write(obj.endTime)
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
      other is AssignmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
