import 'package:flutter/material.dart';

class BaseStatefulWidget extends StatefulWidget {
  const BaseStatefulWidget({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  State<BaseStatefulWidget> createState() => _BaseStatefulWidgetState();
}

class _BaseStatefulWidgetState extends State<BaseStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
