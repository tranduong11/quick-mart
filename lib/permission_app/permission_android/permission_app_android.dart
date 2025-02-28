import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionAppAndroid {
  Future<void> requestPermission({required Permission permission}) async {
    final statusApp = await permission.status;
    if (statusApp.isGranted) {
      debugPrint('Quyền  duoc chap nhan!!!!!');
    } else if (statusApp.isDenied) {
      if (await permission.request().isGranted) {
        debugPrint('Duoc cap phep!!!!');
      } else {
        debugPrint('Quyen bi tu choi!!!!');
      }
    } else {
      debugPrint('Quyen bi tu choi!!!!');
    }
  }

  Future<void> requestMultiplePermission() async {
    final statusMap = await [
      Permission.microphone,
      Permission.camera,
      Platform.isIOS ? Permission.photos : Permission.storage,
      Permission.locationWhenInUse
    ].request();
    debugPrint('${statusMap[Permission.microphone]}');
    debugPrint('${statusMap[Permission.camera]}');
    debugPrint('${statusMap[Platform.isIOS ? Permission.photos : Permission.storage]}');
    debugPrint('${statusMap[Permission.locationWhenInUse]}');
  }

  Future<bool> requestPermissionWithSetting() async {
    return openAppSettings();
  }
}
