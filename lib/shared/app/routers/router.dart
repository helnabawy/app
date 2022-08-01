part of 'router.imports.dart';

@AdaptiveAutoRouter(
  routes: <AutoRoute>[
    ...LandingRoutes.routes,
    ...SharedRoutes.routes,
  ],
)
class $AppRouter {}
