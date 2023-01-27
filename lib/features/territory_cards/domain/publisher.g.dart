// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publisher.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PublisherAdapter extends TypeAdapter<Publisher> {
  @override
  final int typeId = 6;

  @override
  Publisher read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Publisher(
      firstName: fields[4] as String,
      lastName: fields[5] as String,
    )
      ..id = fields[0] as String
      ..creationTime = fields[1] as DateTime
      ..lastUpdated = fields[2] as DateTime
      ..excludeStatistic = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, Publisher obj) {
    writer
      ..writeByte(6)
      ..writeByte(4)
      ..write(obj.firstName)
      ..writeByte(5)
      ..write(obj.lastName)
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
      other is PublisherAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
