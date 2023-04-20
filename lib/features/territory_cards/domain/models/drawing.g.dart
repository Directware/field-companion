// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawing.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const DrawingSchema = Schema(
  name: r'Drawing',
  id: -2045012275050410848,
  properties: {
    r'featureCollection': PropertySchema(
      id: 0,
      name: r'featureCollection',
      type: IsarType.objectList,
      target: r'GeoJsonFeature',
    )
  },
  estimateSize: _drawingEstimateSize,
  serialize: _drawingSerialize,
  deserialize: _drawingDeserialize,
  deserializeProp: _drawingDeserializeProp,
);

int _drawingEstimateSize(
  Drawing object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.featureCollection.length * 3;
  {
    final offsets = allOffsets[GeoJsonFeature]!;
    for (var i = 0; i < object.featureCollection.length; i++) {
      final value = object.featureCollection[i];
      bytesCount +=
          GeoJsonFeatureSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _drawingSerialize(
  Drawing object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<GeoJsonFeature>(
    offsets[0],
    allOffsets,
    GeoJsonFeatureSchema.serialize,
    object.featureCollection,
  );
}

Drawing _drawingDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Drawing();
  object.featureCollection = reader.readObjectList<GeoJsonFeature>(
        offsets[0],
        GeoJsonFeatureSchema.deserialize,
        allOffsets,
        GeoJsonFeature(),
      ) ??
      [];
  return object;
}

P _drawingDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<GeoJsonFeature>(
            offset,
            GeoJsonFeatureSchema.deserialize,
            allOffsets,
            GeoJsonFeature(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension DrawingQueryFilter
    on QueryBuilder<Drawing, Drawing, QFilterCondition> {
  QueryBuilder<Drawing, Drawing, QAfterFilterCondition>
      featureCollectionLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureCollection',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Drawing, Drawing, QAfterFilterCondition>
      featureCollectionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureCollection',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Drawing, Drawing, QAfterFilterCondition>
      featureCollectionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureCollection',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Drawing, Drawing, QAfterFilterCondition>
      featureCollectionLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureCollection',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Drawing, Drawing, QAfterFilterCondition>
      featureCollectionLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureCollection',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Drawing, Drawing, QAfterFilterCondition>
      featureCollectionLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'featureCollection',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension DrawingQueryObject
    on QueryBuilder<Drawing, Drawing, QFilterCondition> {
  QueryBuilder<Drawing, Drawing, QAfterFilterCondition>
      featureCollectionElement(FilterQuery<GeoJsonFeature> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'featureCollection');
    });
  }
}
