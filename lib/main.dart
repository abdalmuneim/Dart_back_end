import 'dart:convert';
import 'package:drift/drift.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';
import 'database.dart';
import 'migration_handler.dart';

void main() async {
  final db = AppDatabase();
  await applyMigrations(db);

  final router = Router()
    ..get('/examples', (Request request) async {
      final examples = await db.getAllExamples();
      final jsonExamples = jsonEncode(examples.map((e) => {'id': e.id, 'name': e.name}).toList());
      return Response.ok(jsonExamples, headers: {'Content-Type': 'application/json'});
    })
    ..post('/examples', (Request request) async {
      final payload = await request.readAsString();
      final data = jsonDecode(payload) as Map<String, dynamic>;
      final name = data['name'] as String;

      await db.insertExample(ExampleTableCompanion(name: Value(name)));
      return Response.ok('Example added');
    });

  final handler = Pipeline().addMiddleware(logRequests()).addHandler(router);

  final server = await io.serve(handler, 'localhost', 8080);
  print('Server listening on port ${server.port}');
}
