class Pair<A, B> {
  const Pair(this.first, this.second);

  final A first;
  final B second;

  @override
  String toString() => '($first, $second)';

  @override
  bool operator ==(Object other) => identical(this, other) || other is Pair && runtimeType == other.runtimeType && first == other.first && second == other.second;

  @override
  int get hashCode => first.hashCode ^ second.hashCode;
}
