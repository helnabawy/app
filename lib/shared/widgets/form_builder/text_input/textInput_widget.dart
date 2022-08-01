import 'package:flutter/material.dart';
import 'package:qcb/shared/constants/app_colors.dart';

class TextInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final String? hintTxt;
  final String? Function(String?)? validator;
  TextInputWidget({required this.controller, required this.hintTxt, this.validator});

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
      validator: validator,
      onChanged: (value) {},
      keyboardType: TextInputType.number,
    );
  }
}
