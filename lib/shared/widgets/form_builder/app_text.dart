import 'package:flutter/material.dart';
import 'package:qcb/shared/app/themes/font_family.dart';
import 'package:qcb/shared/constants/app_colors.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  final String title;
  Color? color;
  double? size;
  double? letterSpace;
  double? wordSpace;
  String? fontFamily;
  TextAlign? align;
  TextDecoration? decoration;
  TextOverflow? overflow;
  FontWeight? fontWeight;
  double? lineHeight;

  factory AppText.small(title) => AppText(title: '$title', size: 10);

  factory AppText.smallBold(title) => AppText.bold(title)..size = 10;

  factory AppText.smallSpaced(title) => AppText(title: '$title', size: 10, lineHeight: 1.6);

  factory AppText.normal(title) => AppText(title: '$title', size: 14);

  factory AppText.normalSpaced(title) => AppText(title: '$title', size: 14, lineHeight: 1.6);

  factory AppText.bold(title) => AppText.normal(title)
    ..fontWeight = FontWeight.bold
    ..fontFamily = AppFontFamily.primaryBold;

  factory AppText.large(title) => AppText(title: '$title', size: 18);

  factory AppText.largeBold(title) => AppText.large(title)..fontWeight = FontWeight.bold;

  factory AppText.primarySmall(title) => AppText.small(title)..color = AppColors.primary;

  factory AppText.primary(title) => AppText.normal(title)..color = AppColors.primary;

  factory AppText.primaryLarge(title) => AppText.large(title)..color = AppColors.primary;

  factory AppText.secondarySmall(title) => AppText.small(title)..color = AppColors.secondary;

  factory AppText.secondarySmallBold(title) => AppText.smallBold(title)..color = AppColors.secondary;

  factory AppText.secondary(title) => AppText.normal(title)..color = AppColors.secondary;

  factory AppText.secondaryLarge(title) => AppText.large(title)..color = AppColors.secondary;

  factory AppText.secondaryLargeBold(title) => AppText.largeBold(title)..color = AppColors.secondary;

  factory AppText.lightSmall(title) => AppText.small(title)..color = AppColors.grey;

  factory AppText.light(title) => AppText.normal(title)..color = AppColors.grey;

  factory AppText.lightBold(title) => AppText.bold(title)..color = AppColors.grey;

  factory AppText.lightLarge(title) => AppText.large(title)..color = AppColors.grey;

  factory AppText.whiteSmall(title) => AppText.small(title)..color = AppColors.white;

  factory AppText.white(title) => AppText.normal(title)..color = AppColors.white;

  factory AppText.whiteLarge(title) => AppText.large(title)..color = AppColors.white;

  factory AppText.redSmall(title) => AppText.small(title)..color = AppColors.red;

  factory AppText.red(title) => AppText.normal(title)..color = AppColors.red;

  factory AppText.redLarge(title) => AppText.large(title)..color = AppColors.red;

  factory AppText.successSmall(title) => AppText.small(title)..color = AppColors.success;

  factory AppText.success(title) => AppText.normal(title)..color = AppColors.success;

  factory AppText.successBold(title) => AppText.bold(title)..color = AppColors.success;

  factory AppText.successLarge(title) => AppText.large(title)..color = AppColors.success;

  factory AppText.successLargeBold(title) => AppText.largeBold(title)..color = AppColors.success;

  factory AppText.babyBluesSmall(title) => AppText.small(title)..color = AppColors.babyBlue;

  factory AppText.babyBlue(title) => AppText.normal(title)..color = AppColors.babyBlue;

  factory AppText.babyBlueBold(title) => AppText.bold(title)..color = AppColors.babyBlue;

  factory AppText.babyBlueLargeBold(title) => AppText.largeBold(title)..color = AppColors.babyBlue;

  factory AppText.notifyColor(title) => AppText.normal(title)..color = AppColors.notifyColor;

  factory AppText.phoneTile(title) => AppText.normal(title)
    ..color = AppColors.babyBlue
    ..decoration = TextDecoration.underline;

  static Widget expansionTile(title) => Text('$title', style: const TextStyle(fontSize: 24));

  AppText(
      {required this.title,
      this.color,
      this.size,
      this.align,
      this.fontFamily,
      this.decoration,
      this.letterSpace,
      this.wordSpace,
      this.overflow,
      this.lineHeight,
      this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return Text(title,
        textAlign: align ?? TextAlign.start,
        textScaleFactor: 1.2,
        style: TextStyle(
          color: color ?? Theme.of(context).colorScheme.onSurface,
          fontSize: size ?? 14,
          letterSpacing: letterSpace,
          wordSpacing: wordSpace,
          height: lineHeight,
          decoration: decoration ?? TextDecoration.none,
          fontWeight: fontWeight ?? FontWeight.normal,
          fontFamily: fontFamily ?? DefaultTextStyle.of(context).style.fontFamily,
          overflow: overflow,
        ));
  }
}
