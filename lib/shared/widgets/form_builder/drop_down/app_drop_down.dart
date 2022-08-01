part of 'app_drop_down_imports.dart';

class AppDropDown extends StatefulWidget {
  final String? selectedValue;
  final String? errorMessage;
  final bool searchAllowed;
  final List<AppDropDownLookup> items;
  final Function(dynamic) callBack;
  final bool isFullScreen;

  const AppDropDown(
      {Key? key,
      this.selectedValue,
      this.searchAllowed = false,
      required this.items,
      required this.callBack,
      this.errorMessage,
      this.isFullScreen = true})
      : super(key: key);

  @override
  State<AppDropDown> createState() => _AppDropDownState();
}

class _AppDropDownState extends State<AppDropDown> {
  CustomDropDownData? customDropDownData;

  @override
  didUpdateWidget(oldWidget) {
    customDropDownData!.selectItem(widget.selectedValue);
    super.didUpdateWidget(oldWidget);
  }

  @override
  initState() {
    customDropDownData = CustomDropDownData(listItems: widget.items);
    customDropDownData!.selectItem(widget.selectedValue);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericCubit<String?>, GenericCubitState<String?>>(
        bloc: customDropDownData!.valueCubit,
        builder: (ctx, state) {
          return widget.isFullScreen
              ? InkWell(
                  onTap: () {
                    buildFullScreenDialog(context);
                  },
                  child: AbsorbPointer(
                    absorbing: true,
                    child: TextFormField(
                      maxLines: 2,
                      minLines: 1,
                      validator: (value) {
                        if (state.data == null) {
                          return widget.errorMessage ?? translate('otp_validator_error');
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.values[state.data != null ? 1 : 0],
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(color: AppColors.grey),
                          suffixIcon: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 30,
                          ),
                          hintText: (state.data ?? translate('choose')),
                          border: const OutlineInputBorder()),
                    ),
                  ),
                )
              : PopupMenuButton(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height / 2,
                    minWidth: MediaQuery.of(context).size.width - 40,
                  ),
                  offset: const Offset(-1, 70),
                  shape: const PopMenuShape(),
                  onSelected: (AppDropDownLookup value) {
                    customDropDownData!.selectItem(value.title);
                    widget.callBack(value.targetObject);
                  },
                  itemBuilder: (BuildContext context) => <PopupMenuEntry<AppDropDownLookup>>[
                    for (var element in widget.items) ...<PopupMenuEntry<AppDropDownLookup>>[
                      PopupMenuItem<AppDropDownLookup>(
                        value: element,
                        child: Text(element.title),
                      ),
                      const PopupMenuDivider(),
                    ]
                  ],
                  child: AbsorbPointer(
                    absorbing: true,
                    child: TextFormField(
                      maxLines: 2,
                      minLines: 1,
                      validator: (value) {
                        if (state.data == null) {
                          return widget.errorMessage ?? translate('otp_validator_error');
                        } else {
                          return null;
                        }
                      },
                      autovalidateMode: AutovalidateMode.values[state.data != null ? 1 : 0],
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(color: AppColors.grey),
                          suffixIcon: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            size: 30,
                          ),
                          hintText: (state.data ?? translate('choose')),
                          border: const OutlineInputBorder()),
                    ),
                  ),
                );
        });
  }

  void buildFullScreenDialog(context) {
    if (widget.searchAllowed) {
      customDropDownData!.resetPageState();
    }
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) =>
          BlocBuilder<GenericCubit<List<AppDropDownLookup>?>, GenericCubitState<List<AppDropDownLookup>?>>(
              bloc: customDropDownData!.customDropDownListCubit,
              builder: (ctx, state) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Stack(
                    children: [
                      Container(
                        height: 100,
                        padding: const EdgeInsets.all(16),
                        color: AppColors.background,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 100,
                            color: Theme.of(context).appBarTheme.backgroundColor,
                            padding: const EdgeInsets.all(16).copyWith(top: 20, right: 20),
                            child: Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Icon(
                                      Icons.close_rounded,
                                      size: 30,
                                    )),
                                const SizedBox(
                                  width: 25,
                                ),
                                Text(
                                  translate('choose'),
                                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          if (widget.searchAllowed)
                            Container(
                              decoration: BoxDecoration(border: Border.all(width: 15, color: AppColors.greyWhite)),
                              child: Stack(
                                children: [
                                  TextFormField(
                                    onChanged: (val) {
                                      customDropDownData!.searchItem(context: context);
                                    },
                                    controller: customDropDownData!.searchController,
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    decoration: InputDecoration(
                                        hintStyle: const TextStyle(color: AppColors.grey, fontSize: 18),
                                        isDense: true,
                                        contentPadding: const EdgeInsets.only(right: 45, top: 10, bottom: 10),
                                        hintText: translate('search_label'),
                                        border: InputBorder.none),
                                  ),
                                  Positioned(
                                      top: 0,
                                      right: 0,
                                      child: IconButton(
                                        icon: const Icon(Icons.search, size: 30, color: AppColors.grey),
                                        onPressed: () {},
                                      ))
                                ],
                              ),
                            ),
                          const SizedBox(
                            height: 15,
                          ),
                          Expanded(
                              child: state.data != null
                                  ? ListView.builder(
                                      itemCount: state.data!.length,
                                      itemBuilder: (context, index) => InkWell(
                                            onTap: () {
                                              customDropDownData!.selectItem(state.data![index].title);
                                              widget.callBack(state.data![index].targetObject);
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                                                    child: Text(
                                                      state.data![index].title,
                                                      style: const TextStyle(fontWeight: FontWeight.bold),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    color: AppColors.black,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ))
                                  : Container())
                        ],
                      )
                    ],
                  ),
                );
              }),
    );
  }
}
