import 'package:flutter/material.dart';
import 'package:qcb/shared/app/app.imports.dart';
import 'package:qcb/shared/widgets/base/prefered_sized_widget.dart';
import 'package:qcb/shared/widgets/form_builder/app_text.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  final List<Widget> actions;
  final double? size;
  final Color? bgColor;
  final Widget? bottom;
  final Color? backButtonColor;
  final Color? titleColor;
  final double? bottomHeight;
  final bool hideBackButton;

  DefaultAppBar(
      {required this.title,
      this.actions = const [],
      this.leading,
      this.size,
      this.bottomHeight,
      this.bottom,
      this.titleColor,
      this.backButtonColor,
      this.bgColor,
      this.hideBackButton = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppText.largeBold(title)..color = titleColor ?? Theme.of(context).colorScheme.onSurface,
      centerTitle: false,
      backgroundColor: bgColor ?? Theme.of(context).appBarTheme.backgroundColor,
      elevation: 0,
      toolbarHeight: 200.0,
      leadingWidth: hideBackButton ? 0 : null,
      leading: hideBackButton
          ? const SizedBox()
          : leading ??
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: backButtonColor ?? Theme.of(context).colorScheme.onSurface,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
      actions: actions,
      bottom: PreferredSizedWidget(child: bottom ?? const SizedBox(), height: bottomHeight ?? preferredSize.height),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(size ?? AppThemes.appBarHeight);
}
