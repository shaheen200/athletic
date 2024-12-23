bool numberOnly({required String text}) {
  if (text.isNotEmpty) {
    if (_isValidNumber(text)) {
      if (double.parse(text) >= 0) {
        return true;
      } else {
        return false;
      }
    } else {
      return false;
    }
  } else {
    return false;
  }
}

bool _isValidNumber(String text) {
  final regex = RegExp(r'^-?(\d+(\.\d*)?|\.\d+)$');
  return regex.hasMatch(text);
}

bool checkString(String input) {
  // Check if the input is a valid positive number
  if (_isValidNumber(input)) {
    // Try parsing the input as a double
    try {
      double doubleValue = double.parse(input);
      // Check if the parsed double is positive or zero
      if (doubleValue >= 0) {
        return true;
      }
    } catch (e) {
      // If parsing as a double fails, return false
      return false;
    }
  }
  // Return false if input is not a valid number or if it's negative
  return false;
}
