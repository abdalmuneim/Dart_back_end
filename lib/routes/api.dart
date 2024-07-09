import 'package:mvc/src/middleware/helpers.dart';
import 'package:mvc/src/router/router.dart';
import 'package:shelf_router/shelf_router.dart';
import '../controllers/example_controller.dart';

class ApiRoutes implements AppRoutes{
  @override
  String get prefix => "/api/v1/";

  @override
  Router get router {
    final router = Router();

    final exampleController = ExampleController();

    router.get('/example/list', exampleController.listExamples);

    // router.get('/example/list', applyMiddlewares(['auth'], exampleController.listExamples));
    router.get('/example/show/<id>', exampleController.getExampleById);
    router.post('/example/create', exampleController.createExample);
    router.put('/example/update/<id>', exampleController.updateExample);
    router.delete('/example/delete/<id>', exampleController.deleteExample);

    return router;
  }

}
