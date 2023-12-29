extension ObjListToMap<T> on List<T> {
  objToMap<K, V>(
      {required K Function(T) key, required V Function(T) value}) {
    Map.fromEntries(map<MapEntry<K, V>>((e) => MapEntry(key(e), value(e))));
  }
}
