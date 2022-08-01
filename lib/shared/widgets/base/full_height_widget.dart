import 'package:flutter/material.dart';
import 'dart:ui';

/// This widget intended to use in case of
///
/// [Take the remainig screen height of screen]
///
/// execluding [Appbar Height] and [StatusBar Height]
class FullHeight extends StatelessWidget {
  final Widget child;
  num subtractHeight;
  FullHeight({Key? key, required this.child, this.subtractHeight = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context),
        topPadding = kToolbarHeight + MediaQueryData.fromWindow(window).padding.top;
    return Container(height: mediaQuery.size.height - (topPadding + subtractHeight), child: child);
  }
}
