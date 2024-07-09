import 'package:mvc/middlewares/auth.dart';
import 'package:mvc/middlewares/error_handler.dart';
import 'package:mvc/routes/router.dart';
import 'package:mvc/src/middleware/middleware_registry.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

class App {
  final String host;
  final int port;

  App({required this.host, required this.port});

  Future<void> start() async {
    _registerMiddlewares();
    final handler = const Pipeline()
        .addMiddleware(_loadMiddlewares())
        .addHandler(_loadRoutes().call);

    await io.serve(handler, host, port);
  }

  Middleware _loadMiddlewares() {    
    final middlewares = [
      logRequests(),
      errorHandler(),
    ];

    return (Handler handler) {
      for (var middleware in middlewares) {
        handler = middleware(handler);
      }
      return handler;
    };
  }

  void _registerMiddlewares() {
    MiddlewareRegistry.register('auth', checkAuthorization());
  }

  Router _loadRoutes() {
    return createRouter();
  }
}
