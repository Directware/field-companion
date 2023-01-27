// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'territory_card.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TerritoryCardAdapter extends TypeAdapter<TerritoryCard> {
  @override
  final int typeId = 3;

  @override
  TerritoryCard read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TerritoryCard()
      ..territory = fields[4] as Territory?
      ..drawing = fields[5] as Drawing?
      ..publisher = fields[6] as Publisher?
      ..assignment = fields[7] as Assignment?
      ..visitBans = fields[8] as VisitBan?
      ..estimationInMonths = fields[9] as int
      ..id = fields[0] as String
      ..creationTime = fields[1] as DateTime
      ..lastUpdated = fields[2] as DateTime
      ..excludeStatistic = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, TerritoryCard obj) {
    writer
      ..writeByte(10)
      ..writeByte(4)
      ..write(obj.territory)
      ..writeByte(5)
      ..write(obj.drawing)
      ..writeByte(6)
      ..write(obj.publisher)
      ..writeByte(7)
      ..write(obj.assignment)
      ..writeByte(8)
      ..write(obj.visitBans)
      ..writeByte(9)
      ..write(obj.estimationInMonths)
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
      other is TerritoryCardAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
