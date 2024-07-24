import 'package:flutter_riverpod/flutter_riverpod.dart';

final pageIndexProvider = StateNotifierProvider<PageIndexNotifier, int>(
    (ref) => PageIndexNotifier(ref),
    name: 'pageIndexProvider');

class PageIndexNotifier extends StateNotifier<int> {
  PageIndexNotifier(this._ref) : super(0);
  final Ref _ref;

  void changePageIndexWithApi(int index) {
    if (state == index || index > 4) return;

    state = index;

    /// 조건별로 각 페이지에 필요한 데이터를 불러온다.
    switch (index) {
      /// today
      case 0:
        break;

      /// sketch
      case 1:
        break;

      /// my-feelings
      case 2:
        break;

      /// canvas
      case 3:
        break;

      /// my-page
      case 4:
        break;
    }
  }

  void changePageOnlyIndex(int index) {
    state = index;
  }
}
