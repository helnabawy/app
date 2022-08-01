import 'localization_service.dart';

/*

List of the available localizations in the app

Limitations: you have to add the path to `pubspec.yaml` as follows:

  assets:
    - your_localization_path

*/

const localizationPaths = [
  'assets/i18n/',
  'lib/dashboard/assets/i18n/',
  'lib/landing/assets/i18n/',
  'lib/execution/assets/i18n/',
  'lib/lawsuits/assets/i18n/',
  'lib/licenses/assets/i18n/',
  'lib/verifications/assets/i18n/',
  'lib/guides/assets/i18n/',
  'lib/inquiries/assets/i18n/',
];

String translate(String key) => LocalizationService.getTranslateValue(key);
