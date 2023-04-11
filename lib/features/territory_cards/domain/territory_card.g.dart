// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'territory_card.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetTerritoryCardCollection on Isar {
  IsarCollection<TerritoryCard> get territoryCards => this.collection();
}

const TerritoryCardSchema = CollectionSchema(
  name: r'TerritoryCard',
  id: 4859515024364260245,
  properties: {
    r'assignment': PropertySchema(
      id: 0,
      name: r'assignment',
      type: IsarType.object,
      target: r'Assignment',
    ),
    r'creationTime': PropertySchema(
      id: 1,
      name: r'creationTime',
      type: IsarType.dateTime,
    ),
    r'drawing': PropertySchema(
      id: 2,
      name: r'drawing',
      type: IsarType.object,
      target: r'Drawing',
    ),
    r'estimationInMonths': PropertySchema(
      id: 3,
      name: r'estimationInMonths',
      type: IsarType.long,
    ),
    r'excludeStatistic': PropertySchema(
      id: 4,
      name: r'excludeStatistic',
      type: IsarType.bool,
    ),
    r'id': PropertySchema(
      id: 5,
      name: r'id',
      type: IsarType.string,
    ),
    r'lastUpdated': PropertySchema(
      id: 6,
      name: r'lastUpdated',
      type: IsarType.dateTime,
    ),
    r'publisher': PropertySchema(
      id: 7,
      name: r'publisher',
      type: IsarType.object,
      target: r'Publisher',
    ),
    r'territory': PropertySchema(
      id: 8,
      name: r'territory',
      type: IsarType.object,
      target: r'Territory',
    ),
    r'visitBans': PropertySchema(
      id: 9,
      name: r'visitBans',
      type: IsarType.object,
      target: r'VisitBan',
    )
  },
  estimateSize: _territoryCardEstimateSize,
  serialize: _territoryCardSerialize,
  deserialize: _territoryCardDeserialize,
  deserializeProp: _territoryCardDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'id': IndexSchema(
      id: -3268401673993471357,
      name: r'id',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'id',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {
    r'Territory': TerritorySchema,
    r'Drawing': DrawingSchema,
    r'GeoJsonFeature': GeoJsonFeatureSchema,
    r'GeoJsonGeometry': GeoJsonGeometrySchema,
    r'GeoJsonContext': GeoJsonContextSchema,
    r'Publisher': PublisherSchema,
    r'Assignment': AssignmentSchema,
    r'VisitBan': VisitBanSchema,
    r'Position': PositionSchema
  },
  getId: _territoryCardGetId,
  getLinks: _territoryCardGetLinks,
  attach: _territoryCardAttach,
  version: '3.0.5',
);

int _territoryCardEstimateSize(
  TerritoryCard object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.assignment;
    if (value != null) {
      bytesCount += 3 +
          AssignmentSchema.estimateSize(
              value, allOffsets[Assignment]!, allOffsets);
    }
  }
  {
    final value = object.drawing;
    if (value != null) {
      bytesCount += 3 +
          DrawingSchema.estimateSize(value, allOffsets[Drawing]!, allOffsets);
    }
  }
  bytesCount += 3 + object.id.length * 3;
  {
    final value = object.publisher;
    if (value != null) {
      bytesCount += 3 +
          PublisherSchema.estimateSize(
              value, allOffsets[Publisher]!, allOffsets);
    }
  }
  {
    final value = object.territory;
    if (value != null) {
      bytesCount += 3 +
          TerritorySchema.estimateSize(
              value, allOffsets[Territory]!, allOffsets);
    }
  }
  {
    final value = object.visitBans;
    if (value != null) {
      bytesCount += 3 +
          VisitBanSchema.estimateSize(value, allOffsets[VisitBan]!, allOffsets);
    }
  }
  return bytesCount;
}

void _territoryCardSerialize(
  TerritoryCard object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObject<Assignment>(
    offsets[0],
    allOffsets,
    AssignmentSchema.serialize,
    object.assignment,
  );
  writer.writeDateTime(offsets[1], object.creationTime);
  writer.writeObject<Drawing>(
    offsets[2],
    allOffsets,
    DrawingSchema.serialize,
    object.drawing,
  );
  writer.writeLong(offsets[3], object.estimationInMonths);
  writer.writeBool(offsets[4], object.excludeStatistic);
  writer.writeString(offsets[5], object.id);
  writer.writeDateTime(offsets[6], object.lastUpdated);
  writer.writeObject<Publisher>(
    offsets[7],
    allOffsets,
    PublisherSchema.serialize,
    object.publisher,
  );
  writer.writeObject<Territory>(
    offsets[8],
    allOffsets,
    TerritorySchema.serialize,
    object.territory,
  );
  writer.writeObject<VisitBan>(
    offsets[9],
    allOffsets,
    VisitBanSchema.serialize,
    object.visitBans,
  );
}

