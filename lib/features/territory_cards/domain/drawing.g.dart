// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawing.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DrawingAdapter extends TypeAdapter<Drawing> {
  @override
  final int typeId = 5;

  @override
  Drawing read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Drawing(
      featureCollection: (fields[4] as List).cast<GeoJsonFeature>(),
    )
      ..id = fields[0] as String
      ..creationTime = fields[1] as DateTime
      ..lastUpdated = fields[2] as DateTime
      ..excludeStatistic = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, Drawing obj) {
    writer
      ..writeByte(5)
      ..writeByte(4)
      ..write(obj.featureCollection)
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
      other is DrawingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
