import 'dart:io';

import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'app.dart';
import 'common/data/index/index.dart';
import 'common/data/storage/local_storage.dart';
import 'global_provider/logger.riverpod.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // LocalStorage 초기화
  await initializeLocalStorage();

  checkVersion();
  // 네이티브 스플래시 화면 제거
  FlutterNativeSplash.remove();

  // 애플리케이션 실행
  runApp(
    ProviderScope(
      observers: [ProviderLogger()],
      child: const App(),
    ),
  );
}

checkVersion() async {
  debugPrint('🚀Start 내 마음이 프로젝트 🚀');
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  final String currentOS = Platform.isIOS ? 'iOS' : 'Android';
  debugPrint('⚡️version : [${packageInfo.version}] || os : [$currentOS]⚡️ ');
}


