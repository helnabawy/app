extension StringExtensions on String {
  String capFirstCharacter() => '${this[0].toUpperCase()}${substring(1)}';
}
