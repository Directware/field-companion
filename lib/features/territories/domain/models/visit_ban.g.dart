// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_ban.dart';

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const VisitBanSchema = Schema(
  name: r'VisitBan',
  id: -4771851506078449578,
  properties: {
    r'city': PropertySchema(
      id: 0,
      name: r'city',
      type: IsarType.string,
    ),
    r'comment': PropertySchema(
      id: 1,
      name: r'comment',
      type: IsarType.string,
    ),
    r'floor': PropertySchema(
      id: 2,
      name: r'floor',
      type: IsarType.long,
    ),
    r'gpsPosition': PropertySchema(
      id: 3,
      name: r'gpsPosition',
      type: IsarType.object,
      target: r'Position',
    ),
    r'lastVisit': PropertySchema(
      id: 4,
      name: r'lastVisit',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'street': PropertySchema(
      id: 6,
      name: r'street',
      type: IsarType.string,
    ),
    r'streetSuffix': PropertySchema(
      id: 7,
      name: r'streetSuffix',
      type: IsarType.string,
    ),
    r'tags': PropertySchema(
      id: 8,
      name: r'tags',
      type: IsarType.stringList,
    ),
    r'territoryId': PropertySchema(
      id: 9,
      name: r'territoryId',
      type: IsarType.string,
    )
  },
  estimateSize: _visitBanEstimateSize,
  serialize: _visitBanSerialize,
  deserialize: _visitBanDeserialize,
  deserializeProp: _visitBanDeserializeProp,
);

int _visitBanEstimateSize(
  VisitBan object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.city;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.comment;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.gpsPosition;
    if (value != null) {
      bytesCount += 3 +
          PositionSchema.estimateSize(value, allOffsets[Position]!, allOffsets);
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.street.length * 3;
  bytesCount += 3 + object.streetSuffix.length * 3;
  bytesCount += 3 + object.tags.length * 3;
  {
    for (var i = 0; i < object.tags.length; i++) {
      final value = object.tags[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.territoryId.length * 3;
  return bytesCount;
}

void _visitBanSerialize(
  VisitBan object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.city);
  writer.writeString(offsets[1], object.comment);
  writer.writeLong(offsets[2], object.floor);
  writer.writeObject<Position>(
    offsets[3],
    allOffsets,
    PositionSchema.serialize,
    object.gpsPosition,
  );
  writer.writeDateTime(offsets[4], object.lastVisit);
  writer.writeString(offsets[5], object.name);
  writer.writeString(offsets[6], object.street);
  writer.writeString(offsets[7], object.streetSuffix);
  writer.writeStringList(offsets[8], object.tags);
  writer.writeString(offsets[9], object.territoryId);
}

VisitBan _visitBanDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = VisitBan();
  object.city = reader.readStringOrNull(offsets[0]);
  object.comment = reader.readStringOrNull(offsets[1]);
  object.floor = reader.readLongOrNull(offsets[2]);
  object.gpsPosition = reader.readObjectOrNull<Position>(
    offsets[3],
    PositionSchema.deserialize,
    allOffsets,
  );
  object.lastVisit = reader.readDateTimeOrNull(offsets[4]);
  object.name = reader.readString(offsets[5]);
  object.street = reader.readString(offsets[6]);
  object.streetSuffix = reader.readString(offsets[7]);
  object.tags = reader.readStringList(offsets[8]) ?? [];
  object.territoryId = reader.readString(offsets[9]);
  return object;
}

P _visitBanDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readLongOrNull(offset)) as P;
    case 3:
      return (reader.readObjectOrNull<Position>(
        offset,
        PositionSchema.deserialize,
        allOffsets,
      )) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readStringList(offset) ?? []) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension VisitBanQueryFilter
    on QueryBuilder<VisitBan, VisitBan, QFilterCondition> {
  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> cityIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'city',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> cityIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'city',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> cityEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> cityGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> cityLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> cityBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'city',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> cityStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> cityEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> cityContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'city',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> cityMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'city',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> cityIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'city',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> cityIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'city',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> commentIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> commentIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'comment',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> commentEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> commentGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> commentLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> commentBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'comment',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> commentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> commentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> commentContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'comment',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> commentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'comment',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> commentIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> commentIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'comment',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> floorIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'floor',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> floorIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'floor',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> floorEqualTo(
      int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'floor',
        value: value,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> floorGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'floor',
        value: value,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> floorLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'floor',
        value: value,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> floorBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'floor',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> gpsPositionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'gpsPosition',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition>
      gpsPositionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'gpsPosition',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> lastVisitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastVisit',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> lastVisitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastVisit',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> lastVisitEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastVisit',
        value: value,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> lastVisitGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastVisit',
        value: value,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> lastVisitLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastVisit',
        value: value,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> lastVisitBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastVisit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> streetEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'street',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> streetGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'street',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> streetLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'street',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> streetBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'street',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> streetStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'street',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> streetEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'street',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> streetContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'street',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> streetMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'street',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> streetIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'street',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> streetIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'street',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> streetSuffixEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streetSuffix',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition>
      streetSuffixGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'streetSuffix',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> streetSuffixLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'streetSuffix',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> streetSuffixBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'streetSuffix',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition>
      streetSuffixStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'streetSuffix',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> streetSuffixEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'streetSuffix',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> streetSuffixContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'streetSuffix',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> streetSuffixMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'streetSuffix',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition>
      streetSuffixIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'streetSuffix',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition>
      streetSuffixIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'streetSuffix',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> tagsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition>
      tagsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> tagsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> tagsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tags',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> tagsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> tagsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> tagsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tags',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> tagsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tags',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> tagsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition>
      tagsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tags',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> tagsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'tags',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> territoryIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'territoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition>
      territoryIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'territoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> territoryIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'territoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> territoryIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'territoryId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> territoryIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'territoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> territoryIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'territoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> territoryIdContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'territoryId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> territoryIdMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'territoryId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> territoryIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'territoryId',
        value: '',
      ));
    });
  }

  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition>
      territoryIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'territoryId',
        value: '',
      ));
    });
  }
}

extension VisitBanQueryObject
    on QueryBuilder<VisitBan, VisitBan, QFilterCondition> {
  QueryBuilder<VisitBan, VisitBan, QAfterFilterCondition> gpsPosition(
      FilterQuery<Position> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'gpsPosition');
    });
  }
}
