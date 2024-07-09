import 'package:shelf/shelf.dart';
import 'middleware_registry.dart';

Handler applyMiddlewares(List<String> middlewareNames, Handler handler) {
  for (var name in middlewareNames.reversed) {
    final middleware = MiddlewareRegistry.get(name);
    if (middleware != null) {
      handler = middleware(handler);
    } else {
      throw Exception('Middleware "$name" not found in the registry');
    }
  }
  return handler;
}

// Handler Function(Request) applyMiddlewaresToHandler(List<String> middlewareNames, FutureOr<Response> Function(Request, Map<String, String>) handler) {
//   final handlerWithMiddlewares = applyMiddlewares(middlewareNames, (Request request) async {
//     final params = request.context['shelf_router/params'] as Map<String, String>;
//     return await handler(request, params);
//   });
//   return (Request request) => handlerWithMiddlewares(request);
// }
