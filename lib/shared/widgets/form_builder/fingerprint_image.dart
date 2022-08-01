import 'package:flutter/material.dart';
import 'package:qcb/shared/constants/resources.dart';

class FingerPrintImage extends StatelessWidget {
  const FingerPrintImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Image.asset(Resources.fingerPrintGold, width: 178),
    );
  }
}
