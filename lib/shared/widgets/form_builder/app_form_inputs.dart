import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class AppFormBuilder {
  static text({
    required TextEditingController controller,
    required String name,
    required Function(String?) onChanged,
    required String hintText,
  }) {
    return FormBuilderTextField(
        controller: controller,
        name: name,
        keyboardType: TextInputType.text,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChanged,
        decoration:
            InputDecoration(border: const OutlineInputBorder(), counterText: '', hintText: hintText, errorMaxLines: 3),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.match(r'[^0-9]+'),
        ]));
  }

  static number(
      {required TextEditingController controller,
      required String name,
      required Function(String?) onChanged,
      required String hintText,
      FocusNode? focusNode,
      required String? Function(String?) validator,
      int? maxLength,
      bool? enabled}) {
    return FormBuilderTextField(
        enabled: enabled ?? true,
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        maxLength: maxLength,
        controller: controller,
        focusNode: focusNode,
        name: name,
        keyboardType: TextInputType.number,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChanged,
        decoration:
            InputDecoration(border: const OutlineInputBorder(), counterText: '', hintText: hintText, errorMaxLines: 3),
        validator: validator);
  }

  static textArea(
      {required TextEditingController controller,
      required String name,
      required Function(String?) onChanged,
      required String hintText,
      int maxLength = 100}) {
    return FormBuilderTextField(
        minLines: 6,
        keyboardType: TextInputType.multiline,
        maxLines: null,
        maxLength: maxLength,
        controller: controller,
        name: name,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChanged,
        decoration: InputDecoration(border: const OutlineInputBorder(), counterText: '', hintText: hintText),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
          FormBuilderValidators.match(r'[^0-9]+'),
        ]));
  }

  static string(
      {required TextEditingController controller,
      required String name,
      required Function(String?) onChanged,
      required String hintText,
      required String? Function(String?) validator,
      bool enabled = true,
      int? maxLength}) {
    return FormBuilderTextField(
        enabled: enabled,
        minLines: 1,
        keyboardType: TextInputType.text,
        maxLines: 1,
        maxLength: maxLength,
        controller: controller,
        name: name,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChanged,
        decoration: InputDecoration(border: const OutlineInputBorder(), counterText: '', hintText: hintText),
        validator: validator);
  }

  static date({
    required TextEditingController controller,
    required String name,
    required Function(DateTime?) onChanged,
    required String hintText,
  }) {
    return FormBuilderDateTimePicker(
        controller: controller,
        name: name,
        keyboardType: TextInputType.text,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: onChanged,
        decoration: InputDecoration(border: const OutlineInputBorder(), counterText: '', hintText: hintText),
        validator: FormBuilderValidators.compose([
          FormBuilderValidators.required(),
        ]));
  }

  static pinCode() {}
}
