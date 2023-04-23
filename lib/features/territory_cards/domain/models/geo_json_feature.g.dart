// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_json_feature.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const GeoJsonFeatureSchema = Schema(
  name: r'GeoJsonFeature',
  id: 5731367863464731987,
  properties: {
    r'bbox': PropertySchema(
      id: 0,
      name: r'bbox',
      type: IsarType.doubleList,
    ),
    r'center': PropertySchema(
      id: 1,
      name: r'center',
      type: IsarType.doubleList,
    ),
    r'context': PropertySchema(
      id: 2,
      name: r'context',
      type: IsarType.objectList,
      target: r'GeoJsonContext',
    ),
    r'geometry': PropertySchema(
      id: 3,
      name: r'geometry',
      type: IsarType.object,
      target: r'GeoJsonGeometry',
    ),
    r'id': PropertySchema(
      id: 4,
      name: r'id',
      type: IsarType.string,
    ),
    r'placeName': PropertySchema(
      id: 5,
      name: r'placeName',
      type: IsarType.string,
    ),
    r'placeType': PropertySchema(
      id: 6,
      name: r'placeType',
      type: IsarType.stringList,
    ),
    r'relevance': PropertySchema(
      id: 7,
      name: r'relevance',
      type: IsarType.long,
    ),
    r'text': PropertySchema(
      id: 8,
      name: r'text',
      type: IsarType.string,
    ),
    r'type': PropertySchema(
      id: 9,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _geoJsonFeatureEstimateSize,
  serialize: _geoJsonFeatureSerialize,
  deserialize: _geoJsonFeatureDeserialize,
  deserializeProp: _geoJsonFeatureDeserializeProp,
);

int _geoJsonFeatureEstimateSize(
  GeoJsonFeature object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bbox.length * 8;
  bytesCount += 3 + object.center.length * 8;
  bytesCount += 3 + object.context.length * 3;
  {
    final offsets = allOffsets[GeoJsonContext]!;
    for (var i = 0; i < object.context.length; i++) {
      final value = object.context[i];
      bytesCount +=
          GeoJsonContextSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 +
      GeoJsonGeometrySchema.estimateSize(
          object.geometry, allOffsets[GeoJsonGeometry]!, allOffsets);
  bytesCount += 3 + object.id.length * 3;
  bytesCount += 3 + object.placeName.length * 3;
  bytesCount += 3 + object.placeType.length * 3;
  {
    for (var i = 0; i < object.placeType.length; i++) {
      final value = object.placeType[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.text.length * 3;
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _geoJsonFeatureSerialize(
  GeoJsonFeature object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDoubleList(offsets[0], object.bbox);
  writer.writeDoubleList(offsets[1], object.center);
  writer.writeObjectList<GeoJsonContext>(
    offsets[2],
    allOffsets,
    GeoJsonContextSchema.serialize,
    object.context,
  );
  writer.writeObject<GeoJsonGeometry>(
    offsets[3],
    allOffsets,
    GeoJsonGeometrySchema.serialize,
    object.geometry,
  );
  writer.writeString(offsets[4], object.id);
  writer.writeString(offsets[5], object.placeName);
  writer.writeStringList(offsets[6], object.placeType);
  writer.writeLong(offsets[7], object.relevance);
  writer.writeString(offsets[8], object.text);
  writer.writeString(offsets[9], object.type);
}

GeoJsonFeature _geoJsonFeatureDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GeoJsonFeature();
  object.bbox = reader.readDoubleList(offsets[0]) ?? [];
  object.center = reader.readDoubleList(offsets[1]) ?? [];
  object.context = reader.readObjectList<GeoJsonContext>(
        offsets[2],
        GeoJsonContextSchema.deserialize,
        allOffsets,
        GeoJsonContext(),
      ) ??
      [];
  object.geometry = reader.readObjectOrNull<GeoJsonGeometry>(
        offsets[3],
        GeoJsonGeometrySchema.deserialize,
        allOffsets,
      ) ??
      GeoJsonGeometry();
  object.id = reader.readString(offsets[4]);
  object.placeName = reader.readString(offsets[5]);
  object.placeType = reader.readStringList(offsets[6]) ?? [];
  object.relevance = reader.readLong(offsets[7]);
  object.text = reader.readString(offsets[8]);
  object.type = reader.readString(offsets[9]);
  return object;
}

P _geoJsonFeatureDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 1:
      return (reader.readDoubleList(offset) ?? []) as P;
    case 2:
      return (reader.readObjectList<GeoJsonContext>(
            offset,
            GeoJsonContextSchema.deserialize,
            allOffsets,
            GeoJsonContext(),
          ) ??
          []) as P;
    case 3:
      return (reader.readObjectOrNull<GeoJsonGeometry>(
            offset,
            GeoJsonGeometrySchema.deserialize,
            allOffsets,
          ) ??
          GeoJsonGeometry()) as P;
    case 4:
      return (reader.readString(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readStringList(offset) ?? []) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension GeoJsonFeatureQueryFilter
    on QueryBuilder<GeoJsonFeature, GeoJsonFeature, QFilterCondition> {
  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      bboxElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bbox',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      bboxElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bbox',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      bboxElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bbox',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      bboxElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bbox',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      bboxLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bbox',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      bboxIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bbox',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      bboxIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bbox',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      bboxLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bbox',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      bboxLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bbox',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      bboxLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'bbox',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      centerElementEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'center',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      centerElementGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'center',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      centerElementLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'center',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      centerElementBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'center',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      centerLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'center',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      centerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'center',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      centerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'center',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      centerLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'center',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      centerLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'center',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      centerLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'center',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      contextLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'context',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      contextIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'context',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      contextIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'context',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      contextLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'context',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      contextLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'context',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      contextLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'context',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      idGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      idLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      idContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'id',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'placeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'placeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'placeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'placeName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'placeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'placeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'placeName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'placeName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'placeName',
        value: '',
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'placeName',
        value: '',
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeTypeElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'placeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeTypeElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'placeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeTypeElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'placeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeTypeElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'placeType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeTypeElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'placeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeTypeElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'placeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeTypeElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'placeType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeTypeElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'placeType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeTypeElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'placeType',
        value: '',
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeTypeElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'placeType',
        value: '',
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeTypeLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'placeType',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'placeType',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'placeType',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeTypeLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'placeType',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeTypeLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'placeType',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      placeTypeLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'placeType',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      relevanceEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'relevance',
        value: value,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      relevanceGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'relevance',
        value: value,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      relevanceLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'relevance',
        value: value,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      relevanceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'relevance',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      textEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      textGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      textLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      textBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'text',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      textStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      textEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      textContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'text',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      textMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'text',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      textIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      textIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'text',
        value: '',
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      typeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      typeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension GeoJsonFeatureQueryObject
    on QueryBuilder<GeoJsonFeature, GeoJsonFeature, QFilterCondition> {
  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition>
      contextElement(FilterQuery<GeoJsonContext> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'context');
    });
  }

  QueryBuilder<GeoJsonFeature, GeoJsonFeature, QAfterFilterCondition> geometry(
      FilterQuery<GeoJsonGeometry> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'geometry');
    });
  }
}
