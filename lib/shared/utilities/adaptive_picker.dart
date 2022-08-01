import 'dart:io';

import 'package:qcb/shared/constants/app_colors.dart';
import 'package:qcb/shared/widgets/form_builder/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:qcb/shared/services/language/localization_helpers.dart';

class AdaptivePicker {
  static datePicker(
      {required BuildContext context,
      required Function(DateTime? date) onConfirm,
      required String title,
      DateTime? initial,
      DateTime? minDate}) async {
    _androidDatePicker(context, onConfirm, initial: initial, minDate: minDate);
  }

  static _androidDatePicker(BuildContext context, Function(DateTime? date) onConfirm,
      {DateTime? initial, DateTime? minDate}) {
    showRoundedDatePicker(
        context: context,
        initialDate: initial ?? DateTime.now(),
        firstDate: minDate ?? DateTime.now().add(const Duration(days: -1)),
        lastDate: DateTime(2050),
        borderRadius: 16,
        height: 300,
        theme: ThemeData(
          primaryColor: AppColors.primary,
          primarySwatch: AppColors.grey,
          backgroundColor: AppColors.white,
          buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.black),
        )).then(onConfirm);
  }

  static Widget cupertinoDatePicker(BuildContext context, Function(DateTime? date) onConfirm, String title,
      {DateTime? initial, DateTime? minDate}) {
    DateTime _date = DateTime.now();
    return Container(
      height: 260,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.bold(title),
                ElevatedButton(
                  onPressed: () {
                    onConfirm(_date);
                    Navigator.of(context).pop();
                  },
                  child: AppText.primary(translate('done')),
                  style: ElevatedButton.styleFrom(elevation: 0, primary: AppColors.white),
                ),
              ],
            ),
          ),
          Flexible(
            child: CupertinoDatePicker(
              initialDateTime: initial ?? DateTime.now(),
              onDateTimeChanged: (date) {
                _date = date;
              },
              minimumDate: minDate ?? DateTime.now().add(const Duration(days: -1)),
              mode: CupertinoDatePickerMode.date,
            ),
          ),
        ],
      ),
    );
  }

  static timePicker(
      {required BuildContext context, required String title, required Function(DateTime? date) onConfirm}) async {
    if (Platform.isIOS) {
      _iosTimePicker(context, title, onConfirm);
    } else {
      _androidTimePicker(context, onConfirm);
    }
  }

  static _androidTimePicker(BuildContext context, Function(DateTime date) onConfirm) {
    var now = DateTime.now();
    showRoundedTimePicker(
      context: context,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        backgroundColor: AppColors.white,
        buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppColors.black),
      ),
      initialTime: TimeOfDay.now(),
    ).then((time) => onConfirm(DateTime(now.year, now.month, now.day, time!.hour, time.minute)));
  }

  static _iosTimePicker(BuildContext context, String title, Function(DateTime? date) onConfirm) {
    _bottomSheet(
      context: context,
      child: cupertinoTimePicker(context, title, onConfirm),
    );
  }

  static Widget cupertinoTimePicker(BuildContext context, String title, Function(DateTime? date) onConfirm) {
    DateTime _date = DateTime.now();
    return Container(
      height: 260,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText.bold(title),
                SizedBox(
                  height: 20,
                  child: ElevatedButton(
                    onPressed: () {
                      onConfirm(_date);
                      Navigator.of(context).pop();
                    },
                    child: AppText.primary(translate('done')),
                    style: ElevatedButton.styleFrom(elevation: 0, primary: AppColors.white),
                  ),
                )
              ],
            ),
          ),
          Flexible(
              child: CupertinoDatePicker(
            onDateTimeChanged: (date) {
              _date = date;
            },
            mode: CupertinoDatePickerMode.time,
          )),
        ],
      ),
    );
  }

  static _bottomSheet({required BuildContext context, required Widget child}) {
    return showModalBottomSheet(
      isScrollControlled: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(13),
          topRight: Radius.circular(13),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (context) => Container(
        height: 320,
        child: child,
      ),
    );
  }
}
