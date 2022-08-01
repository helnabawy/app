import 'dart:io' show Directory, File, Platform;
import 'package:qcb/shared/models/ionic_micro_app.dart';
import 'package:qcb/shared/constants/app_constants.dart';
import 'package:path_provider/path_provider.dart';

class IonicMicroAppStorage {
  static String documentsDirectoryPath = '';

  final IonicMicroApp microApp;

  IonicMicroAppStorage({required this.microApp}) {
    if (IonicMicroAppStorage.documentsDirectoryPath.isEmpty) {
      getDocumentsDirectory();
    }
  }

  String get zipPath => IonicMicroAppStorage.documentsDirectoryPath + microApp.directoryName + '.zip';
  String get directoryPath =>
      IonicMicroAppStorage.documentsDirectoryPath + '/${AppConstants.microAppsDirectory}' + microApp.directoryName;

  Future<Directory> getDocumentsDirectory() async {
    Directory? directory;
    if (Platform.isIOS) {
      directory = await getApplicationDocumentsDirectory();
    } else {
      directory = await getExternalStorageDirectory();
    }
    IonicMicroAppStorage.documentsDirectoryPath = directory!.path;
    return directory;
  }

  bool get isZipFileExists => File(zipPath).existsSync();

  bool get isDownloadDirectoryExists => Directory(directoryPath).existsSync();
}
