import 'package:flutter/material.dart';

class ColoredTabBar extends ColoredBox implements PreferredSizeWidget {
  final Color color;
  final TabBar tabBar;
  ColoredTabBar({required this.color, required this.tabBar}) : super(color: color, child: tabBar);

  @override
  Size get preferredSize => tabBar.preferredSize;
}
