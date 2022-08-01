import 'package:flutter/material.dart';
import 'package:qcb/shared/app/app.imports.dart';
import 'package:qcb/shared/constants/app_colors.dart';
import 'package:qcb/shared/widgets/form_builder/app_text.dart';

class ColoredSideCard extends StatelessWidget {
  final String text;
  final Color textColor;
  Color borderColor;
  Widget? widget;

  ColoredSideCard({required this.text, this.textColor = AppColors.red, this.borderColor = AppColors.red, this.widget});

  factory ColoredSideCard.purpleIcon({required String text}) {
    return ColoredSideCard.icon(text: text, textColor: AppColors.purple, borderColor: AppColors.purple);
  }

  factory ColoredSideCard.icon({required String text, required Color textColor, required Color borderColor}) {
    final widget = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(Icons.info, color: textColor),
        const SizedBox(width: 12),
        Expanded(child: AppText(title: text, color: textColor, size: AppSizes.small, align: TextAlign.justify))
      ],
    );
    return ColoredSideCard(text: text, widget: widget, textColor: textColor, borderColor: borderColor);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 5,
      child: ClipPath(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: widget ?? AppText(size: 12.0, color: textColor, title: text),
          decoration: BoxDecoration(
            border: Border(right: BorderSide(color: borderColor, width: 5)),
          ),
        ),
        clipper: ShapeBorderClipper(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3))),
      ),
    );
  }
}
