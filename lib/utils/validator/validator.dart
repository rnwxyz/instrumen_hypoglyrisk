class Validator {
  String? requiredString(String? value) {
    if (value == null || value.isEmpty || value == '') {
      return 'required';
    }
    return null;
  }

  String? requiredInteger(int? value) {
    if (value == null) {
      return 'required';
    }
    return null;
  }
}
