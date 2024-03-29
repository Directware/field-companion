import 'package:isar/isar.dart';

part 'visit_ban.g.dart';

@embedded
class VisitBan {
  VisitBan();

  late final String id;
  late final String name;
  late final String street;
  late final String streetSuffix;
  late final String city;

  VisitBan.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        street = json['street'] as String,
        streetSuffix = json['streetSuffix'] as String,
        city = json['city'] as String;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'street': street,
        'streetSuffix': streetSuffix,
        'city': city,
      };
}
