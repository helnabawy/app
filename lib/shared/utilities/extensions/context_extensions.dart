import 'package:auto_route/auto_route.dart' show PageRouteInfo, AutoRouter;
import 'package:flutter/material.dart' show BuildContext;

extension ContextExtensions on BuildContext {
  Future push(PageRouteInfo route) => AutoRouter.of(this).push(route);
}
