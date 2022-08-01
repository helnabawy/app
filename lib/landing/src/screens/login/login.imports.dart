import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:qcb/landing/src/screens/login/models/login_repo.dart';
import 'package:qcb/shared/app/routers/router.imports.gr.dart';
import 'package:qcb/shared/constants/app_colors.dart';
import 'package:qcb/shared/infrastructure/blocs/generic_cubit/generic_cubit.dart';
import 'package:qcb/shared/infrastructure/blocs/user_cubit/user_cubit.dart';
import 'package:qcb/shared/infrastructure/tracking/app_center/app_center_event.dart';
import 'package:qcb/shared/infrastructure/tracking/app_center/app_center_track_event.dart';
import 'package:qcb/shared/models/auth_model.dart';
import 'package:qcb/shared/models/user.model.dart';
import 'package:qcb/shared/services/app_config/app_config.dart';
import 'package:qcb/shared/services/language/localization_helpers.dart';
import 'package:qcb/shared/services/oauth/oauth_service.dart';
import 'package:qcb/shared/utilities/loading_dialog.dart';
import 'package:qcb/shared/utilities/storage/app_storage.dart';
import 'package:qcb/shared/utilities/storage/preferences_keys.enum.dart';
import 'package:qcb/shared/widgets/app_bars/default_appbar.dart';
import 'package:qcb/shared/widgets/base/app_center_base_widget.dart';
import 'package:qcb/shared/widgets/common/no_result.dart';

part 'login_data.dart';

part 'login_screen.dart';
