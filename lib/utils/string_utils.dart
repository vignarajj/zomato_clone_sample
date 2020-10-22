RegExp numberOnly = RegExp(r'[^0-9.,]');

double strToNumericOnlyDouble(String value) {
  return double.parse(value.replaceAll(numberOnly, ''));
}

int strToNumericOnlyInt(String value) {
  return int.parse(value.replaceAll(numberOnly, ''));
}

String capitalize(String s) {
  return s.substring(0, 1).toUpperCase() + s.substring(1).toLowerCase();
}