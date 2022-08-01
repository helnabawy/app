import 'package:flutter/material.dart';
import 'package:qcb/shared/constants/app_colors.dart';
import 'package:qcb/shared/widgets/form_builder/fingerprint_image.dart';
import 'package:qcb/shared/widgets/form_builder/app_button.dart';

class SubmitSection extends StatelessWidget {
  final Function submitCallBack;
  final String submitButtonText;

  const SubmitSection({Key? key, required this.submitButtonText, required this.submitCallBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: AppColors.primary))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                  decoration: const BoxDecoration(color: AppColors.primary),
                  padding: const EdgeInsets.all(5),
                  child: AppButton.submit(submitButtonText, submitCallBack))
            ],
          ),
        ),
        const FingerPrintImage()
      ],
    );
  }
}
