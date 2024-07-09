import 'dart:convert';

import 'package:shelf/shelf.dart';

Middleware checkAuthorization() {
  return (Handler innerHandler) {
    return (Request request) async {
      final token = request.headers['Authorization'] ??
          request.url.queryParameters['token'];

      if (token == null || token.isEmpty) {
        final errorResponse = json.encode({
          'error': 'Unauthorized',
          'message': 'Missing or invalid token'
        });

        return Response.forbidden(
          errorResponse,
          headers: {'Content-Type': 'application/json'},
        );
      }

      return await innerHandler(request);
    };
  };
}