import 'package:shelf_router/shelf_router.dart';

abstract class AppRoutes {
  String get prefix;
  Router get router;
}