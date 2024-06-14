import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/domain/models/visit_ban.dart';

class TerritoryCardV1 {
  bool isDeprecatedFormat(Map<String, dynamic> object) {
    return object["territory"] != null &&
        object["publisher"] != null &&
        object["drawing"] != null &&
        object["assignment"] != null &&
        object["visitBans"] != null;
  }

  Territory toEntity(Map<String, dynamic> object) {
    final territory = object["territory"] as Map<String, dynamic>;
    final publisher = object["publisher"] as Map<String, dynamic>;
    final drawing = object["drawing"] as Map<String, dynamic>;
    final assignment = object["assignment"] as Map<String, dynamic>;
    final visitBans = object["visitBans"] as List<dynamic>;

    return Territory(
      version: 0,
      id: territory["id"] as String,
      type: object["type"] as String,
      key: territory["key"] as String,
      name: territory["name"] as String,
      publisherId: publisher["id"] as String,
      populationCount: territory["populationCount"] as int,
      estimationInMonths: object["estimationInMonths"] as int,
      startTime: DateTime.parse(assignment["startTime"] as String),
      geoJson: drawing["featureCollection"] as Map<String, dynamic>,
      visitBans: visitBans
          .map((vb) => VisitBan.fromJson(vb as Map<String, dynamic>))
          .toList(),
      boundaryNames:
          (territory["boundaryNames"] as List<dynamic>).cast<String>(),
    );
  }
}
