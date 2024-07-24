import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../config/theme/font/pretendard.dart';
import '../../data/index/index.dart';


class PermissionUtil {

  static Future<PermissionStatus> checkCameraPermission(BuildContext context) async {
    final status = await Permission.camera.status;

    print(" 현재 카메라 권한 상태 : $status");

    if (status.isDenied || status.isPermanentlyDenied) {
      PermissionStatus cameraPermissionStatus = PermissionStatus.denied; // 초기값 설정
      if (Platform.isAndroid) {
        cameraPermissionStatus = await checkAndroidPhotosPermission();
      } else {
        cameraPermissionStatus = await Permission.camera.request();
      }

      if (cameraPermissionStatus.isDenied || cameraPermissionStatus.isPermanentlyDenied) {
/*        await showDialog(
          context: context,
          builder: (context) {
            return CustomModalOneButton(
              modalContent: const Text(
                  "카메라 접근 권한 동의를 허용해주셔야 \n카메라 이용이 가능합니다. \n원할한 서비스 이용을 위해 권한을 \n허용해주세요 :)"),
              buttonText: const Text(
                "설정창으로 이동",
                style: Pretendard.wwhite_s16_w600,
              ),
              onButtonPressed: () {
                openAppSettings();
                Navigator.of(context).pop();
              },
            );
          },
        );*/
      }
    }

    return status;
  }


  // 전체 권한 확인
/*  static Future<bool> checkPermission() async {
    // Permission.notification.request().then((value) => null);
    // Android
    if (Platform.isAndroid) {
      final permissions = await Future.wait([
        Permission.storage.status,
        Permission.camera.status,
        Permission.notification.status
      ]);
    } else { // IOS
      final permissions = await Future.wait([
        Permission.photos.status,
        Permission.camera.status,
        Permission.notification.status,
        Permission.appTrackingTransparency.status,
      ]);
    }
    return true;
  }*/

  static Future<PermissionStatus> checkGalleryPermission(BuildContext context) async {
    PermissionStatus status;


    /// 안드로이드는 storage, iOS는 photos 권한을 확인합니다.
    if (Platform.isAndroid) {

      status = await checkAndroidPhotosPermission();
      if (status.isDenied || status.isPermanentlyDenied) {
        debugPrint("[Android] 현재 갤러리 권한 상태 : $status");
      }
    } else {

      status = await Permission.photos.status;
      if (status.isDenied || status.isPermanentlyDenied) {
        debugPrint("[IOS] 현재 갤러리 권한 상태 : $status");

        status = await Permission.photos.request();
      }
    }


    if (status.isDenied || status.isPermanentlyDenied) {
/*      await showDialog(
        context: context,
        builder: (context) {
          return CustomModalOneButton(
            modalContent: const Text(
                "저장공간 접근 권한 동의를 허용해주셔야 \n이미지 이용이 가능합니다. \n원할한 서비스 이용을 위해 권한을 \n허용해주세요 :)"),
            buttonText: const Text(
              "설정창으로 이동",
              style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
            ),
            onButtonPressed: () {
              openAppSettings();
              Navigator.of(context).pop();
            },
          );
        },
      );*/
    }

    return status;
  }

  static Future<PermissionStatus> checkAndroidPhotosPermission() async {
    DeviceInfoPlugin plugin = DeviceInfoPlugin();
    AndroidDeviceInfo android = await plugin.androidInfo;
    if (android.version.sdkInt < 33) {
      return await Permission.storage.request();
    } else {
      return await Permission.photos.request();
    }
  }
}
