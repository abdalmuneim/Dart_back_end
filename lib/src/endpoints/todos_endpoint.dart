import 'package:serverpod/serverpod.dart';

class TodosEndpoint extends Endpoint {
  Future<List<Map<String, dynamic>>> todos(Session session) async {
    final todo = {
      'id': '1',
      'name': 'First Todo',
    };
    final todos = [todo];

    return todos;
  }
}
