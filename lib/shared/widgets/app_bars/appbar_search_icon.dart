import 'package:qcb/shared/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppBarSearchIcon extends StatelessWidget {
  AppBarSearchIcon({Key? key, required this.onTap, this.showDropDown = false}) : super(key: key);
  bool showDropDown;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(40),
      highlightColor: AppColors.appBarColor,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(color: AppColors.grey.withAlpha(100)),
        ),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        width: 50,
        child: Icon(showDropDown ? Icons.arrow_drop_down : Icons.search, color: AppColors.babyBlue),
      ),
    );
  }
}
