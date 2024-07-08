import 'package:drift/drift.dart';

@DataClassName('ExampleTableData')
class ExampleTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 50)();
  TextColumn get desc => text().withLength(min: 1, max: 50)();

}
