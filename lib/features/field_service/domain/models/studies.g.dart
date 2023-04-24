// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studies.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetStudiesCollection on Isar {
  IsarCollection<Studies> get studies => this.collection();
}

const StudiesSchema = CollectionSchema(
  name: r'Studies',
  id: -9064284054525643516,
  properties: {
    r'count': PropertySchema(
      id: 0,
      name: r'count',
      type: IsarType.long,
    ),
    r'month': PropertySchema(
      id: 1,
      name: r'month',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _studiesEstimateSize,
  serialize: _studiesSerialize,
  deserialize: _studiesDeserialize,
  deserializeProp: _studiesDeserializeProp,
  idName: r'id',
  indexes: {
    r'month': IndexSchema(
      id: -3594385961712742690,
      name: r'month',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'month',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _studiesGetId,
  getLinks: _studiesGetLinks,
  attach: _studiesAttach,
  version: '3.0.6-dev.0',
);

int _studiesEstimateSize(
  Studies object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _studiesSerialize(
  Studies object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.count);
  writer.writeDateTime(offsets[1], object.month);
}

Studies _studiesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Studies(
    count: reader.readLongOrNull(offsets[0]) ?? 0,
    id: id,
    month: reader.readDateTime(offsets[1]),
  );
  return object;
}

P _studiesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongOrNull(offset) ?? 0) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _studiesGetId(Studies object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _studiesGetLinks(Studies object) {
  return [];
}

void _studiesAttach(IsarCollection<dynamic> col, Id id, Studies object) {}

extension StudiesByIndex on IsarCollection<Studies> {
  Future<Studies?> getByMonth(DateTime month) {
    return getByIndex(r'month', [month]);
  }

  Studies? getByMonthSync(DateTime month) {
    return getByIndexSync(r'month', [month]);
  }

  Future<bool> deleteByMonth(DateTime month) {
    return deleteByIndex(r'month', [month]);
  }

  bool deleteByMonthSync(DateTime month) {
    return deleteByIndexSync(r'month', [month]);
  }

  Future<List<Studies?>> getAllByMonth(List<DateTime> monthValues) {
    final values = monthValues.map((e) => [e]).toList();
    return getAllByIndex(r'month', values);
  }

  List<Studies?> getAllByMonthSync(List<DateTime> monthValues) {
    final values = monthValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'month', values);
  }

  Future<int> deleteAllByMonth(List<DateTime> monthValues) {
    final values = monthValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'month', values);
  }

  int deleteAllByMonthSync(List<DateTime> monthValues) {
    final values = monthValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'month', values);
  }

  Future<Id> putByMonth(Studies object) {
    return putByIndex(r'month', object);
  }

  Id putByMonthSync(Studies object, {bool saveLinks = true}) {
    return putByIndexSync(r'month', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByMonth(List<Studies> objects) {
    return putAllByIndex(r'month', objects);
  }

  List<Id> putAllByMonthSync(List<Studies> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'month', objects, saveLinks: saveLinks);
  }
}

extension StudiesQueryWhereSort on QueryBuilder<Studies, Studies, QWhere> {
  QueryBuilder<Studies, Studies, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<Studies, Studies, QAfterWhere> anyMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'month'),
      );
    });
  }
}

extension StudiesQueryWhere on QueryBuilder<Studies, Studies, QWhereClause> {
  QueryBuilder<Studies, Studies, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Studies, Studies, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Studies, Studies, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Studies, Studies, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Studies, Studies, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Studies, Studies, QAfterWhereClause> monthEqualTo(
      DateTime month) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'month',
        value: [month],
      ));
    });
  }

  QueryBuilder<Studies, Studies, QAfterWhereClause> monthNotEqualTo(
      DateTime month) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'month',
              lower: [],
              upper: [month],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'month',
              lower: [month],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'month',
              lower: [month],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'month',
              lower: [],
              upper: [month],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<Studies, Studies, QAfterWhereClause> monthGreaterThan(
    DateTime month, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'month',
        lower: [month],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<Studies, Studies, QAfterWhereClause> monthLessThan(
    DateTime month, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'month',
        lower: [],
        upper: [month],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<Studies, Studies, QAfterWhereClause> monthBetween(
    DateTime lowerMonth,
    DateTime upperMonth, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'month',
        lower: [lowerMonth],
        includeLower: includeLower,
        upper: [upperMonth],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StudiesQueryFilter
    on QueryBuilder<Studies, Studies, QFilterCondition> {
  QueryBuilder<Studies, Studies, QAfterFilterCondition> countEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'count',
        value: value,
      ));
    });
  }

  QueryBuilder<Studies, Studies, QAfterFilterCondition> countGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'count',
        value: value,
      ));
    });
  }

  QueryBuilder<Studies, Studies, QAfterFilterCondition> countLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'count',
        value: value,
      ));
    });
  }

  QueryBuilder<Studies, Studies, QAfterFilterCondition> countBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'count',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Studies, Studies, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Studies, Studies, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Studies, Studies, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Studies, Studies, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Studies, Studies, QAfterFilterCondition> monthEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<Studies, Studies, QAfterFilterCondition> monthGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<Studies, Studies, QAfterFilterCondition> monthLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'month',
        value: value,
      ));
    });
  }

  QueryBuilder<Studies, Studies, QAfterFilterCondition> monthBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'month',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension StudiesQueryObject
    on QueryBuilder<Studies, Studies, QFilterCondition> {}

extension StudiesQueryLinks
    on QueryBuilder<Studies, Studies, QFilterCondition> {}

extension StudiesQuerySortBy on QueryBuilder<Studies, Studies, QSortBy> {
  QueryBuilder<Studies, Studies, QAfterSortBy> sortByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.asc);
    });
  }

  QueryBuilder<Studies, Studies, QAfterSortBy> sortByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.desc);
    });
  }

  QueryBuilder<Studies, Studies, QAfterSortBy> sortByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<Studies, Studies, QAfterSortBy> sortByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }
}

extension StudiesQuerySortThenBy
    on QueryBuilder<Studies, Studies, QSortThenBy> {
  QueryBuilder<Studies, Studies, QAfterSortBy> thenByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.asc);
    });
  }

  QueryBuilder<Studies, Studies, QAfterSortBy> thenByCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'count', Sort.desc);
    });
  }

  QueryBuilder<Studies, Studies, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Studies, Studies, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Studies, Studies, QAfterSortBy> thenByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.asc);
    });
  }

  QueryBuilder<Studies, Studies, QAfterSortBy> thenByMonthDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'month', Sort.desc);
    });
  }
}

extension StudiesQueryWhereDistinct
    on QueryBuilder<Studies, Studies, QDistinct> {
  QueryBuilder<Studies, Studies, QDistinct> distinctByCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'count');
    });
  }

  QueryBuilder<Studies, Studies, QDistinct> distinctByMonth() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'month');
    });
  }
}

extension StudiesQueryProperty
    on QueryBuilder<Studies, Studies, QQueryProperty> {
  QueryBuilder<Studies, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Studies, int, QQueryOperations> countProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'count');
    });
  }

  QueryBuilder<Studies, DateTime, QQueryOperations> monthProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'month');
    });
  }
}
