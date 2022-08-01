import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:qcb/landing/src/screens/home/models/models.imports.dart';
import 'package:qcb/landing/src/screens/terms_and_conditions/blocs/privacy_and_terms_cubit.dart';
import 'package:qcb/landing/src/shared/models/privacy_and_terms_model.dart';
import 'package:qcb/shared/infrastructure/tracking/app_center/app_center_event.dart';
import 'package:qcb/shared/services/language/localization_helpers.dart';
import 'package:qcb/shared/utilities/loading_dialog.dart';
import 'package:qcb/shared/widgets/app_bars/default_appbar.dart';
import 'package:qcb/shared/widgets/base/app_center_base_widget.dart';
import 'package:qcb/shared/widgets/form_builder/app_text.dart';

part 'privacy_policy.dart';

part 'privacy_policy_data.dart';
