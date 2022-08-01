import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qcb/shared/app/themes/font_family.dart';
import 'package:qcb/shared/constants/app_colors.dart';
import 'package:qcb/shared/constants/app_constants.dart';
import 'package:qcb/shared/infrastructure/blocs/config_cubit/config_cubit.dart';
import 'package:qcb/shared/infrastructure/blocs/internet_connection_cubit/internet_connection_cubit.dart';
import 'package:qcb/shared/infrastructure/blocs/lang_cubit/lang_cubit.dart';
import 'package:qcb/shared/infrastructure/blocs/menu_cubit/menu_cubit.dart';
import 'package:qcb/shared/infrastructure/blocs/micro_apps_cubit/micro_apps_cubit.dart';
import 'package:qcb/shared/infrastructure/blocs/theme_cubit/theme_cubit.dart';
import 'package:qcb/shared/infrastructure/blocs/user_cubit/user_cubit.dart';
import 'package:qcb/shared/infrastructure/push_notification/push_notification_handler.dart';
import 'package:qcb/shared/services/language/localization_service.dart';
import 'package:qcb/shared/services/theme/theme_service.dart';
import 'package:qcb/shared/utilities/storage/app_storage.dart';
import 'package:qcb/shared/widgets/form_builder/pin_code_dialog/bloc/pincode_bloc.dart';

import 'routers/router.imports.gr.dart';

part 'app.dart';
part 'themes/app_themes.dart';
