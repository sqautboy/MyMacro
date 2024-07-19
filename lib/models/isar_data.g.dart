// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'isar_data.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTargetDataCollection on Isar {
  IsarCollection<TargetData> get targetDatas => this.collection();
}

const TargetDataSchema = CollectionSchema(
  name: r'TargetData',
  id: -7175455823071343615,
  properties: {
    r'targetCalories': PropertySchema(
      id: 0,
      name: r'targetCalories',
      type: IsarType.long,
    ),
    r'targetCarb': PropertySchema(
      id: 1,
      name: r'targetCarb',
      type: IsarType.long,
    ),
    r'targetFat': PropertySchema(
      id: 2,
      name: r'targetFat',
      type: IsarType.long,
    ),
    r'targetProtein': PropertySchema(
      id: 3,
      name: r'targetProtein',
      type: IsarType.long,
    )
  },
  estimateSize: _targetDataEstimateSize,
  serialize: _targetDataSerialize,
  deserialize: _targetDataDeserialize,
  deserializeProp: _targetDataDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _targetDataGetId,
  getLinks: _targetDataGetLinks,
  attach: _targetDataAttach,
  version: '3.1.0+1',
);

int _targetDataEstimateSize(
  TargetData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _targetDataSerialize(
  TargetData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.targetCalories);
  writer.writeLong(offsets[1], object.targetCarb);
  writer.writeLong(offsets[2], object.targetFat);
  writer.writeLong(offsets[3], object.targetProtein);
}

TargetData _targetDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TargetData();
  object.id = id;
  object.targetCalories = reader.readLong(offsets[0]);
  object.targetCarb = reader.readLong(offsets[1]);
  object.targetFat = reader.readLong(offsets[2]);
  object.targetProtein = reader.readLong(offsets[3]);
  return object;
}

P _targetDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _targetDataGetId(TargetData object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _targetDataGetLinks(TargetData object) {
  return [];
}

void _targetDataAttach(IsarCollection<dynamic> col, Id id, TargetData object) {
  object.id = id;
}

extension TargetDataQueryWhereSort on QueryBuilder<TargetData, TargetData, QWhere> {
  QueryBuilder<TargetData, TargetData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TargetDataQueryWhere on QueryBuilder<TargetData, TargetData, QWhereClause> {
  QueryBuilder<TargetData, TargetData, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<TargetData, TargetData, QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterWhereClause> idBetween(
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
}

extension TargetDataQueryFilter on QueryBuilder<TargetData, TargetData, QFilterCondition> {
  QueryBuilder<TargetData, TargetData, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<TargetData, TargetData, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<TargetData, TargetData, QAfterFilterCondition> idBetween(
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

  QueryBuilder<TargetData, TargetData, QAfterFilterCondition> targetCaloriesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetCalories',
        value: value,
      ));
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterFilterCondition> targetCaloriesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetCalories',
        value: value,
      ));
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterFilterCondition> targetCaloriesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetCalories',
        value: value,
      ));
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterFilterCondition> targetCaloriesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetCalories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterFilterCondition> targetCarbEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetCarb',
        value: value,
      ));
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterFilterCondition> targetCarbGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetCarb',
        value: value,
      ));
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterFilterCondition> targetCarbLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetCarb',
        value: value,
      ));
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterFilterCondition> targetCarbBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetCarb',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterFilterCondition> targetFatEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetFat',
        value: value,
      ));
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterFilterCondition> targetFatGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetFat',
        value: value,
      ));
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterFilterCondition> targetFatLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetFat',
        value: value,
      ));
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterFilterCondition> targetFatBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetFat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterFilterCondition> targetProteinEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'targetProtein',
        value: value,
      ));
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterFilterCondition> targetProteinGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'targetProtein',
        value: value,
      ));
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterFilterCondition> targetProteinLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'targetProtein',
        value: value,
      ));
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterFilterCondition> targetProteinBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'targetProtein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TargetDataQueryObject on QueryBuilder<TargetData, TargetData, QFilterCondition> {}

extension TargetDataQueryLinks on QueryBuilder<TargetData, TargetData, QFilterCondition> {}

