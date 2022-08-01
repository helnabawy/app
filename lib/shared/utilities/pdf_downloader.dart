import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:qcb/shared/enums/app_center_exceptions.dart';
import 'package:qcb/shared/utilities/exception_logger.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class PdfDownloader {
  static bool isFolderCreated = false;
  static Directory? directory;

  static checkDocumentFolder(BuildContext context) async {
    try {
      if (!isFolderCreated) {
        directory = await getApplicationDocumentsDirectory();
        await directory!.exists().then((value) {
          if (value) directory!.create();
          isFolderCreated = true;
        });
      }
    } catch (e) {
      ExceptionLogger.logException(
          context: context,
          appCenterEvent: AppCenterExceptions.appServicesGetAdditionalDataError,
          exception: e.toString());
    }
  }

  static Future<File> convertBytesToPdf({required List<int> pdfBytes}) async {
    final Directory? appDir =
        Platform.isAndroid ? await getExternalStorageDirectory() : await getApplicationDocumentsDirectory();
    String tempPath = appDir!.path;
    final String fileName = DateTime.now().microsecondsSinceEpoch.toString() + '-' + 'akt.pdf';
    File file = File('$tempPath/$fileName');
    if (!await file.exists()) {
      await file.create();
    }
    await file.writeAsBytes(pdfBytes);
    OpenFile.open(file.path);
    return file;
  }

  static Future<File> convertBase64ToPdf(
      {required String value, String? fileName, required BuildContext context}) async {
    final base64str = value;
    Uint8List bytes = base64.decode(base64str);
    await checkDocumentFolder(context);
    DateTime now = DateTime.now();
    String dir = directory!.path + (fileName ?? '/document_${now.millisecondsSinceEpoch}.pdf');
    File file = File(dir);
    if (!file.existsSync()) {
      file.create();
    }
    await file.writeAsBytes(bytes);
    OpenFile.open(dir);
    return file;
  }
}
