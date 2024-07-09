import 'package:mvc/config/env.dart';
import 'package:shelf/shelf.dart';
import 'dart:convert';

Middleware errorHandler() {
  return (Handler innerHandler) {
    return (Request request) async {
      try {
        return await innerHandler(request);
      } catch (e, stackTrace) {
        if (Env.debug) {
          final errorResponse = {
            'message': e.toString().toString().replaceAll('\n', ' ').replaceAll('\r', ' '),
            'stackTrace': _parseTrace(stackTrace.toString().replaceAll('\n', ' ').replaceAll('\r', ' ')),
          };
          return Response.internalServerError(
              body: jsonEncode(errorResponse),
              headers: {'Content-Type': 'application/json'});
        } else {
          return Response.internalServerError(
              body: 'Internal Server Error');
        }
      }
    };
  };
}

Map<String, dynamic> _parseTrace(String stackTrace) {
  RegExp regExp = RegExp(r'#(\d+)\s+([^\s]+)\s+\(([^\s]+):(\d+):(\d+)\)');

  List<Map<String, dynamic>> trace = regExp.allMatches(stackTrace).map((match) {
    return {
      'number': int.parse(match.group(1) ?? '0'),
      'file': match.group(3),
      'line': '${match.group(4)}:${match.group(5)}',
      'function': match.group(2),
    };
  }).toList();

  Map<String, dynamic> jsonTrace = {
    'trace': trace,
  };

  return jsonTrace;
}