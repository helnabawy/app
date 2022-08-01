import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qcb/landing/src/screens/faqs/blocs/faq_category/faq_category_cubit.dart';
import 'package:qcb/shared/infrastructure/blocs/generic_cubit/generic_cubit.dart';
import 'package:qcb/shared/infrastructure/tracking/app_center/app_center_event.dart';
import 'package:qcb/shared/services/language/localization_helpers.dart';
import 'package:qcb/shared/widgets/app_bars/search_app_bar.dart';
import 'package:qcb/shared/widgets/base/app_center_base_widget.dart';
import 'package:qcb/shared/widgets/common/general.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'blocs/faq/faq_cubit.dart';
import 'models/faq_category.dart';
import 'models/models.imports.dart';
import 'widgets/faq_widgets.imports.dart';

part 'faq_data.dart';
part 'faq_screen.dart';
