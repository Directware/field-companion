import 'package:isar/isar.dart';

part 'territory.g.dart';

@embedded
class Territory {
  String name = "";
  String key = "";
  int populationCount = 0;
  List<String> tags = [];
  String territoryDrawingId = "";
  List<String> boundaryNames = [];
  bool deactivated = false;
  String comment = "";
}
