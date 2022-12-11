import 'base_config.dart';

class ProdConfig  implements BaseConfig {
  @override
  String get apiHost => "https://api.project.qaztourism.kz/api/";

  @override
  String get apiHostSocket => "";
}
