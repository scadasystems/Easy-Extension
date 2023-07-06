part of easy_extension;

extension CompararatorComposeExtensions<T> on Comparator<T> {
  Comparator<T> compose(Comparator<T> then) {
    return (a, b) {
      final first = this(a, b);
      if (first != 0) {
        return first;
      }
      return then(a, b);
    };
  }
}

extension CompararatorReverseExtensions<T> on Comparator<T> {
  Comparator<T> reverse() => (a, b) => this(b, a);
}
