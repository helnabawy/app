import 'package:flutter/material.dart';
import 'package:qcb/shared/services/language/localization_helpers.dart';
import 'package:qcb/shared/widgets/form_builder/app_button.dart';
import 'package:qcb/shared/widgets/form_builder/app_text.dart';

class FilterSectionHolder extends StatelessWidget {
  final VoidCallback onReset;
  final VoidCallback onSearch;
  final Column filterButtons;
  const FilterSectionHolder({super.key, required this.onReset, required this.onSearch, required this.filterButtons});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      color: Theme.of(context).bottomAppBarColor,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      width: width,
      child: Column(
        children: [
          filterButtons,
          const SizedBox(height: 20),
          _buildActionButtons(),
        ],
      ),
    );
  }

  _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(onTap: onReset, child: AppText.small(translate('reset'))),
        AppButton.green(translate('services_providers_guide_search_label'), () => onSearch()),
      ],
    );
  }
}
