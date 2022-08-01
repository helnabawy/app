part of 'show_all_services.imports.dart';

class ShowAllServicesData {
  List<MenuItemModel> menuList = [];

  filterVerificationMenu({required List<MenuItemModel> verificationMenu}) {
    verificationMenu
        .where((item) => item.appName != 'ServicesProvidersGuide')
        .toList();
    verificationMenu
        .where((item) => item.appName != 'ServicesProvidersGuide')
        .toList();
    return verificationMenu;
  }

  init(
      {required BuildContext context,
      required List<MenuItemModel> verificationMenu}) {
    menuList = filterVerificationMenu(verificationMenu: verificationMenu);
  }
}
