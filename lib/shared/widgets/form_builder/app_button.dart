import 'package:flutter/material.dart';
import 'package:qcb/shared/constants/app_colors.dart';
import 'package:qcb/shared/constants/resources.dart';
import 'package:qcb/shared/widgets/form_builder/app_text.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Widget? customWidget;

  AppButton({required this.title, required this.onPressed, this.customWidget});

  factory AppButton.outlined(title, onPressed) => AppButton(title: title, onPressed: onPressed);

  factory AppButton.outlinedPrimary(title, onPressed) => AppButton(title: title, onPressed: onPressed);

  factory AppButton.outlinedSecondary(title, onPressed) => AppButton(title: title, onPressed: onPressed);

  factory AppButton.outlinedLight(title, onPressed) => AppButton(title: title, onPressed: onPressed);

  factory AppButton.block(title, onPressed) => AppButton(title: title, onPressed: onPressed);

  factory AppButton.blockPrimary(title, onPressed, {width, height}) {
    final customWidget = InkWell(
      onTap: onPressed,
      child: Container(
          width: width,
          alignment: Alignment.center,
          decoration: const BoxDecoration(color: AppColors.primary),
          padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10, end: 16, start: 16),
          child: AppText.white(title)),
    );
    return AppButton(title: title, onPressed: onPressed, customWidget: customWidget);
  }

  factory AppButton.blockDisabled(title, onPressed, {width, height}) {
    final customWidget = Opacity(
      opacity: 0.4,
      child: Container(
          width: width,
          alignment: Alignment.center,
          decoration: const BoxDecoration(color: AppColors.grey),
          padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10, end: 16, start: 16),
          child: AppText.white(title)),
    );
    return AppButton(title: title, onPressed: onPressed, customWidget: customWidget);
  }

  factory AppButton.blockSecondary(title, onPressed) => AppButton(title: title, onPressed: onPressed);

  factory AppButton.blockLight(title, onPressed) => AppButton(title: title, onPressed: onPressed);

  factory AppButton.fit(title, onPressed) => AppButton(title: title, onPressed: onPressed);

  factory AppButton.fitPrimary(title, onPressed) => AppButton(title: title, onPressed: onPressed);

  factory AppButton.fitSecondary(title, onPressed) => AppButton(title: title, onPressed: onPressed);

  factory AppButton.fitLight(title, onPressed) => AppButton(title: title, onPressed: onPressed);

  factory AppButton.icon(Icon icon, title, onPressed, {double width = 160}) {
    final customWidget = InkWell(
        onTap: onPressed,
        child: Ink(
            decoration: const BoxDecoration(color: AppColors.primary),
            child: Container(
                constraints: const BoxConstraints(maxHeight: 60),
                padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10, end: 16, start: 30),
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [AppText.white(title), icon],
                ))));
    return AppButton(title: title, onPressed: onPressed, customWidget: customWidget);
  }

  factory AppButton.submit(title, onPressed) {
    return AppButton.icon(const Icon(Icons.arrow_forward, color: Colors.white), title, onPressed);
  }

  factory AppButton.download(title, onPressed, {double width = 160}) {
    return AppButton.icon(const Icon(Icons.arrow_circle_down, color: Colors.white), title, onPressed, width: width);
  }

  factory AppButton.biometric({required VoidCallback onPressed}) {
    final customWidget = IconButton(
        padding: EdgeInsets.zero,
        iconSize: 50.0,
        onPressed: onPressed,
        icon: Image.asset(
          Resources.fingerPrint,
          color: AppColors.primary,
        ));

    return AppButton(title: '', onPressed: () {}, customWidget: customWidget);
  }

  @override
  Widget build(BuildContext context) {
    return customWidget == null
        ? MaterialButton(
            onPressed: onPressed,
            child: AppText.normal(title),
          )
        : customWidget!;
  }

  factory AppButton.green(title, onPressed) {
    final customWidget = InkWell(
        onTap: onPressed,
        child: Container(
            decoration: BoxDecoration(color: AppColors.green, borderRadius: BorderRadius.circular(5)),
            constraints: const BoxConstraints(maxHeight: 60),
            padding: const EdgeInsetsDirectional.only(top: 10, bottom: 10, end: 16, start: 16),
            child: AppText.white(title)));
    return AppButton(title: title, onPressed: onPressed, customWidget: customWidget);
  }
}
