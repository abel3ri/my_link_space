class FormValidator {
  static String? urlValidator(String? value) {
    if (value!.isEmpty) return "Please provide a URL";
    if (!RegExp(
            r"^(https?|ftp):\/\/(?:[a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}(?:\/[^\s]*)?$|^www\.[a-zA-Z0-9-]+\.[a-zA-Z]{2,}(?:\/[^\s]*)?$")
        .hasMatch(value)) {
      return "Please provide a valid URL";
    }
    return null;
  }
}
