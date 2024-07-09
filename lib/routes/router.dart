import 'package:shelf_router/shelf_router.dart';
import './api.dart';

Router createRouter() {
  final router = Router();

  router.mount(ApiRoutes().prefix, ApiRoutes().router.call);

  return router;
}
