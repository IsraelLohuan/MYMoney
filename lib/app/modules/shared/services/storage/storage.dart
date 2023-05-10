abstract class Storage {
  Future<void> init();
  String get(String key);
  void save(String key, String value);
}