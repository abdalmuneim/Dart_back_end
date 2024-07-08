import 'database.dart';

Future<void> applyMigrations(AppDatabase db) async {
  await db.customStatement('PRAGMA foreign_keys = OFF');
  await db.transaction(() async {
    // Example migration logic
    if (await db.customSelect('SELECT name FROM sqlite_master WHERE type="table" AND name="example_table"').get().then((value) => value.isEmpty)) {
      await db.customStatement('CREATE TABLE example_table (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL)');
    }
  });
  await db.customStatement('PRAGMA foreign_keys = ON');
}
