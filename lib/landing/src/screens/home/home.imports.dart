import 'package:auto_route/auto_route.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qcb/landing/src/screens/home/models/home_types_model.dart';
import 'package:qcb/landing/src/screens/home/models/menu_item_model.dart';
import 'package:qcb/shared/app/routers/router.imports.gr.dart';
import 'package:qcb/shared/constants/app_colors.dart';
import 'package:qcb/shared/constants/app_constants.dart';
import 'package:qcb/shared/enums/features.enum.dart';
import 'package:qcb/shared/infrastructure/blocs/config_cubit/config_cubit.dart';
import 'package:qcb/shared/infrastructure/blocs/menu_cubit/menu_cubit.dart';
import 'package:qcb/shared/infrastructure/blocs/micro_apps_cubit/micro_apps_cubit.dart';
import 'package:qcb/shared/infrastructure/blocs/theme_cubit/theme_cubit.dart';
import 'package:qcb/shared/infrastructure/network/dio/dio.imports.dart';
import 'package:qcb/shared/infrastructure/network/network.imports.dart';
import 'package:qcb/shared/infrastructure/tracking/app_center/app_center_event.dart';
import 'package:qcb/shared/models/app_config/app_config.dart';
import 'package:qcb/shared/services/app_config/app_config.dart';
import 'package:qcb/shared/services/app_service/app_service.dart';
import 'package:qcb/shared/services/device_info/device_info_service.dart';
import 'package:qcb/shared/services/language/language_service.dart';
import 'package:qcb/shared/services/language/localization_helpers.dart';
import 'package:qcb/shared/services/language/localization_service.dart';
import 'package:qcb/shared/services/oauth/oauth_service.dart';
import 'package:qcb/shared/services/theme/theme_service.dart';
import 'package:qcb/shared/utilities/extensions/context_extensions.dart';
import 'package:qcb/shared/utilities/loading_dialog.dart';
import 'package:qcb/shared/utilities/storage/app_storage.dart';
import 'package:qcb/shared/utilities/storage/preferences_keys.enum.dart';
import 'package:qcb/shared/widgets/base/feature_holder.dart';
import 'package:qcb/shared/widgets/common/dialogs.dart';
import 'package:qcb/shared/widgets/common/list_separator.dart';
import 'package:qcb/shared/widgets/form_builder/app_button.dart';
import 'package:qcb/shared/widgets/form_builder/app_text.dart';
import 'package:store_redirect/store_redirect.dart';

import 'models/models.imports.dart';
import 'widgets/home_widgets.imports.dart';

part 'home_data.dart';

part 'home_screen.dart';

part 'widgets/home_action_buttons.dart';

part 'widgets/home_content.dart';

part 'widgets/home_header.dart';

part 'widgets/home_sidemenu.dart';

part 'widgets/verification_menu_list.dart';
