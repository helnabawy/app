import 'package:flutter/material.dart';
import 'package:qcb/shared/constants/app_colors.dart';
import 'package:qcb/shared/widgets/common/no_result.dart';

class NoResultPlaceHolder extends StatelessWidget {
  final String text;

  const NoResultPlaceHolder({this.text = 'no_data_to_be_shown'});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(border: Border.all(color: AppColors.greyWhite)),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height - 450,
        child: NoResult(text: text));
  }
}
