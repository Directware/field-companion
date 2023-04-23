import 'package:isar/isar.dart';

part 'studies.g.dart';

@collection
class Studies {
  Studies({
    required this.month,
    this.id = Isar.autoIncrement,
    this.count = 0,
  });

  final Id id;
  final int count;

  @Index(unique: true)
  late DateTime month;

  Studies clone({
    required int count,
  }) {
    return Studies(
      id: id,
      month: month,
      count: count,
    );
  }

  bool isEmpty() {
    return count == 0;
  }
}
