int colorParser(String hexString) {
  hexString = hexString.replaceFirst('#', "");
  return int.parse('FF$hexString', radix: 16);
}
