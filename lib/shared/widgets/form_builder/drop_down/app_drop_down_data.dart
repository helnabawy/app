part of 'app_drop_down_imports.dart';

class CustomDropDownData {
  final TextEditingController searchController = TextEditingController();
  final List<AppDropDownLookup> listItems;
  GenericCubit<List<AppDropDownLookup>?>? customDropDownListCubit;
  GenericCubit<String?>? valueCubit;

  CustomDropDownData({required this.listItems}) {
    customDropDownListCubit = GenericCubit(listItems);
    valueCubit = GenericCubit(null);
  }

  void selectItem(String? item) {
    valueCubit!.onUpdateData(item);
  }

  void resetPageState() {
    searchController.text = '';
    customDropDownListCubit!.onUpdateData(listItems);
  }

  searchItem({required BuildContext context}) {
    List<AppDropDownLookup> newList = listItems
        .where((element) => element.title.toLowerCase().contains(searchController.text.toLowerCase()))
        .toList();
    customDropDownListCubit!.onUpdateData(newList);
  }
}
