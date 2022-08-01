import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qcb/shared/infrastructure/blocs/generic_cubit/generic_cubit.dart';
import 'package:qcb/shared/services/language/localization_helpers.dart';
import 'package:qcb/shared/widgets/form_builder/app_text.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onClose;
  final VoidCallback onSearch;
  final VoidCallback onBack;
  final GenericCubit<bool> searchCubit;
  final TextEditingController searchController;
  final Function(String) onTextInputChange;
  final String title;
  final bool hideBackButton;

  SearchAppBar({
    required this.onClose,
    required this.onSearch,
    required this.searchCubit,
    required this.onBack,
    required this.title,
    required this.searchController,
    required this.onTextInputChange,
    this.hideBackButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        centerTitle: false,
        leading: hideBackButton
            ? null
            : IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  size: 25,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                onPressed: onBack,
              ),
        elevation: 0.0,
        actions: [
          BlocBuilder<GenericCubit<bool>, GenericCubitState<bool>>(
            bloc: searchCubit,
            builder: (context, state) {
              if (state.data) {
                return IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: onClose,
                );
              } else {
                return IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: onSearch,
                );
              }
            },
          ),
        ],
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: BlocBuilder<GenericCubit<bool>, GenericCubitState<bool>>(
          bloc: searchCubit,
          builder: (context, state) {
            if (state.data) {
              return TextFormField(
                autofocus: true,
                controller: searchController,
                onChanged: onTextInputChange,
                decoration: InputDecoration(
                  label: Text(translate('search')),
                ),
              );
            } else {
              return AppText.bold(translate(title));
            }
          },
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(65);
}
