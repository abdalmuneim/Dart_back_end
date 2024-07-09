import 'package:mvc/app.dart';
// import 'package:mvc/middlewares/error_handler.dart';
// import 'package:shelf/shelf.dart';
// import 'package:shelf/shelf_io.dart' as io;
// import 'package:mvc/routes/router.dart';

void main() async {
  // final router = createRouter();

  // final handler = const Pipeline()
  //     .addMiddleware(logRequests())
  //     .addMiddleware(errorHandler())
  //     .addHandler(router.call);

  // final server = await io.serve(handler, 'localhost', 8080);
  final app = App(host: 'localhost', port: 8080);
  app.start();
  print('Server listening on port ${app.port}');
}