TerritoryCard _territoryCardDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TerritoryCard();
  object.assignment = reader.readObjectOrNull<Assignment>(
    offsets[0],
    AssignmentSchema.deserialize,
    allOffsets,
  );
  object.creationTime = reader.readDateTime(offsets[1]);
  object.drawing = reader.readObjectOrNull<Drawing>(
    offsets[2],
    DrawingSchema.deserialize,
    allOffsets,
  );
  object.estimationInMonths = reader.readLong(offsets[3]);
  object.excludeStatistic = reader.readBool(offsets[4]);
  object.id = reader.readString(offsets[5]);
  object.lastUpdated = reader.readDateTime(offsets[6]);
  object.publisher = reader.readObjectOrNull<Publisher>(
    offsets[7],
    PublisherSchema.deserialize,
    allOffsets,
  );
  object.territory = reader.readObjectOrNull<Territory>(
    offsets[8],
    TerritorySchema.deserialize,
    allOffsets,
  );
  object.visitBans = reader.readObjectOrNull<VisitBan>(
    offsets[9],
    VisitBanSchema.deserialize,
    allOffsets,
  );
  return object;
}

P _territoryCardDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectOrNull<Assignment>(
        offset,
        AssignmentSchema.deserialize,
        allOffsets,
      )) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readObjectOrNull<Drawing>(
        offset,
        DrawingSchema.deserialize,
        allOffsets,
      )) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readDateTime(offset)) as P;
    case 7:
      return (reader.readObjectOrNull<Publisher>(
        offset,
        PublisherSchema.deserialize,
        allOffsets,
      )) as P;
    case 8:
      return (reader.readObjectOrNull<Territory>(
        offset,
        TerritorySchema.deserialize,
        allOffsets,
      )) as P;
    case 9:
      return (reader.readObjectOrNull<VisitBan>(
        offset,
        VisitBanSchema.deserialize,
        allOffsets,
      )) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _territoryCardGetId(TerritoryCard object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _territoryCardGetLinks(TerritoryCard object) {
  return [];
}

void _territoryCardAttach(
    IsarCollection<dynamic> col, Id id, TerritoryCard object) {}

extension TerritoryCardQueryWhereSort
    on QueryBuilder<TerritoryCard, TerritoryCard, QWhere> {
  QueryBuilder<TerritoryCard, TerritoryCard, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TerritoryCardQueryWhere
    on QueryBuilder<TerritoryCard, TerritoryCard, QWhereClause> {
  QueryBuilder<TerritoryCard, TerritoryCard, QAfterWhereClause> isarIdEqualTo(
      Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterWhereClause>
      isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterWhereClause>
      isarIdGreaterThan(Id isarId, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterWhereClause> isarIdLessThan(
      Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterWhereClause> idEqualTo(
      String id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'id',
        value: [id],
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterWhereClause> idNotEqualTo(
      String id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [],
              upper: [id],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [id],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [id],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'id',
              lower: [],
              upper: [id],
              includeUpper: false,
            ));
      }
    });
  }
}

extension TerritoryCardQueryFilter
    on QueryBuilder<TerritoryCard, TerritoryCard, QFilterCondition> {
  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      assignmentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'assignment',
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      assignmentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'assignment',
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      creationTimeEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'creationTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      creationTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'creationTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      creationTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'creationTime',
        value: value,
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      creationTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'creationTime',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      drawingIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'drawing',
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      drawingIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'drawing',
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      estimationInMonthsEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estimationInMonths',
        value: value,
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      estimationInMonthsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estimationInMonths',
        value: value,
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      estimationInMonthsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estimationInMonths',
        value: value,
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      estimationInMonthsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estimationInMonths',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      excludeStatisticEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'excludeStatistic',
        value: value,
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition> idEqualTo(
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

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
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

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
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

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition> idEndsWith(
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

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'id',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition> idMatches(
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

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'id',
        value: '',
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      lastUpdatedEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      lastUpdatedGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      lastUpdatedLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastUpdated',
        value: value,
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      lastUpdatedBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastUpdated',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      publisherIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'publisher',
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      publisherIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'publisher',
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      territoryIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'territory',
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      territoryIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'territory',
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      visitBansIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'visitBans',
      ));
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition>
      visitBansIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'visitBans',
      ));
    });
  }
}

