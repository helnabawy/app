part of 'home_widgets.imports.dart';

class VerificationItem extends StatelessWidget {
  final MenuItemModel menuItemModel;
  final List<MenuItemModel> verificationMenu;
  final int index;

  VerificationItem({Key? key, required this.menuItemModel, required this.index, required this.verificationMenu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.primary.withAlpha(100)), borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsetsDirectional.only(start: index == 0 ? 20 : 0, end: index == 7 ? 20 : 12),
        width: 110,
        child: InkWell(
          highlightColor: AppColors.primary.withAlpha(30),
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          onTap: () {
            if (menuItemModel.route == 'showAllServices') {
              context.push(ShowAllServicesScreenRoute(
                  verificationMenu: verificationMenu,
                  appCenterEventEnum: AppCenterEventEnum.EnterAllVerficationMenuLaning));
            } else {
              MicroAppsService.onMicroAppTap(context, menuItemModel);
            }
          },
          child: Ink(
            decoration:
                BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor, borderRadius: BorderRadius.circular(6)),
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Image.asset(
                'assets/images/${menuItemModel.icon}.png',
                color: Color(Utils.getColorHexFromStr('#54c3b0')),
                height: 26.0,
                width: 32,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
                child: Text(
                  menuItemModel.title,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ]),
          ),
        ));
  }
}
