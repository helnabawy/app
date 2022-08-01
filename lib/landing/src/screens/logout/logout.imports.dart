import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:qcb/landing/src/screens/logout/models/logout_repo.dart';
import 'package:qcb/shared/app/routers/router.imports.gr.dart';
import 'package:qcb/shared/infrastructure/blocs/generic_cubit/generic_cubit.dart';
import 'package:qcb/shared/services/user/user_service.dart';
import 'package:qcb/shared/utilities/loading_dialog.dart';
import 'package:qcb/shared/utilities/storage/app_storage.dart';
import 'package:qcb/shared/utilities/storage/preferences_keys.enum.dart';
import 'package:qcb/shared/widgets/common/no_result.dart';

part 'logout_data.dart';

part 'logout_screen.dart';
