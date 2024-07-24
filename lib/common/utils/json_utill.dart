import 'dart:convert'; // JSON 인코딩 및 디코딩을 위한 라이브러리
import 'package:flutter/services.dart' show rootBundle; // rootBundle을 사용하기 위한 라이브러리
import '../../domain/my_page/opensource/vo_package.dart'; // Package 클래스 임포트

class LocalJson {
  // JSON 파일에서 데이터를 읽어 List<Package>로 변환하는 함수
  static Future<List<Package>> getObjectList<T>(String filePath) async {
    final jsonString = await getJsonString(filePath); // 파일에서 JSON 문자열을 읽어옴
    final jsonList = jsonDecode(jsonString) as List; // JSON 문자열을 디코딩하여 리스트로 변환
    return jsonList.map((json) => Package.fromJson(json)).toList(); // 각 JSON 객체를 Package 객체로 변환하여 리스트로 반환
  }

  // 파일 경로를 받아 JSON 문자열을 반환하는 함수
  static Future<String> getJsonString(String filePath) async {
    return await rootBundle.loadString(filePath); // 파일 내용을 문자열로 읽어옴
  }
}
