import 'package:isar/isar.dart';

part 'report.g.dart';

@collection
class Report {
  Report({
    required this.reportDate,
    this.id = Isar.autoIncrement,
    this.videos = 0,
    this.returnVisits = 0,
    this.duration = 0,
    this.deliveries = 0,
  });

  final Id id;
  final int videos;
  final int returnVisits;
  final int deliveries;
  final int duration;

  @Index(unique: true)
  late DateTime reportDate;

  Report clone({
    int? videos,
    int? returnVisits,
    int? duration,
    int? deliveries,
  }) {
    return Report(
      id: id,
      reportDate: reportDate,
      videos: videos ?? this.videos,
      returnVisits: returnVisits ?? this.returnVisits,
      duration: duration ?? this.duration,
      deliveries: deliveries ?? this.deliveries,
    );
  }

  bool isEmpty() {
    return videos == 0 && returnVisits == 0 && duration == 0 && deliveries == 0;
  }
}
