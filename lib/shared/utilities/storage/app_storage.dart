import 'dart:io';

import 'package:qcb/shared/constants/app_constants.dart';
import 'package:qcb/shared/utilities/storage/preferences_keys.enum.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStorage {
  AppStorage._();
  static final AppStorage _instance = AppStorage._();
  factory AppStorage() => _instance;

  static late SharedPreferences preferences;

  static init() async {
    preferences = await SharedPreferences.getInstance();
  }

  String appPath = '';

  Future<String> get _appPath async {
    try {
      Directory? directory;
      if (Platform.isIOS) {
        directory = await getApplicationDocumentsDirectory();
      } else {
        directory = await getExternalStorageDirectory();
      }
      appPath = directory!.path;
      return directory.path;
    } catch (e) {
      return '';
    }
  }

  Future<Directory> get microAppsDirectory async {
    final path = await _appPath;
    final _directory = Directory(path + '/' + AppConstants.microAppsDirectory);

    if (!_directory.existsSync()) {
      await _directory.create(recursive: true);
    }
    return _directory;
  }

  Future<Directory> get documentsDirectory async {
    Directory? directory;
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = await getExternalStorageDirectory();
    }
    return directory!;
  }

  static bool get isDarkThemeEnabled {
    return preferences.getBool(PreferencesKeys.darkTheme.name) ?? false;
  }
}
