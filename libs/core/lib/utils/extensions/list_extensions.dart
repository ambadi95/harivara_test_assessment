extension FirstOrNull<E> on List<E> {
  E? firstOrNull(bool Function(E element) test, {E? Function()? orElse}) {
    for (var element in this) {
      if (test(element)) {
        return element;
      }
    }
    return orElse != null ? orElse() : null;
  }
}

extension MapExtensions on List? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension InsertBetween<T> on List<T> {
  List<T> insertBetween(T newItem) {
    final result = expand((element) => [element, newItem]).toList();
    result.removeLast();
    return result;
  }
}
