import 'package:hive/hive.dart';
import 'package:skala_mobile/main_commons/main_constant_data.dart';

class Prefs {
  final _box = Hive.box(MainConstantData.mainBox);

  static const String tokenKey = 'tokenKey';
  static const String isActiveKey = 'isActiveKey';
  static const String isWelcomeKey = 'isWelcomeKey';

  bool? get isWelcome => _box.get(isWelcomeKey);
  set isWelcome(bool? val) => _box.put(isWelcomeKey, val);

  bool? get isActive => _box.get(isActiveKey);
  set isActive(bool? val) => _box.put(isActiveKey, val);

  String? get token => _box.get(tokenKey);
  set token(String? val) => _box.put(tokenKey, val);

  bool get isLogin => isActive == true && (token?.isNotEmpty ?? false);

  Future<void> clear() async => await _box.clear();
}
