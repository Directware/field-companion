import 'package:field_companion/features/territory_cards/domain/publisher.dart';
import 'package:isar/isar.dart';

part 'assignment.g.dart';

@embedded
class Assignment {
  late Publisher publisher;
  DateTime startTime = DateTime.now();
  DateTime? endTime;
}
