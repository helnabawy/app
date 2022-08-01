import 'package:flutter/material.dart';
import 'package:qcb/shared/widgets/common/general.dart';

class TitledInput extends StatelessWidget {
  final Widget input;
  final Widget title;

  TitledInput({required this.input, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        General.sizeBoxVertical(15.0),
        title,
        General.sizeBoxVertical(7.0),
        input,
      ],
    );
  }
}
