import 'base_config.dart';

class TestConfig implements BaseConfig {
  @override
  String get apiHost => "https://api.project.codetau.com/api/";

  @override
  String get storage => "https://api.project.codetau.com";
}
