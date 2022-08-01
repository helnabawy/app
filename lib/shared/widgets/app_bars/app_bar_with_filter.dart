import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qcb/shared/infrastructure/blocs/generic_cubit/generic_cubit.dart';
import 'package:qcb/shared/models/screen_with_filter.dart';
import 'package:qcb/shared/widgets/app_bars/appbar_search_icon.dart';
import 'package:qcb/shared/widgets/app_bars/default_appbar.dart';

// ignore: must_be_immutable
class AppBarWithFilter extends DefaultAppBar {
  final ScreenWithFilter screenData;
  AppBarWithFilter({required super.title, required this.screenData});

  @override
  Widget build(BuildContext context) {
    return DefaultAppBar(
      title: title,
      actions: [_buildFilterButton()],
    );
  }

  _buildFilterButton() {
    return BlocBuilder<GenericCubit, GenericCubitState>(
        bloc: screenData.showFilterSection,
        builder: (_, state) => AppBarSearchIcon(onTap: screenData.toggleSearchCubitValue, showDropDown: state.data));
  }
}
