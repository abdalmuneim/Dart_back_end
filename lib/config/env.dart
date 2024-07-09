import 'package:dotenv/dotenv.dart';

class Env {
  static var env = DotEnv(includePlatformEnvironment: true)..load();

  static bool debug = env['APP_DEBUG']?.toLowerCase() == 'true';
}