extension TargetDataQuerySortBy on QueryBuilder<TargetData, TargetData, QSortBy> {
  QueryBuilder<TargetData, TargetData, QAfterSortBy> sortByTargetCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalories', Sort.asc);
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterSortBy> sortByTargetCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalories', Sort.desc);
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterSortBy> sortByTargetCarb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCarb', Sort.asc);
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterSortBy> sortByTargetCarbDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCarb', Sort.desc);
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterSortBy> sortByTargetFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFat', Sort.asc);
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterSortBy> sortByTargetFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFat', Sort.desc);
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterSortBy> sortByTargetProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetProtein', Sort.asc);
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterSortBy> sortByTargetProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetProtein', Sort.desc);
    });
  }
}

extension TargetDataQuerySortThenBy on QueryBuilder<TargetData, TargetData, QSortThenBy> {
  QueryBuilder<TargetData, TargetData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterSortBy> thenByTargetCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalories', Sort.asc);
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterSortBy> thenByTargetCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCalories', Sort.desc);
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterSortBy> thenByTargetCarb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCarb', Sort.asc);
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterSortBy> thenByTargetCarbDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetCarb', Sort.desc);
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterSortBy> thenByTargetFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFat', Sort.asc);
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterSortBy> thenByTargetFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetFat', Sort.desc);
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterSortBy> thenByTargetProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetProtein', Sort.asc);
    });
  }

  QueryBuilder<TargetData, TargetData, QAfterSortBy> thenByTargetProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'targetProtein', Sort.desc);
    });
  }
}

extension TargetDataQueryWhereDistinct on QueryBuilder<TargetData, TargetData, QDistinct> {
  QueryBuilder<TargetData, TargetData, QDistinct> distinctByTargetCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetCalories');
    });
  }

  QueryBuilder<TargetData, TargetData, QDistinct> distinctByTargetCarb() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetCarb');
    });
  }

  QueryBuilder<TargetData, TargetData, QDistinct> distinctByTargetFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetFat');
    });
  }

  QueryBuilder<TargetData, TargetData, QDistinct> distinctByTargetProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'targetProtein');
    });
  }
}

extension TargetDataQueryProperty on QueryBuilder<TargetData, TargetData, QQueryProperty> {
  QueryBuilder<TargetData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TargetData, int, QQueryOperations> targetCaloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetCalories');
    });
  }

  QueryBuilder<TargetData, int, QQueryOperations> targetCarbProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetCarb');
    });
  }

  QueryBuilder<TargetData, int, QQueryOperations> targetFatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetFat');
    });
  }

  QueryBuilder<TargetData, int, QQueryOperations> targetProteinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'targetProtein');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetDailyDataCollection on Isar {
  IsarCollection<DailyData> get dailyDatas => this.collection();
}

const DailyDataSchema = CollectionSchema(
  name: r'DailyData',
  id: -6367240091292278343,
  properties: {
    r'calories': PropertySchema(
      id: 0,
      name: r'calories',
      type: IsarType.long,
    ),
    r'carb': PropertySchema(
      id: 1,
      name: r'carb',
      type: IsarType.long,
    ),
    r'date': PropertySchema(
      id: 2,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'fat': PropertySchema(
      id: 3,
      name: r'fat',
      type: IsarType.long,
    ),
    r'protein': PropertySchema(
      id: 4,
      name: r'protein',
      type: IsarType.long,
    )
  },
  estimateSize: _dailyDataEstimateSize,
  serialize: _dailyDataSerialize,
  deserialize: _dailyDataDeserialize,
  deserializeProp: _dailyDataDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _dailyDataGetId,
  getLinks: _dailyDataGetLinks,
  attach: _dailyDataAttach,
  version: '3.1.0+1',
);

int _dailyDataEstimateSize(
  DailyData object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _dailyDataSerialize(
  DailyData object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.calories);
  writer.writeLong(offsets[1], object.carb);
  writer.writeDateTime(offsets[2], object.date);
  writer.writeLong(offsets[3], object.fat);
  writer.writeLong(offsets[4], object.protein);
}

DailyData _dailyDataDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = DailyData();
  object.calories = reader.readLong(offsets[0]);
  object.carb = reader.readLong(offsets[1]);
  object.date = reader.readDateTime(offsets[2]);
  object.fat = reader.readLong(offsets[3]);
  object.id = id;
  object.protein = reader.readLong(offsets[4]);
  return object;
}

