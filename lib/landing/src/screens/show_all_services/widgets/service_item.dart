part of 'show_all_services_widgets_imports.dart';

class ServiceItem extends StatelessWidget {
  final MenuItemModel menuItemModel;

  const ServiceItem({required this.menuItemModel});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => {},
      title: AppText.secondarySmallBold(menuItemModel.title),
      trailing: Image.asset(Resources.leftArrow, color: AppColors.grey.withAlpha(100), scale: 4.0),
    );
  }
}
