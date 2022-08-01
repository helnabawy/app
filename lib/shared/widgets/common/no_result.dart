import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qcb/shared/services/language/localization_helpers.dart';
import 'package:qcb/shared/widgets/form_builder/app_text.dart';

class NoResult extends StatelessWidget {
  final String text;

  const NoResult({this.text = 'no_result'});

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      SvgPicture.asset('assets/images/folder.svg', width: 90),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: AppText.light(translate(text))..align = TextAlign.center,
      ),
    ]);
  }
}
