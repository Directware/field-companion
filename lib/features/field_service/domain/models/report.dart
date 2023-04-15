import 'package:field_companion/models/entity.dart';
import 'package:isar/isar.dart';

part './report.g.dart';

@collection
class Report extends Entity {
  Report();

  Report.create(DateTime date) {
    reportDate = DateTime(date.year, date.month, date.day);
    videos = 0;
    returnVisits = 0;
    duration = 0;
    deliveries = 0;
    studies = 0;
    lastUpdated = DateTime.now();
  }

  late int videos;
  late int returnVisits;
  late int deliveries;
  late int duration;
  late int studies;

  @Index(unique: true)
  late DateTime reportDate;

  void update(
      {int? videos,
      int? returnVisits,
      int? duration,
      int? studies,
      int? deliveries}) {
    this.videos = videos ?? this.videos;
    this.returnVisits = returnVisits ?? this.returnVisits;
    this.duration = duration ?? this.duration;
    this.studies = studies ?? this.studies;
    this.deliveries = deliveries ?? this.deliveries;
    lastUpdated = DateTime.now().toUtc();
  }
}
