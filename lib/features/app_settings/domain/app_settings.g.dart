// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AppSettingsAdapter extends TypeAdapter<AppSettings> {
  @override
  final int typeId = 2;

  @override
  AppSettings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppSettings()
      ..userId = fields[4] as String
      ..userName = fields[5] as String
      ..userLanguage = fields[6] as String
      ..initialConfigurationDone = fields[7] as bool
      ..monthlyGoal = fields[8] as int
      ..yearlyGoal = fields[9] as int
      ..monthlyReminder = fields[10] as bool
      ..durationStep = fields[11] as int
      ..confirmedFeatures = (fields[12] as List).cast<String>()
      ..id = fields[0] as String
      ..creationTime = fields[1] as DateTime
      ..lastUpdated = fields[2] as DateTime
      ..excludeStatistic = fields[3] as bool;
  }

  @override
  void write(BinaryWriter writer, AppSettings obj) {
    writer
      ..writeByte(13)
      ..writeByte(4)
      ..write(obj.userId)
      ..writeByte(5)
      ..write(obj.userName)
      ..writeByte(6)
      ..write(obj.userLanguage)
      ..writeByte(7)
      ..write(obj.initialConfigurationDone)
      ..writeByte(8)
      ..write(obj.monthlyGoal)
      ..writeByte(9)
      ..write(obj.yearlyGoal)
      ..writeByte(10)
      ..write(obj.monthlyReminder)
      ..writeByte(11)
      ..write(obj.durationStep)
      ..writeByte(12)
      ..write(obj.confirmedFeatures)
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
      other is AppSettingsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