extension TerritoryCardQueryObject
    on QueryBuilder<TerritoryCard, TerritoryCard, QFilterCondition> {
  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition> assignment(
      FilterQuery<Assignment> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'assignment');
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition> drawing(
      FilterQuery<Drawing> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'drawing');
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition> publisher(
      FilterQuery<Publisher> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'publisher');
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition> territory(
      FilterQuery<Territory> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'territory');
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterFilterCondition> visitBans(
      FilterQuery<VisitBan> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'visitBans');
    });
  }
}

extension TerritoryCardQueryLinks
    on QueryBuilder<TerritoryCard, TerritoryCard, QFilterCondition> {}

extension TerritoryCardQuerySortBy
    on QueryBuilder<TerritoryCard, TerritoryCard, QSortBy> {
  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy>
      sortByCreationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationTime', Sort.asc);
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy>
      sortByCreationTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationTime', Sort.desc);
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy>
      sortByEstimationInMonths() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimationInMonths', Sort.asc);
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy>
      sortByEstimationInMonthsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimationInMonths', Sort.desc);
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy>
      sortByExcludeStatistic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'excludeStatistic', Sort.asc);
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy>
      sortByExcludeStatisticDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'excludeStatistic', Sort.desc);
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy> sortByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy>
      sortByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }
}

extension TerritoryCardQuerySortThenBy
    on QueryBuilder<TerritoryCard, TerritoryCard, QSortThenBy> {
  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy>
      thenByCreationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationTime', Sort.asc);
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy>
      thenByCreationTimeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'creationTime', Sort.desc);
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy>
      thenByEstimationInMonths() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimationInMonths', Sort.asc);
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy>
      thenByEstimationInMonthsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estimationInMonths', Sort.desc);
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy>
      thenByExcludeStatistic() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'excludeStatistic', Sort.asc);
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy>
      thenByExcludeStatisticDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'excludeStatistic', Sort.desc);
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy> thenByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.asc);
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QAfterSortBy>
      thenByLastUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastUpdated', Sort.desc);
    });
  }
}

extension TerritoryCardQueryWhereDistinct
    on QueryBuilder<TerritoryCard, TerritoryCard, QDistinct> {
  QueryBuilder<TerritoryCard, TerritoryCard, QDistinct>
      distinctByCreationTime() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'creationTime');
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QDistinct>
      distinctByEstimationInMonths() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estimationInMonths');
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QDistinct>
      distinctByExcludeStatistic() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'excludeStatistic');
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QDistinct> distinctById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<TerritoryCard, TerritoryCard, QDistinct>
      distinctByLastUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastUpdated');
    });
  }
}

extension TerritoryCardQueryProperty
    on QueryBuilder<TerritoryCard, TerritoryCard, QQueryProperty> {
  QueryBuilder<TerritoryCard, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<TerritoryCard, Assignment?, QQueryOperations>
      assignmentProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'assignment');
    });
  }

  QueryBuilder<TerritoryCard, DateTime, QQueryOperations>
      creationTimeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'creationTime');
    });
  }

  QueryBuilder<TerritoryCard, Drawing?, QQueryOperations> drawingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'drawing');
    });
  }

  QueryBuilder<TerritoryCard, int, QQueryOperations>
      estimationInMonthsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estimationInMonths');
    });
  }

  QueryBuilder<TerritoryCard, bool, QQueryOperations>
      excludeStatisticProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'excludeStatistic');
    });
  }

  QueryBuilder<TerritoryCard, String, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TerritoryCard, DateTime, QQueryOperations>
      lastUpdatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastUpdated');
    });
  }

  QueryBuilder<TerritoryCard, Publisher?, QQueryOperations>
      publisherProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publisher');
    });
  }

  QueryBuilder<TerritoryCard, Territory?, QQueryOperations>
      territoryProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'territory');
    });
  }

  QueryBuilder<TerritoryCard, VisitBan?, QQueryOperations> visitBansProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'visitBans');
    });
  }
}
