import 'dart:convert';

import 'package:field_companion/features/territories/domain/models/visit_ban.dart';
import 'package:isar/isar.dart';

part 'territory.g.dart';

@Collection(accessor: 'territories')
class Territory {
  Territory({
    required this.id,
    required this.name,
    required this.key,
    required this.publisherId,
    required this.populationCount,
    this.geoJson = const {},
    required this.startTime,
    required this.estimationInMonths,
    required this.visitBans,
    required this.boundaryNames,
    required this.type,
    required this.version,
  });

  Id get isarId => fastHash(id);

  @Index(unique: true)
  late final String id;

  late final String name;
  late final String key;
  late final String publisherId;
  late final int populationCount;
  late final DateTime startTime;
  late final int estimationInMonths;
  late final List<VisitBan> visitBans;
  late final List<String> boundaryNames;
  late final String type;
  late final int version;

  @ignore
  Map<String, dynamic> geoJson;

  String get isarGeoJson => jsonEncode(geoJson);
  set isarGeoJson(String value) =>
      geoJson = jsonDecode(value) as Map<String, dynamic>;

  Territory clone({
    List<VisitBan>? visitBans,
    int? populationCount,
  }) {
    return Territory(
      id: id,
      name: name,
      key: key,
      publisherId: publisherId,
      populationCount: populationCount ?? this.populationCount,
      geoJson: geoJson,
      startTime: startTime,
      estimationInMonths: estimationInMonths,
      visitBans: visitBans ?? this.visitBans,
      boundaryNames: boundaryNames,
      type: type,
      version: version,
    );
  }

  Territory.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        name = json['name'] as String,
        key = json['key'] as String,
        publisherId = json['publisherId'] as String,
        populationCount = json['populationCount'] as int,
        geoJson = json['geoJson'] as Map<String, dynamic>,
        startTime = DateTime.parse(json['startTime'] as String),
        estimationInMonths = json['estimationInMonths'] as int,
        visitBans = (json['visitBans'] as List<dynamic>)
            .map(
              (visitBan) => VisitBan.fromJson(visitBan as Map<String, dynamic>),
            )
            .toList(),
        type = json['type'] as String,
        boundaryNames = (json['boundaryNames'] as List<dynamic>)
            .map((boundaryName) => boundaryName as String)
            .toList(),
        version = json['version'] as int;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'key': key,
        'publisherId': publisherId,
        'populationCount': populationCount,
        'geoJson': geoJson,
        'startTime': startTime.toIso8601String(),
        'estimationInMonths': estimationInMonths,
        'visitBans': visitBans.map((visitBan) => visitBan.toJson()).toList(),
        'boundaryNames': boundaryNames,
        'type': type,
        'version': version,
      };
}

int fastHash(String string) {
  var hash = 0xcbf29ce484222325;

  var i = 0;
  while (i < string.length) {
    final codeUnit = string.codeUnitAt(i++);
    hash ^= codeUnit >> 8;
    hash *= 0x100000001b3;
    hash ^= codeUnit & 0xFF;
    hash *= 0x100000001b3;
  }

  return hash;
}
