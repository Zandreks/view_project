import 'package:view_project/config/prod_config.dart';
import 'package:view_project/config/test_config.dart';

import 'base_config.dart';
import 'dev_config.dart';

class Environment {
  factory Environment() {
    return _singleton;
  }
  late BaseConfig config;
  Environment._internal();

  static final Environment _singleton = Environment._internal();


  static const String development = 'DEVELOPMENT';
  static const String test = 'TEST';
  static const String production = 'PRODUCTION';


  initConfig(String environment) {
    config = _getConfig(environment);
  }

  BaseConfig _getConfig(String environment) {
    switch (environment) {
      case Environment.production:
        return ProdConfig();
      case Environment.test:
        return TestConfig();
      default:
        return DevConfig();
    }
  }
}