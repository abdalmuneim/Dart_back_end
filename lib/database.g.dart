// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $ExampleTableTable extends ExampleTable
    with TableInfo<$ExampleTableTable, ExampleTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExampleTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 50),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descMeta = const VerificationMeta('desc');
  @override
  late final GeneratedColumn<String> desc = GeneratedColumn<String>(
      'desc', aliasedName, true,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 500),
      type: DriftSqlType.string,
      requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, name, desc];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'example_table';
  @override
  VerificationContext validateIntegrity(Insertable<ExampleTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('desc')) {
      context.handle(
          _descMeta, desc.isAcceptableOrUnknown(data['desc']!, _descMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExampleTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExampleTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      desc: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}desc']),
    );
  }

  @override
  $ExampleTableTable createAlias(String alias) {
    return $ExampleTableTable(attachedDatabase, alias);
  }
}

class ExampleTableData extends DataClass
    implements Insertable<ExampleTableData> {
  final int id;
  final String name;
  final String? desc;
  const ExampleTableData({required this.id, required this.name, this.desc});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || desc != null) {
      map['desc'] = Variable<String>(desc);
    }
    return map;
  }

  ExampleTableCompanion toCompanion(bool nullToAbsent) {
    return ExampleTableCompanion(
      id: Value(id),
      name: Value(name),
      desc: desc == null && nullToAbsent ? const Value.absent() : Value(desc),
    );
  }

  factory ExampleTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExampleTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      desc: serializer.fromJson<String?>(json['desc']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'desc': serializer.toJson<String?>(desc),
    };
  }

  ExampleTableData copyWith(
          {int? id,
          String? name,
          Value<String?> desc = const Value.absent()}) =>
      ExampleTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        desc: desc.present ? desc.value : this.desc,
      );
  @override
  String toString() {
    return (StringBuffer('ExampleTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('desc: $desc')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, desc);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExampleTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.desc == this.desc);
}

class ExampleTableCompanion extends UpdateCompanion<ExampleTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String?> desc;
  const ExampleTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.desc = const Value.absent(),
  });
  ExampleTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.desc = const Value.absent(),
  }) : name = Value(name);
  static Insertable<ExampleTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? desc,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (desc != null) 'desc': desc,
    });
  }

  ExampleTableCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String?>? desc}) {
    return ExampleTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (desc.present) {
      map['desc'] = Variable<String>(desc.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExampleTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('desc: $desc')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $ExampleTableTable exampleTable = $ExampleTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [exampleTable];
}

typedef $$ExampleTableTableInsertCompanionBuilder = ExampleTableCompanion
    Function({
  Value<int> id,
  required String name,
  Value<String?> desc,
});
typedef $$ExampleTableTableUpdateCompanionBuilder = ExampleTableCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<String?> desc,
});

class $$ExampleTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExampleTableTable,
    ExampleTableData,
    $$ExampleTableTableFilterComposer,
    $$ExampleTableTableOrderingComposer,
    $$ExampleTableTableProcessedTableManager,
    $$ExampleTableTableInsertCompanionBuilder,
    $$ExampleTableTableUpdateCompanionBuilder> {
  $$ExampleTableTableTableManager(_$AppDatabase db, $ExampleTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ExampleTableTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ExampleTableTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ExampleTableTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> desc = const Value.absent(),
          }) =>
              ExampleTableCompanion(
            id: id,
            name: name,
            desc: desc,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<String?> desc = const Value.absent(),
          }) =>
              ExampleTableCompanion.insert(
            id: id,
            name: name,
            desc: desc,
          ),
        ));
}

class $$ExampleTableTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $ExampleTableTable,
    ExampleTableData,
    $$ExampleTableTableFilterComposer,
    $$ExampleTableTableOrderingComposer,
    $$ExampleTableTableProcessedTableManager,
    $$ExampleTableTableInsertCompanionBuilder,
    $$ExampleTableTableUpdateCompanionBuilder> {
  $$ExampleTableTableProcessedTableManager(super.$state);
}

class $$ExampleTableTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ExampleTableTable> {
  $$ExampleTableTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ExampleTableTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ExampleTableTable> {
  $$ExampleTableTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get desc => $state.composableBuilder(
      column: $state.table.desc,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$ExampleTableTableTableManager get exampleTable =>
      $$ExampleTableTableTableManager(_db, _db.exampleTable);
}
