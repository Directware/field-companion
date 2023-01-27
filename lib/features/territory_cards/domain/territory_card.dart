import 'package:field_companion/models/entity.dart';
import 'package:field_companion/features/territory_cards/domain/territory.dart';
import 'package:field_companion/features/territory_cards/domain/drawing.dart';
import 'package:field_companion/features/territory_cards/domain/publisher.dart';
import 'package:field_companion/features/territory_cards/domain/assignment.dart';
import 'package:field_companion/features/territory_cards/domain/visit_ban.dart';

import 'package:hive/hive.dart';

part 'territory_card.g.dart';

@HiveType(typeId: 3)
class TerritoryCard extends Entity {
  TerritoryCard()
      : territory = null,
        drawing = null,
        publisher = null,
        assignment = null,
        visitBans = null,
        estimationInMonths = 4;

  @HiveField(4)
  Territory? territory;

  @HiveField(5)
  Drawing? drawing;

  @HiveField(6)
  Publisher? publisher;

  @HiveField(7)
  Assignment? assignment;

  @HiveField(8)
  VisitBan? visitBans;

  @HiveField(9)
  int estimationInMonths;
}