P _dailyDataDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _dailyDataGetId(DailyData object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _dailyDataGetLinks(DailyData object) {
  return [];
}

void _dailyDataAttach(IsarCollection<dynamic> col, Id id, DailyData object) {
  object.id = id;
}

extension DailyDataQueryWhereSort on QueryBuilder<DailyData, DailyData, QWhere> {
  QueryBuilder<DailyData, DailyData, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension DailyDataQueryWhere on QueryBuilder<DailyData, DailyData, QWhereClause> {
  QueryBuilder<DailyData, DailyData, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<DailyData, DailyData, QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterWhereClause> idBetween(
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
}

extension DailyDataQueryFilter on QueryBuilder<DailyData, DailyData, QFilterCondition> {
  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> caloriesEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'calories',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> caloriesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'calories',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> caloriesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'calories',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> caloriesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'calories',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> carbEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'carb',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> carbGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'carb',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> carbLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'carb',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> carbBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'carb',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> dateEqualTo(DateTime value, int month) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> fatEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fat',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> fatGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fat',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> fatLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fat',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> fatBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fat',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> idBetween(
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

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> proteinEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'protein',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> proteinGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'protein',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> proteinLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'protein',
        value: value,
      ));
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterFilterCondition> proteinBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'protein',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension DailyDataQueryObject on QueryBuilder<DailyData, DailyData, QFilterCondition> {}

extension DailyDataQueryLinks on QueryBuilder<DailyData, DailyData, QFilterCondition> {}

extension DailyDataQuerySortBy on QueryBuilder<DailyData, DailyData, QSortBy> {
  QueryBuilder<DailyData, DailyData, QAfterSortBy> sortByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterSortBy> sortByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterSortBy> sortByCarb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carb', Sort.asc);
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterSortBy> sortByCarbDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carb', Sort.desc);
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterSortBy> sortByFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fat', Sort.asc);
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterSortBy> sortByFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fat', Sort.desc);
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterSortBy> sortByProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.asc);
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterSortBy> sortByProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.desc);
    });
  }
}

extension DailyDataQuerySortThenBy on QueryBuilder<DailyData, DailyData, QSortThenBy> {
  QueryBuilder<DailyData, DailyData, QAfterSortBy> thenByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.asc);
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterSortBy> thenByCaloriesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'calories', Sort.desc);
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterSortBy> thenByCarb() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carb', Sort.asc);
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterSortBy> thenByCarbDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'carb', Sort.desc);
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterSortBy> thenByFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fat', Sort.asc);
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterSortBy> thenByFatDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fat', Sort.desc);
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterSortBy> thenByProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.asc);
    });
  }

  QueryBuilder<DailyData, DailyData, QAfterSortBy> thenByProteinDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'protein', Sort.desc);
    });
  }
}

extension DailyDataQueryWhereDistinct on QueryBuilder<DailyData, DailyData, QDistinct> {
  QueryBuilder<DailyData, DailyData, QDistinct> distinctByCalories() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'calories');
    });
  }

  QueryBuilder<DailyData, DailyData, QDistinct> distinctByCarb() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'carb');
    });
  }

  QueryBuilder<DailyData, DailyData, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<DailyData, DailyData, QDistinct> distinctByFat() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fat');
    });
  }

  QueryBuilder<DailyData, DailyData, QDistinct> distinctByProtein() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'protein');
    });
  }
}

extension DailyDataQueryProperty on QueryBuilder<DailyData, DailyData, QQueryProperty> {
  QueryBuilder<DailyData, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<DailyData, int, QQueryOperations> caloriesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'calories');
    });
  }

  QueryBuilder<DailyData, int, QQueryOperations> carbProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'carb');
    });
  }

  QueryBuilder<DailyData, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<DailyData, int, QQueryOperations> fatProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fat');
    });
  }

  QueryBuilder<DailyData, int, QQueryOperations> proteinProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'protein');
    });
  }
}
