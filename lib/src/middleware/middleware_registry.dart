import 'package:shelf/shelf.dart';

class MiddlewareRegistry {
  static final Map<String, Middleware> _middlewares = {};

  static void register(String name, Middleware middleware) {
    _middlewares[name] = middleware;
  }

  static Middleware? get(String name) {
    return _middlewares[name];
  }
}
