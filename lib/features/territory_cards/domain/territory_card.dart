import 'package:field_companion/features/territory_cards/domain/assignment.dart';
import 'package:field_companion/features/territory_cards/domain/drawing.dart';
import 'package:field_companion/features/territory_cards/domain/publisher.dart';
import 'package:field_companion/features/territory_cards/domain/territory.dart';
import 'package:field_companion/features/territory_cards/domain/visit_ban.dart';
import 'package:field_companion/models/entity.dart';
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
