part of '../home.imports.dart';

class HomeSideMenu extends StatelessWidget {
  HomeSideMenu({Key? key}) : super(key: key);
  final sideMenuItems = [
    _SideMenuItem(translate('faq'), const FAQScreenRoute()),
    _SideMenuItem(translate('terms_conditions'), const TermsAndConditionsScreenRoute()),
    _SideMenuItem(translate('privacy_policy'), const PrivacyPolicyScreenRoute()),
    _SideMenuItem(translate('najiz_partners'), const PartnersScreenRoute()),
    _SideMenuItem(translate('change_theme'), null),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: <Widget>[
        Container(
          constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.8),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: sideMenuItems.length,
            separatorBuilder: (_, __) => const ListSeparator(),
            itemBuilder: (ctx, index) => _buildDrawerItem(context, index),
          ),
        )
      ]),
    );
  }

  Widget _buildDrawerItem(BuildContext context, int index) {
    final menuItem = sideMenuItems.elementAt(index), title = AppText.smallBold(menuItem.title);

    return menuItem.route == null
        ? FeatureHolder(
            feature: FeaturesEnum.theming,
            child: SwitchListTile(
                title: title,
                activeColor: AppColors.primary,
                value: context.read<ThemeCubit>().state.theme != ThemeMode.light,
                onChanged: (val) => ThemeService.changeTheme(context: context, makeDark: val)))
        : ListTile(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: title,
            onTap: () => AutoRouter.of(context).popAndPush(menuItem.route!),
          );
  }
}

class _SideMenuItem {
  final String title;
  final PageRouteInfo? route;

  _SideMenuItem(this.title, this.route);
}
