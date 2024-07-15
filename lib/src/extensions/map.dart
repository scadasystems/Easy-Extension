// ignore_for_file: avoid_function_literals_in_foreach_calls

part of '../../easy_extension.dart';

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

  Map<K, V> deepCopy() {
    var copy = <K, V>{};

    forEach((key, value) {
      if (value is Map) {
        copy[key] = value.deepCopy() as V;
      } else if (value is List) {
        copy[key] = value
            .map(
              (v) => (v is Map) ? v.deepCopy() : v,
            )
            .toList() as V;
      } else {
        copy[key] = value;
      }
    });

    return copy;
  }

  Map<K, V> sortedByKey({bool descending = false}) {
    List<MapEntry<K, V>> sortedEntries;
    if (descending) {
      sortedEntries = entries.toList()..sort((e1, e2) => e2.key.toString().compareTo(e1.key.toString()));
    } else {
      sortedEntries = entries.toList()..sort((e1, e2) => e1.key.toString().compareTo(e2.key.toString()));
    }

    return Map<K, V>.fromEntries(sortedEntries);
  }

  Map<K, V> sortedByValue({bool descending = false}) {
    List<MapEntry<K, V>> sortedEntries;

    if (descending) {
      sortedEntries = entries.toList()..sort((e1, e2) => e2.value.toString().compareTo(e1.value.toString()));
    } else {
      sortedEntries = entries.toList()..sort((e1, e2) => e1.value.toString().compareTo(e2.value.toString()));
    }
    return Map<K, V>.fromEntries(sortedEntries);
  }
}

extension NullMapExtension<K, V> on Map<K, V>? {
  Map<K, V> orEmpty() => this ?? <K, V>{};
}
