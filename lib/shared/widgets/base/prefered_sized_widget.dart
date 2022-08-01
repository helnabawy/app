import 'package:flutter/material.dart';

class PreferredSizedWidget extends StatelessWidget implements PreferredSizeWidget {
  PreferredSizedWidget({
    Key? key,
    required this.child,
    required this.height,
  }) : super(key: key);

  final Widget child;
  final double height;

  @override
  Widget build(BuildContext context) => child;

  @override
  Size get preferredSize => Size.fromHeight(height);
}
