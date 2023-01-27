import 'package:field_companion/models/entity.dart';
import 'package:hive/hive.dart';

part 'report_entry.g.dart';

@HiveType(typeId: 1)
class ReportEntry extends Entity {
  ReportEntry()
      : videos = 0,
        returnVisits = 0,
        duration = 0,
        deliveries = 0,
        studies = 0,
        reportDate = DateTime.now();

  @HiveField(4)
  int videos;

  @HiveField(5)
  int returnVisits;

  @HiveField(6)
  int duration;

  @HiveField(7)
  int deliveries;

  @HiveField(8)
  int studies;

  @HiveField(9)
  DateTime reportDate;
}
