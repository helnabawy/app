import 'package:qcb/shared/services/language/localization_helpers.dart';

extension NumberExtensions on num {
  String get currency => '$this ${translate('sar')}';
}
