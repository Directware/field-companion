// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_ban.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VisitBanAdapter extends TypeAdapter<VisitBan> {
  @override
  final int typeId = 8;

  @override
  VisitBan read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VisitBan(
      name: fields[4] as String,
      street: fields[5] as String,
      streetSuffix: fields[6] as String,
      territoryId: fields[7] as String,
      tags: (fields[8] as List).cast<String>(),
      city: fields[9] as String?,
      floor: fields[10] as int?,
      lastVisit: fields[11] as DateTime?,
      comment: fields[12] as String?,
      gpsPosition: fields[13] as Position?,
    )
      ..id = fields[0] as String
      ..creationTime = fields[1] as DateTime
      ..lastUpdated = fields[2] as DateTime
      ..excludeStatistic = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, VisitBan obj) {
    writer
      ..writeByte(14)
      ..writeByte(4)
      ..write(obj.name)
      ..writeByte(5)
      ..write(obj.street)
      ..writeByte(6)
      ..write(obj.streetSuffix)
      ..writeByte(7)
      ..write(obj.territoryId)
      ..writeByte(8)
      ..write(obj.tags)
      ..writeByte(9)
      ..write(obj.city)
      ..writeByte(10)
      ..write(obj.floor)
      ..writeByte(11)
      ..write(obj.lastVisit)
      ..writeByte(12)
      ..write(obj.comment)
      ..writeByte(13)
      ..write(obj.gpsPosition)
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
      other is VisitBanAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
