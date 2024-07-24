import 'dart:convert';

class StringUtil {

  static String getAppleEmail({required String identityToken}) {
    List<String> jwt = identityToken.split('.');
    String payload = jwt[1];
    payload = base64.normalize(payload);

    final List<int> jsonData = base64.decode(payload);
    final userInfo = jsonDecode(utf8.decode(jsonData));
    String email = userInfo['email'];

    return email;
  }

  /// 공백 제거 Method
  static String checkEmpty(String? value) => value!.replaceAll(RegExp(r'\s+'), '');


  /// Object(Map) -> Json(String)
  static String toJson(map) {
    return json.encode(map);
  }

  /// Json(String) -> Object(Map)
  static Map<String, dynamic> toObject(jsonData){
    return json.decode(jsonData);
  }

}