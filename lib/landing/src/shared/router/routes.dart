part of 'routes.imports.dart';

class LandingRoutes {
  static const routes = [
    AdaptiveRoute(page: HomeScreen, initial: true),
    AdaptiveRoute(page: LoginScreen),
    AdaptiveRoute(page: LogoutScreen),
    AdaptiveRoute(page: FAQScreen),
    AdaptiveRoute(page: PrivacyPolicyScreen),
    AdaptiveRoute(page: TermsAndConditionsScreen),
  ];
}
