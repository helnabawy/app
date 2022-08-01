import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qcb/shared/infrastructure/blocs/lang_cubit/lang_cubit.dart';
import 'package:tf_custom_widgets/tf_custom_widgets.dart';

class LanguageService {
  static void changeLanguage(String lang, BuildContext context) {
    WidgetUtils.lang = lang;
    context.read<LangCubit>().onUpdateLanguage(lang);
  }
}
