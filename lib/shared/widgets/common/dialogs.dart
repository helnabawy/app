import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qcb/shared/constants/app_colors.dart';
import 'package:qcb/shared/services/language/localization_helpers.dart';
import 'package:qcb/shared/utilities/loading_dialog.dart';
import 'package:qcb/shared/widgets/form_builder/app_text.dart';
import 'package:qcb/shared/widgets/form_builder/otp_dialog/otp_dialog.imports.dart';

class Dialogs {
  static Future<void> showErrorDialog(
      {required BuildContext context, required String error, VoidCallback? callBack, String? callBackTitle}) {
    AlertDialog dialog = AlertDialog(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13.0))),
        contentPadding: const EdgeInsets.all(16),
        content: Container(
          height: 130,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AppText(
                      title: error,
                      lineHeight: 1.5,
                      size: 10.0,
                    ),
                  ),
                ),
              ),
              Divider(color: AppColors.greyWhite),
              Row(
                mainAxisAlignment: callBackTitle != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () => AutoRouter.of(context).pop(),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        margin: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: AppText.bold(translate('cancel'))..align = TextAlign.center,
                      ),
                    ),
                  ),
                  callBackTitle != null
                      ? Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            margin: const EdgeInsets.symmetric(horizontal: 10.0),
                            child: InkWell(
                              onTap: callBack!,
                              child: AppText.primary(callBackTitle)..align = TextAlign.center,
                            ),
                          ),
                        )
                      : Container()
                ],
              )
            ],
          ),
        ),
        elevation: 5);

    return showDialog(context: context, builder: (_) => dialog);
  }

  static showLoadingDialog({required BuildContext context}) {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return LoadingDialog.showLoadingView();
        });
  }

  Future<void> showLogoutDialog(BuildContext context, VoidCallback onLogout) {
    AlertDialog dialog = AlertDialog(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        contentPadding: EdgeInsets.zero,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: AppText.smallBold(translate('logout')),
        ),
        content: Container(
          color: Theme.of(context).appBarTheme.backgroundColor,
          height: 140,
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: AppText.smallSpaced(translate('r_u_sure_logout')),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: AppColors.secondary,
                      child: TextButton(
                        onPressed: onLogout,
                        child: AppText.whiteSmall(translate('logout')),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: TextButton(
                        onPressed: () => AutoRouter.of(context).pop(),
                        child: AppText.redSmall(translate('cancel')),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        elevation: 5);

    return showDialog(context: context, builder: (_) => dialog);
  }

  static Future<void> showUpdateDialog(BuildContext context, VoidCallback onLogout, bool forceUpdate) {
    final isUpdateDismissible = forceUpdate != true;
    AlertDialog dialog = AlertDialog(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        contentPadding: EdgeInsets.zero,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: AppText.smallBold(translate('update_app_title')),
        ),
        content: Container(
          color: Theme.of(context).appBarTheme.backgroundColor,
          height: 140,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: AppText.smallSpaced(translate('update_app_message')),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Container(
                        color: AppColors.secondary,
                        child: TextButton(
                          onPressed: onLogout,
                          child: AppText.whiteSmall(translate('update')),
                        )),
                  ),
                  if (isUpdateDismissible)
                    Expanded(
                      child: Container(
                        color: Colors.white,
                        child: TextButton(
                          onPressed: () => AutoRouter.of(context).pop(),
                          child: AppText.redSmall(translate('cancel')),
                        ),
                      ),
                    )
                ],
              )
            ],
          ),
        ),
        elevation: 5);

    return showDialog(context: context, builder: (_) => dialog, barrierDismissible: isUpdateDismissible);
  }

  static openBottomSheet({required BuildContext context, required Widget child, Color backgroundColor = Colors.white}) {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: backgroundColor,
      context: context,
      builder: (context) => Container(
        height: 320,
        child: child,
      ),
    );
  }

  static showCustomBottomSheetDialog({required BuildContext context, required Widget child}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: child,
      ),
    );
  }

  static showOtpDialog(
      {required BuildContext context,
      required Function(String) successCallBack,
      required Function resendCallBack,
      required Duration otpValidationDuration,
      required int inputsCount,
      String? dialogTitle,
      String? headerMessage,
      String? activeTimerMessage,
      String? errorInputsMessage,
      String? errorTimerMessage,
      String? submitButtonLabel,
      String? resendButtonLabel}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 360,
          child: OtpDialog(
            otpValidationDuration: otpValidationDuration,
            resendCallBack: resendCallBack,
            successCallBack: successCallBack,
            inputsCount: inputsCount,
            activeTimerMessage: activeTimerMessage,
            dialogTitle: dialogTitle,
            errorInputsMessage: errorInputsMessage,
            errorTimerMessage: errorTimerMessage,
            headerMessage: headerMessage,
            resendButtonLabel: resendButtonLabel,
            submitButtonLabel: submitButtonLabel,
          ),
        ),
      ),
    );
  }
}
