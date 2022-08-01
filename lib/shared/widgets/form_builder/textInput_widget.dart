import 'package:flutter/material.dart';
import 'package:qcb/shared/constants/app_colors.dart';

class TextInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hintTxt;
  TextInputWidget({required this.controller, required this.hintTxt});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: 15,
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
          border: const OutlineInputBorder(),
          counterText: '',
          hintStyle: const TextStyle(fontSize: 12.0, color: AppColors.grey),
          hintText: hintTxt),
      validator: (val) {
        return null;
        // RegExp regex = new RegExp(r'^[0-9]+$');
        // if (!regex.hasMatch(val!)) {
        //   return '${tr(context, "Please_enter")} ${tr(context, "invoice_number")}';
        // }
        // return null;
      },
      onChanged: (value) {},
      keyboardType: TextInputType.number,
    );
  }
}
