extension StringExtensions on String? {
  String capitalize() {
    if (this == null) {
      return "";
    }
    return "${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}";
  }
}
