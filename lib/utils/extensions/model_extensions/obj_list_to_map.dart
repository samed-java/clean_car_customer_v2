extension ObjListToMap<T> on List<T> {
  Map<K, V> objToMap<K, V>(
      {required K Function(T) key, required V Function(T) value}) {
    return Map.fromEntries(
        map<MapEntry<K, V>>((e) => MapEntry(key(e), value(e))));
  }
}
