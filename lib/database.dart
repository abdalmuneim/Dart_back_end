import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'dart:io';
import 'tables.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = Directory.current.path;
    final file = File(p.join(dbFolder, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [ExampleTable])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<ExampleTableData>> getAllExamples() => select(exampleTable).get();
  Stream<List<ExampleTableData>> watchAllExamples() => select(exampleTable).watch();
  Future insertExample(Insertable<ExampleTableData> example) => into(exampleTable).insert(example);
}
