import 'package:flutter/material.dart';

class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
