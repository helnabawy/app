class Validators {
  static bool validateNumber(String value) {
    RegExp regex = RegExp(r'^[0-9]+$');
    if (regex.hasMatch(value)) {
      return true;
    }
    return false;
  }
}
