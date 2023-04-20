import 'package:field_companion/features/core/domain/models/entity.dart';
import 'package:field_companion/features/territory_cards/domain/models/assignment.dart';
import 'package:field_companion/features/territory_cards/domain/models/drawing.dart';
import 'package:field_companion/features/territory_cards/domain/models/publisher.dart';
import 'package:field_companion/features/territory_cards/domain/models/territory.dart';
import 'package:field_companion/features/territory_cards/domain/models/visit_ban.dart';
import 'package:isar/isar.dart';

part 'territory_card.g.dart';

@collection
class TerritoryCard extends Entity {
  TerritoryCard()
      : territory = null,
        drawing = null,
        publisher = null,
        assignment = null,
        visitBans = null,
        estimationInMonths = 4;

  Territory? territory;
  Drawing? drawing;
  Publisher? publisher;
  Assignment? assignment;
  VisitBan? visitBans;
  int estimationInMonths;
}
