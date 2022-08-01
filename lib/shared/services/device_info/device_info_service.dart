import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

class DeviceInfoService {
  DeviceInfoService();

  static String? version;

  static Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    return packageInfo.version;
  }

  static String getOS() {
    return Platform.operatingSystem;
  }

  static Future<String?> getDeviceUUID() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
    return null;
  }
}
