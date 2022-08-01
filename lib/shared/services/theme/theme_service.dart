import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qcb/shared/infrastructure/blocs/theme_cubit/theme_cubit.dart';
import 'package:qcb/shared/utilities/storage/app_storage.dart';
import 'package:qcb/shared/utilities/storage/preferences_keys.enum.dart';

class ThemeService {
  ThemeService._();

  static changeTheme({required BuildContext context, required bool makeDark}) {
    final themeCubit = context.read<ThemeCubit>();
    themeCubit.toggleTheme(theme: makeDark != false ? ThemeMode.dark : ThemeMode.light);

    AppStorage.preferences.setBool(PreferencesKeys.darkTheme.name, makeDark);
  }
}
