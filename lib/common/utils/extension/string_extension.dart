extension StringExt on String {
  // phone
  String get phoneFormat {
    if (length == 11) {
      return "${substring(0, 3)}-${substring(3, 7)}-${substring(7, 11)}";
    } else if (length == 10) {
      return "${substring(0, 3)}-${substring(3, 6)}-${substring(6, 10)}";
    } else {
      return this;
    }
  }

  /// , 제거 후 int로 변환
  int get toIntRemovingCommas {
    return int.parse(replaceAll(',', ''));
  }


  /// 휴대폰 번호 유효성 검사
  bool get isValidPhoneNumber {
    final regex = RegExp(r'^010\d{8}$');
    return regex.hasMatch(this);
  }

  /// 15글자로 자르기
  String get cut20 {
    if (length <= 20) {
      return this;
    } else {
      return '${substring(0, 20)}...';
    }
  }

  /// 10글자로 자르기
  String get cut10 {
    if (length <= 11) {
      return this;
    } else {
      return '${substring(0, 10)}...';
    }
  }





  String textWithEllipsis(int maxLength) {
    if (length <= maxLength) {
      return this;
    } else {
      return '${substring(0, maxLength)}...';
    }
  }

}
