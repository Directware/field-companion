import 'package:field_companion/models/entity.dart';
import 'package:hive/hive.dart';

part 'app_settings.g.dart';

@HiveType(typeId: 2)
class AppSettings extends Entity {
  AppSettings()
      : userId = "",
        userName = "",
        userLanguage = "",
        initialConfigurationDone = false,
        monthlyGoal = 0,
        yearlyGoal = 0,
        monthlyReminder = false,
        durationStep = 15,
        confirmedFeatures = [];

  @HiveField(4)
  String userId;

  @HiveField(5)
  String userName;

  @HiveField(6)
  String userLanguage;

  @HiveField(7)
  bool initialConfigurationDone;

  @HiveField(8)
  int monthlyGoal;

  @HiveField(9)
  int yearlyGoal;

  @HiveField(10)
  bool monthlyReminder;

  @HiveField(11)
  int durationStep;

  @HiveField(12)
  List<String> confirmedFeatures;
}
