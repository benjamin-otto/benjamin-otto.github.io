typedef Validator = String? Function(String?);

class InputValidator {
  InputValidator(this.validators);

  final List<Validator> validators;

  String? validate(String? value) {
    for (Validator validator in validators) {
      var errorMsg = validator(value);
      if (errorMsg != null) return errorMsg;
    }
    return null;
  }
}

abstract final class Validators {
  static String? isNotEmpty(String? input) =>
      (input == null || input.trim().isEmpty) ? '*Required field.' : null;

  static String? isValidEmail(String? input) =>
      (input == null || !emailRegEx.hasMatch(input))
          ? 'Please enter a valid email address.'
          : null;

  static final emailRegEx = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
}
