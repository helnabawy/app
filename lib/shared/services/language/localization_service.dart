import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'localization_helpers.dart';

class LocalizationService {
  static Map<String, String> _localizedValues = {};

  late final Locale locale;
  LocalizationService(this.locale);

  static late BuildContext context;
  static setContext(BuildContext ctx) => context = ctx;

  static LocalizationService? of() => Localizations.of<LocalizationService>(context, LocalizationService);
  static const LocalizationsDelegate<LocalizationService> localizationsDelegate = _GetLocalizationDelegate();

  Future load() async {
    List<String> jsonStringValues = await Future.wait(
      localizationPaths.map((path) async => await rootBundle.loadString('$path${locale.languageCode}.json')),
    );

    for (final jsonString in jsonStringValues) {
      final jsonMap = json.decode(jsonString).map((key, value) => MapEntry(key, value.toString()));
      _localizedValues = {..._localizedValues, ...jsonMap};
    }
  }

  static String getTranslateValue(String key) => _localizedValues[key] ?? key;
}

class _GetLocalizationDelegate extends LocalizationsDelegate<LocalizationService> {
  const _GetLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<LocalizationService> load(Locale locale) async {
    LocalizationService localization = LocalizationService(locale);
    await localization.load();
    return localization;
  }

  @override
  bool shouldReload(LocalizationsDelegate<LocalizationService> old) => false;
}
