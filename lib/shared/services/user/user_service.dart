import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qcb/shared/infrastructure/blocs/user_cubit/user_cubit.dart';
import 'package:qcb/shared/models/user.model.dart';
import 'package:qcb/shared/utilities/storage/app_storage.dart';
import 'package:qcb/shared/utilities/storage/preferences_keys.enum.dart';

class UserService {
  UserService();

  static Future<void> saveUserInfo(UserModel model) async {
    AppStorage.preferences.setString(PreferencesKeys.user.name, json.encode(model.toJson()));
  }

  static UserModel? getUserInfo({required BuildContext context}) {
    return context.read<UserCubit>().state.model;
  }

  static String? getCurrentUserId({required BuildContext context}) {
    return getUserInfo(context: context)?.name;
  }

  static String? getCurrentUserSocialId({required BuildContext context}) {
    UserModel? user = getUserInfo(context: context);
    return user?.socialId;
  }

  static bool isLoggedIn({required BuildContext context}) {
    UserModel? user = getUserInfo(context: context);
    if (user?.id != null && user!.id.isNotEmpty) {
      return true;
    }
    return false;
  }

  static resetLoggedInUser({required BuildContext context}) {
    var userCubit = context.read<UserCubit>();
    userCubit.onUpdateUserData(null);
  }
}
