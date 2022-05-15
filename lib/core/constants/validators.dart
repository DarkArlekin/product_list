class Validators {
  static String? isEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  static String? barCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else if (value.length != 9) {
      return 'Bar code must have 9 symbols';
    }
    return null;
  }
}
