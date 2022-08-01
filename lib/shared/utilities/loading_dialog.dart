import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:qcb/shared/constants/app_colors.dart';
import 'package:qcb/shared/services/language/localization_helpers.dart';

class LoadingDialog {
  static showLoadingDialog() {
    EasyLoading.instance
      ..backgroundColor = AppColors.transparent
      ..indicatorColor = AppColors.primary
      ..textColor = AppColors.black
      ..indicatorWidget = showLoadingView()
      ..dismissOnTap = false
      ..boxShadow = []
      ..loadingStyle = EasyLoadingStyle.custom;
    EasyLoading.show(status: translate('loading'), maskType: EasyLoadingMaskType.black);
  }

  static dismissDialog() {
    EasyLoading.dismiss();
  }

  static showLoadingView({Color? color}) {
    return Center(
      child: SpinKitCubeGrid(
        color: color ?? AppColors.primary,
        size: 40.0,
      ),
    );
  }
}
