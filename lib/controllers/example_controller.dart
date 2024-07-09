import 'package:shelf/shelf.dart';
import '../models/example_model.dart';

class ExampleController {
  Response getExampleById(Request request, String id) {
    final example = Example(int.parse(id), 'Example Name');
    return Response.ok(example.toJson());
  }

  Response listExamples(Request request) {
    final examples = [
      Example(1, 'Example 1'),
      Example(2, 'Example 2'),
      Example(3, 'Example 3'),
    ];
    final examplesJson = examples.map((e) => e.toJson()).toList();
    return Response.ok(examplesJson.toString());
  }

  Response createExample(Request request) {
    // Handle example creation logic here
    return Response.ok('Example created successfully');
  }

  Response updateExample(Request request, String id) {
    // Handle example update logic here
    return Response.ok('Example updated successfully');
  }

  Response deleteExample(Request request, String id) {
    // Handle example deletion logic here
    return Response.ok('Example deleted successfully');
  }
}
