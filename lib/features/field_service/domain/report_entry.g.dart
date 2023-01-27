// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_entry.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReportEntryAdapter extends TypeAdapter<ReportEntry> {
  @override
  final int typeId = 1;

  @override
  ReportEntry read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReportEntry()
      ..videos = fields[4] as int
      ..returnVisits = fields[5] as int
      ..duration = fields[6] as int
      ..deliveries = fields[7] as int
      ..studies = fields[8] as int
      ..reportDate = fields[9] as DateTime
      ..id = fields[0] as String
      ..creationTime = fields[1] as DateTime
      ..lastUpdated = fields[2] as DateTime
      ..excludeStatistic = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, ReportEntry obj) {
    writer
      ..writeByte(10)
      ..writeByte(4)
      ..write(obj.videos)
      ..writeByte(5)
      ..write(obj.returnVisits)
      ..writeByte(6)
      ..write(obj.duration)
      ..writeByte(7)
      ..write(obj.deliveries)
      ..writeByte(8)
      ..write(obj.studies)
      ..writeByte(9)
      ..write(obj.reportDate)
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
      other is ReportEntryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
