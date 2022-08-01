import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qcb/shared/infrastructure/network/http_client_handler.dart';
import 'package:qcb/shared/infrastructure/network/network.imports.dart';
import 'package:qcb/shared/infrastructure/tracking/app_center/app_center_event_enum_base.dart';
import 'package:qcb/shared/infrastructure/tracking/app_center/app_center_track_event.dart';
import 'package:qcb/shared/models/error_response.dart';
import 'package:qcb/shared/utilities/loading_dialog.dart';
import 'package:qcb/shared/utilities/storage/app_storage.dart';
import 'package:qcb/shared/utilities/storage/preferences_keys.enum.dart';
import 'package:tf_dio_cache/dio_http_cache.dart';

part 'dio_client.dart';
