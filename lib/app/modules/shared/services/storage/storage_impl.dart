import 'package:mymoney/app/shared/services/storage/storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageImpl implements Storage {
  late final SharedPreferences prefs;

  @override
  String get(String key) {
    return prefs.getString(key) ?? '';
  }

  @override
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void save(String key, String value) {
    prefs.setString(key, value);
  }
}