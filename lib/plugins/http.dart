import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:stack_trace/stack_trace.dart';

class LoggingHttpClient extends http.BaseClient {
  final http.Client _inner;

  LoggingHttpClient(this._inner);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final stopwatch = Stopwatch()..start();

    // Print request details
    print('''
    ''');

    final response = await _inner.send(request);

    // Stop stopwatch
    stopwatch.stop();

    // Print response details
    print('''
HTTP Response:
  - Status Code: ${response.statusCode}
  - Duration: ${stopwatch.elapsedMilliseconds}ms
    ''');

    return response;
  }
}

// Global instance of the logging client
final LoggingHttpClient _client = LoggingHttpClient(http.Client());

@override
Future<http.Response> get(Uri url, {Map<String, String>? headers}) async {
  final frame = Trace.current().frames[1];

  print('''

******** HTTP Request ********
GET - $url
- File: $frame
- URL: GET - $url
''');

  return _client.get(url, headers: headers);
}

@override
Future<http.Response> post(Uri url,
        {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
    _client.post(url, headers: headers, body: body, encoding: encoding);

@override
Future<http.Response> put(Uri url,
        {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
    _client.put(url, headers: headers, body: body, encoding: encoding);

@override
  Future<http.Response> delete(Uri url, {Map<String, String>? headers}) =>
    _client.delete(url, headers: headers);

@override
Future<http.Response> patch(Uri url,
        {Map<String, String>? headers, Object? body, Encoding? encoding}) =>
    _client.patch(url, headers: headers, body: body, encoding: encoding);

@override
Future<String> read(Uri url, {Map<String, String>? headers}) =>
    _client.read(url, headers: headers);

// @override
// Future<http.ByteStream> readBytes(Uri url, {Map<String, String>? headers}) =>
//     _client.readBytes(url, headers: headers);
