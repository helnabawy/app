import 'package:firebase_core/firebase_core.dart';
import 'package:qcb/firebase_options.dart';

abstract class PushNotificationInitializer {
  static init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }
}
