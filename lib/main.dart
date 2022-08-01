import 'package:eraser/eraser.dart';
import 'package:qcb/shared/app/app.imports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:qcb/shared/app/app_flavor.model.dart';
import 'package:qcb/shared/app/app_life_cycle_manager.dart';
import 'package:qcb/shared/app/environments/app_environment.dart';
import 'package:qcb/shared/infrastructure/push_notification/push_notification_initializer.dart';
import 'package:qcb/shared/infrastructure/tracking/app_center/app_center_initializer.dart';
import 'package:qcb/shared/utilities/storage/app_storage.dart';

main({AppFlavor flavor = testingFlavor}) async {
  WidgetsFlutterBinding.ensureInitialized();

  await PushNotificationInitializer.init();
  await AppStorage.init();

  AppCenterInitializer.init();

  AppEnvironment().setEnvironment(target: flavor.target, version: flavor.version);

  runApp(Phoenix(child: AppLifeCycleManager(child: QCBApp())));

  Eraser.clearAllAppNotifications();
}
