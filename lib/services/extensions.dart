extension StringExtension on String {
  String toProperCase() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
