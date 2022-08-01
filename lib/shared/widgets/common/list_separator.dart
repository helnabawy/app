import 'package:qcb/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class ListSeparator extends StatelessWidget {
  final Color color;
  const ListSeparator({Key? key, this.color = AppColors.primary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, color: color);
  }
}
