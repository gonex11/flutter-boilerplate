import 'dart:collection';
import 'dart:math' show Random;

class TwoPartList<E> extends UnmodifiableListBase<E> {
  const TwoPartList({
    Iterable<E> top = const [],
    Iterable<E> bottom = const [],
  })  : _top = top,
        _bottom = bottom;
  const factory TwoPartList.empty() = TwoPartList;

  List<E> get top => List.unmodifiable(_top);
  final Iterable<E> _top;

  List<E> get bottom => List.unmodifiable(_bottom);
  final Iterable<E> _bottom;

  @override
  Iterator<E> get iterator {
    if (_top.isEmpty) return _bottom.iterator;
    if (_bottom.isEmpty) return _top.iterator;
    return _top.followedBy(_bottom).iterator;
  }

  @override
  int get length => _top.length + _bottom.length;

  @override
  E operator [](int index) {
    if (index < _top.length) return _top.elementAt(index);
    return _bottom.elementAt(index - _top.length);
  }
}

abstract class UnmodifiableListBase<E> = ListBase<E>
    with UnmodifiableListMixin<E>;

mixin UnmodifiableListMixin<E> implements List<E> {
  @override
  void operator []=(int index, E value) {
    throw UnsupportedError('Cannot modify an unmodifiable list');
  }

  @override
  set length(int newLength) {
    throw UnsupportedError('Cannot change the length of an unmodifiable list');
  }

  @override
  set first(E element) {
    throw UnsupportedError('Cannot modify an unmodifiable list');
  }

  @override
  set last(E element) {
    throw UnsupportedError('Cannot modify an unmodifiable list');
  }

  @override
  void setAll(int at, Iterable<E> iterable) {
    throw UnsupportedError('Cannot modify an unmodifiable list');
  }

  @override
  void add(E value) {
    throw UnsupportedError('Cannot add to an unmodifiable list');
  }

  @override
  void insert(int index, E element) {
    throw UnsupportedError('Cannot insert into an unmodifiable list');
  }

  @override
  void insertAll(int at, Iterable<E> iterable) {
    throw UnsupportedError('Cannot insert into an unmodifiable list');
  }

  @override
  void addAll(Iterable<E> iterable) {
    throw UnsupportedError('Cannot add to an unmodifiable list');
  }

  @override
  bool remove(Object? element) {
    throw UnsupportedError('Cannot remove from an unmodifiable list');
  }

  @override
  void removeWhere(bool Function(E element) test) {
    throw UnsupportedError('Cannot remove from an unmodifiable list');
  }

  @override
  void retainWhere(bool Function(E element) test) {
    throw UnsupportedError('Cannot remove from an unmodifiable list');
  }

  @override
  void sort([Comparator<E>? compare]) {
    throw UnsupportedError('Cannot modify an unmodifiable list');
  }

  @override
  void shuffle([Random? random]) {
    throw UnsupportedError('Cannot modify an unmodifiable list');
  }

  @override
  void clear() {
    throw UnsupportedError('Cannot clear an unmodifiable list');
  }

  @override
  E removeAt(int index) {
    throw UnsupportedError('Cannot remove from an unmodifiable list');
  }

  @override
  E removeLast() {
    throw UnsupportedError('Cannot remove from an unmodifiable list');
  }

  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    throw UnsupportedError('Cannot modify an unmodifiable list');
  }

  @override
  void removeRange(int start, int end) {
    throw UnsupportedError('Cannot remove from an unmodifiable list');
  }

  @override
  void replaceRange(int start, int end, Iterable<E> iterable) {
    throw UnsupportedError('Cannot modify an unmodifiable list');
  }

  @override
  void fillRange(int start, int end, [E? fillValue]) {
    throw UnsupportedError('Cannot modify an unmodifiable list');
  }
}
