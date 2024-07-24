import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter/scheduler.dart';
import 'package:myfeelings/config/theme/font/custom_text_style.dart';
import 'package:myfeelings/domain/myfeelings/view/s_my_feelings_main.dart';
import 'package:myfeelings/domain/sketch/view/s_sketch_main.dart';
import 'package:myfeelings/domain/today/view/s_today_main.dart';

import '../../common/data/index/index.dart';
import '../../common/icon/bottom_icons.dart';
import '../../global_provider/page_index.dart';
import '../canvas/view/s_canvas_main.dart';
import '../my_page/view/s_my_page_main.dart';

class MainScreen extends ConsumerStatefulWidget {
  MainScreen({super.key});

  @override
  ConsumerState<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends ConsumerState<MainScreen> {
  @override
  void initState() {
    super.initState();
    // api 이용, 상태 변경을 지연시키기 위해 SchedulerBinding 사용
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      /// 초기화 작업 여기서 진행
    });
  }

  @override
  Widget build(BuildContext context) {
    final pageIndex = ref.watch(pageIndexProvider);

    final List<TabItem> items = [
      TabItem(icon: BottomIcon.frame_20191, title: '투데이'),
      TabItem(icon: BottomIcon.frame_416, title: '스케치'),
      TabItem(icon: BottomIcon.frame_417__1_, title: '마음이'),
      TabItem(icon: BottomIcon.calendar, title: '캔버스'),
      TabItem(icon: BottomIcon.user, title: '마이'),
    ];

    return PopScope(
      canPop: false,
      child: Scaffold(
        body: IndexedStack(
          index: pageIndex,
          children: const [
            TodayMainScreen(),
            SketchMainScreen(),
            MyFeelingsMainScreen(),
            CanvasMainScreen(),
            MyPageMainScreen(),
          ],
        ),
        bottomNavigationBar: SafeArea(
          bottom: false,
          child: BottomBarDefault(
            items: items,
            boxShadow: [
              BoxShadow(
                color: AppColor.grey.withOpacity(0.5),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(0, 0),
              )
            ],
            backgroundColor: AppColor.bottomNavigationBackgroundColor,
            colorSelected: AppColor.primary,
            color: AppColor.grey,
            iconSize: 25.sp,
            titleStyle: CustomTextStyle(fontFamily: 'Sebang', fontSize: 12),
            indexSelected: pageIndex,
            onTap: (int index) => ref
                .read(pageIndexProvider.notifier)
                .changePageIndexWithApi(index),
          ),
        ),
      ),
    );
  }




}
