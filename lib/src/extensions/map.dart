part of easy_extension;

extension MapExtension<K, V> on Map<K, V> {
  int count([bool Function(MapEntry<K, V>)? predicate]) {
    if (predicate == null) {
      return length;
    }
    var count = 0;

    final i = entries.iterator;
    while (i.moveNext()) {
      if (predicate(i.current)) {
        count++;
      }
    }
    return count;
  }

  Map<K, V> filter(bool Function(MapEntry<K, V> entry) predicate) {
    final result = <K, V>{};
    for (final entry in entries) {
      if (predicate(entry)) {
        result[entry.key] = entry.value;
      }
    }
    return result;
  }

  Map<K, V> filterKeys(bool Function(K) predicate) {
    final result = <K, V>{};
    for (final entry in entries) {
      if (predicate(entry.key)) {
        result[entry.key] = entry.value;
      }
    }
    return result;
  }

  Map<K, V> filterNot(bool Function(MapEntry<K, V> entry) predicate) {
    final result = <K, V>{};
    for (final entry in entries) {
      if (!predicate(entry)) {
        result[entry.key] = entry.value;
      }
    }
    return result;
  }

  Map<K, V> filterValues(bool Function(V) predicate) {
    final result = <K, V>{};
    for (final entry in entries) {
      if (predicate(entry.value)) {
        result[entry.key] = entry.value;
      }
    }
    return result;
  }

  V getOrElse(K key, V Function() defaultValue) {
    return this[key] ?? defaultValue();
  }

  Iterable<R> mapEntries<R>(R Function(MapEntry<K, V>) transform) sync* {
    for (final entry in entries) {
      yield transform(entry);
    }
  }

  Map<R, V> mapKeys<R>(R Function(MapEntry<K, V>) transform) {
    return map((key, value) {
      return MapEntry(transform(MapEntry(key, value)), value);
    });
  }

  Map<K, R> mapValues<R>(R Function(MapEntry<K, V>) transform) {
    return map((key, value) {
      return MapEntry(key, transform(MapEntry(key, value)));
    });
  }

  List<Pair<K, V>> toList() {
    return mapEntries((e) => Pair<K, V>(e.key, e.value)).toList();
  }
}

extension NullMapExtension<K, V> on Map<K, V>? {
  Map<K, V> orEmpty() => this ?? <K, V>{};
}
