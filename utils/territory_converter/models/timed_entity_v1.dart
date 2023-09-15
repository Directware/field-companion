import 'database_entity_v1.dart';

class TimedEntityV1 extends DatabaseEntityV1 {
  TimedEntityV1({
    super.id,
    super.prefix,
    super.congregationId,
    this.creationTime,
    this.lastUpdated,
  });

  late final DateTime? creationTime;
  late final DateTime? lastUpdated;
}
