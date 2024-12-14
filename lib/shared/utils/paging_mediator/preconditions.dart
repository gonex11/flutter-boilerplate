T requireNotNull<T>(T? value, [String? message, String? name]) {
  if (value == null) {
    throw ArgumentError(message, name);
  }
  return value;
}
