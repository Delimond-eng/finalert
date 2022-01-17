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

/*Future<PickedFile> takePhoto({ImageSource source}) async {
  final ImagePicker _picker = ImagePicker();
  // ignore: deprecated_member_use
  final pickedFile = await _picker.getImage(
    source: source,
  );

  if (pickedFile != null) {
    return pickedFile;
  } else {
    return null;
  }
}*/
