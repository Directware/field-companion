import 'dart:convert';
import 'dart:io';

import 'package:archive/archive.dart';
import 'package:field_companion/features/territories/domain/models/territory.dart';
import 'package:field_companion/features/territories/domain/models/visit_ban.dart';
import 'package:nanoid/nanoid.dart';
import "package:path/path.dart";

import 'models/territory_card_v1.dart';
import 'models/visit_ban_v1.dart';

void main() {
  final files = getInputFiles();

  for (final file in files) {
    convert(file);
  }
}

List<String> getInputFiles() {
  final path = join(dirname(Platform.script.toFilePath()), 'input');
  final directory = Directory(path);
  final files = directory.listSync().whereType<File>().map((file) => file.path).where((file) => basename(file) != ".gitkeep").toList();
  return files;
}

void convert(String path) {
  // ignore: avoid_print
  print("convert: $path");
  final data = extractData(path);
  final territoryV1 = parseTerritoryV1(data);
  final territoryV2 = toTerritoryV2(territoryV1);
  final zippedData = gzipData(territoryV2);
  final outputPath = getOutputPath(path);
  writeConvertedFile(outputPath, zippedData);
  // ignore: avoid_print
  print("-> converted: $path");
}

String extractData(String path) {
  final bytes = File(path).readAsBytesSync();
  final archive = GZipDecoder().decodeBytes(bytes, verify: true);
  return utf8.decode(archive);
}

TerritoryCardV1 parseTerritoryV1(String data) {
  final object = jsonDecode(data) as Map<String, dynamic>;
  return TerritoryCardV1.fromJson(object);
}

Territory toTerritoryV2(TerritoryCardV1 territoryV1) {
  return Territory(
    id: territoryV1.id ?? nanoid(),
    name: territoryV1.territory.name,
    key: territoryV1.territory.key,
    publisherId: territoryV1.publisher.id ?? nanoid(),
    populationCount: territoryV1.territory.populationCount,
    geoJson: territoryV1.drawing.featureCollection,
    startTime: territoryV1.assignment.startTime,
    estimationInMonths: territoryV1.estimationInMonths,
    visitBans: territoryV1.visitBans.map((visitBan) => toVisitBanV2(visitBan)).toList(),
    boundaryNames: territoryV1.territory.boundaryNames,
    type: "com.directware.fieldcompanion.territory",
    version: 1,
  );
}

VisitBan toVisitBanV2(VisitBanV1 visitBanV1) {
  return VisitBan()
    ..id = visitBanV1.id ?? nanoid()
    ..name = visitBanV1.name
    ..street = visitBanV1.street
    ..streetSuffix = visitBanV1.streetSuffix
    ..city = visitBanV1.city ?? "";
}

List<int>? gzipData(Territory territoryV2) {
  final object = territoryV2.toJson();
  final json = jsonEncode(object);
  final bytes = utf8.encode(json);
  return GZipEncoder().encode(bytes);
}

String getOutputPath(String inputPath) {
  return join(
    dirname(Platform.script.toFilePath()),
    'output',
    basename(inputPath),
  );
}

void writeConvertedFile(String path, List<int>? bytes) {
  if (bytes == null) {
    return;
  }

  final file = File(path);
  file.createSync(recursive: true);
  file.writeAsBytesSync(bytes);
}
