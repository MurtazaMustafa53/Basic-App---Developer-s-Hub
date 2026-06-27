class Validation {
  String? emailValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "The email is required";
    }
    if (!value.contains('@') || !value.contains('.')) {
      return "Type a Valid Email";
    }
    return null;
  }

  String? passwordValidation(String? value) {
    if (value == null || value.isEmpty) {
      return "The password is Required";
    }
    return null;
  }
}
