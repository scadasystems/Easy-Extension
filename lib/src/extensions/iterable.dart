part of '../../easy_extension.dart';

extension IterableExtension<E> on Iterable<E> {
  List<E> slice(int start, [int end = -1]) {
    final list = this is List ? this as List<E> : toList();
    var chStart = start;
    var chEnd = end;

    if (chStart < 0) {
      chStart = chStart + list.length;
    }

    if (chEnd < 0) {
      chEnd = chEnd + list.length;
    }

    RangeError.checkValidRange(chStart, chEnd, list.length);

    return list.sublist(chStart, chEnd + 1);
  }

  void forEachIndexed(void Function(E element, int index) action) {
    var index = 0;
    for (final element in this) {
      action(element, index++);
    }
  }

  List<E> sorted() {
    final list = toList();
    list.sort();
    return list;
  }

  SortedList<E> sortedBy(Comparable Function(E element) selector) {
    return SortedList<E>._withSelector(this, selector, 1, null);
  }

  int count([bool Function(E element)? predicate]) {
    var count = 0;
    if (predicate == null) {
      return length;
    } else {
      for (final current in this) {
        if (predicate(current)) {
          count++;
        }
      }
    }

    return count;
  }

  List<E> sortedDescending() {
    final list = toList();
    list.sort((a, b) => -(a as Comparable).compareTo(b));
    return list;
  }

  SortedList<E> sortedByDescending(Comparable Function(E element) selector) {
    return SortedList<E>._withSelector(this, selector, -1, null);
  }

  SortedList<E> sortedWith(Comparator<E> comparator) {
    return SortedList<E>._(this, comparator);
  }

  String joinToString({
    String separator = ', ',
    String Function(E element)? transform,
    String prefix = '',
    String postfix = '',
    int? limit,
    String truncated = '...',
  }) {
    final buffer = StringBuffer();
    var count = 0;
    for (final element in this) {
      if (limit != null && count >= limit) {
        buffer.write(truncated);
        return buffer.toString();
      }
      if (count > 0) {
        buffer.write(separator);
      }
      buffer.write(prefix);
      if (transform != null) {
        buffer.write(transform(element));
      } else {
        buffer.write(element.toString());
      }
      buffer.write(postfix);

      count++;
    }
    return buffer.toString();
  }

  T sumBy<T extends num>(T Function(E element) selector) {
    var sum = T == double ? 0.0 : 0;
    for (final current in this) {
      sum += selector(current);
    }
    return sum as T;
  }

  double averageBy(num Function(E element) selector) {
    var count = 0;
    num sum = 0;

    for (final current in this) {
      sum += selector(current);
      count++;
    }

    if (count == 0) {
      throw StateError('No elements in collection');
    } else {
      return sum / count;
    }
  }

  Iterable<E> get reversed {
    return this is List<E> ? (this as List<E>).reversed : toList().reversed;
  }

  List<E> shuffled([math.Random? random]) => toList()..shuffle(random);

  /// ```dart
  ///final amounts = [2, 3, 4];
  ///final animals = ['dogs', 'birds', 'cats'];
  ///final all = amounts.zip(
  ///  animals,
  ///  (int amount, String animal) => '$amount $animal'
  ///);  // returns: ['2 dogs', '3 birds', '4 cats']
  /// ```
  Iterable<V> zip<R, V>(
    Iterable<R> other,
    V Function(E a, R b) transform,
  ) sync* {
    final it1 = iterator;
    final it2 = other.iterator;
    while (it1.moveNext() && it2.moveNext()) {
      yield transform(it1.current, it2.current);
    }
  }

  Iterable<E> prepend(Iterable<E> elements) sync* {
    yield* elements;
    yield* this;
  }

  Iterable<E> prependElement(E element) sync* {
    yield element;
    yield* this;
  }

  Iterable<E> append(Iterable<E> elements) sync* {
    yield* this;
    yield* elements;
  }

  Iterable<E> appendElement(E element) sync* {
    yield* this;
    yield element;
  }

  Iterable<E> distinct() sync* {
    final existing = HashSet<E>();
    for (final current in this) {
      if (existing.add(current)) {
        yield current;
      }
    }
  }

  Iterable<R> mapIndexed<R>(R Function(int index, E) transform) sync* {
    var index = 0;
    for (final element in this) {
      yield transform(index++, element);
    }
  }

  Iterable<E> whereIndexed(
    bool Function(E element, int index) predicate,
  ) sync* {
    var index = 0;
    for (final element in this) {
      if (predicate(element, index++)) {
        yield element;
      }
    }
  }

  void whereIndexedTo(
    List<E> destination,
    bool Function(E element, int index) predicate,
  ) {
    var index = 0;
    for (final element in this) {
      if (predicate(element, index++)) {
        destination.add(element);
      }
    }
  }

  Iterable<E> filter(bool Function(E element) predicate) => where(predicate);

  Iterable<E> filterIndexed(bool Function(E element, int index) predicate) =>
      IterableWhereIndexed(this).whereIndexed(predicate);

  /// ```dart
  /// val chars = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  /// print(chars.take(3)) // [1, 2, 3]
  /// print(chars.takeWhile((it) => it < 5) // [1, 2, 3, 4]
  /// print(chars.takeLast(2)) // [8, 9]
  /// print(chars.takeLastWhile((it) => it > 5 }) // [6, 7, 8, 9]
  /// ```
  Iterable<E> lastWhile(bool Function(E element) predicate) {
    final list = ListQueue<E>();
    for (final element in reversed) {
      if (!predicate(element)) break;
      list.addFirst(element);
    }
    return list;
  }

  Map<K, List<E>> groupBy<K>(K Function(E element) keySelector) {
    return collection.groupBy(this, keySelector);
  }

  String toPostgresArray() {
    return '{${join(',')}}';
  }
}

extension IterableWhereIndexed<E> on Iterable<E> {
  /// Returns all elements that satisfy the given [predicate].
  Iterable<E> whereIndexed(
    bool Function(E element, int index) predicate,
  ) sync* {
    var index = 0;
    for (final element in this) {
      if (predicate(element, index++)) {
        yield element;
      }
    }
  }
}
