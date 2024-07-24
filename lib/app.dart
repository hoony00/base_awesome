import 'package:myfeelings/common/utils/extension/context_extension.dart';

import 'common/data/index/index.dart';
import 'config/theme/theme.dart';
import 'domain/splash/s_main.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> with WidgetsBindingObserver {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = context.deviceWidth;
    double height = context.deviceHeight;

    return ScreenUtilInit(
      designSize: Size(width, height),
      child: MaterialApp(
        debugShowMaterialGrid: false,
        debugShowCheckedModeBanner: false,
        showPerformanceOverlay: false,
        theme: buildThemeData(context),
        home:  MainScreen(),
      ),
    );
  }



  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        debugPrint("========= AppLifecycleState.resumed =========");
        break;
      case AppLifecycleState.inactive:
        break;
      case AppLifecycleState.paused:
        debugPrint("========= AppLifecycleState.paused =========");
        break;
      case AppLifecycleState.detached:
        debugPrint("========= AppLifecycleState.detached =========");
        break;
      default:
        break;
    }
    super.didChangeAppLifecycleState(state);
  }


}
