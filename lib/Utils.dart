import 'package:flutter/material.dart';
import 'package:device_info_plus/device_info_plus.dart';

Future<String?> getDeviceId(BuildContext context) async {
  DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String? deviceId = '';

  try {
    if (Theme.of(context).platform == TargetPlatform.android) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id;
    } else if (Theme.of(context).platform == TargetPlatform.iOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor;
    }else if (Theme.of(context).platform == TargetPlatform.linux ||
        Theme.of(context).platform == TargetPlatform.macOS ||
        Theme.of(context).platform == TargetPlatform.windows) {
      // Information specific to Linux, macOS, and Windows
      print('Operating System: ${Theme.of(context).platform}');
      // Additional information can vary depending on the platform
    }
  } catch (e) {
    print('Error fetching device ID: $e');
  }
  print(deviceId);
  return deviceId;
}