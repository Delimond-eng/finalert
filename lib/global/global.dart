import 'package:get_storage/get_storage.dart';

var storage = GetStorage();

String truncateStringWithPoint(String text, int length) {
  return (text.length >= length) ? "${text.substring(0, length)}..." : text;
}

String truncateString(String text, int length) {
  return (text.length >= length) ? text.substring(0, length) : text;
}

List<String> strSpliter(String date) {
  var strList = date.split(RegExp(r"[,| ]"));
  return strList;
}
