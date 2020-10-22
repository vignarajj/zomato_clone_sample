import 'package:zomato_clone_sample/utils/camel_case_to_words.dart';

class EnumToString {
  static String parse(enumItem, {bool camelCase = false}) {
    if (enumItem == null) return null;
    final _tmp = enumItem.toString().split('.')[1];
    return !camelCase ? _tmp : camelCaseToWords(_tmp);
  }

  static String parseCamelCase(enumItem) {
    if (enumItem == null) return null;
    final parsed = EnumToString.parse(enumItem);
    return camelCaseToWords(parsed);
  }

  static T fromString<T>(List<T> enumValues, String value) {
    if (value == null || enumValues == null) return null;

    return enumValues.singleWhere(
        (enumItem) =>
            EnumToString.parse(enumItem)?.toLowerCase() == value?.toLowerCase(),
        orElse: () => null);
  }

  static List<String> toList<T>(List<T> enumValues, {bool camelCase = false}) {
    if (enumValues == null) return null;
    final _enumList = enumValues
        .map((t) =>
            !camelCase ? EnumToString.parse(t) : EnumToString.parseCamelCase(t))
        .toList();
    return _enumList;
  }
}
