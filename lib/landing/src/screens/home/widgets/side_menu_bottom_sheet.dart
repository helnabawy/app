part of 'home_widgets.imports.dart';

class SideMenuBottomSheet {
  static showSideMenu({required MenuItemModel menuItemModel, required BuildContext context}) {
    Dialogs.openBottomSheet(
        context: context,
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              General.sizeBoxVertical(20.0),
              Padding(
                padding: const EdgeInsets.all(16),
                child: AppText.largeBold(menuItemModel.title),
              ),
              Expanded(
                  child: ListView.separated(
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          onTap: () => MicroAppsService.onMicroAppTap(context, menuItemModel.subMenu![index]),
                          title: AppText.light(menuItemModel.subMenu![index].title),
                          trailing: Image.asset(Resources.leftArrow, color: AppColors.grey, scale: 3.5),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) => const ListSeparator(color: AppColors.grey),
                      itemCount: menuItemModel.subMenu!.length)),
            ],
          ),
        ));
  }
}
