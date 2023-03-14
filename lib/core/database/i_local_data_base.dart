abstract class ILocalDataBase {
  Future deleteValue(String key);
  Future deleteAll();
  Future getData(String key);
  Future setData(String key, String value);
}
