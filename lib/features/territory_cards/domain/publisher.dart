import 'package:field_companion/models/entity.dart';
import 'package:hive/hive.dart';

part 'publisher.g.dart';

@HiveType(typeId: 6)
class Publisher extends Entity {
  Publisher({
    required this.firstName,
    required this.lastName,
  });

  @HiveField(4)
  String firstName;

  @HiveField(5)
  String lastName;
}
