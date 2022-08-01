import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qcb/shared/enums/features.enum.dart';
import 'package:qcb/shared/infrastructure/blocs/config_cubit/config_cubit.dart';

class FeatureHolder extends StatelessWidget {
  final FeaturesEnum feature;
  final Widget child;
  Widget? buildWidget;

  FeatureHolder({Key? key, required this.feature, required this.child, this.buildWidget}) : super(key: key);

  FeatureHolder.consumer({required this.feature, required this.child}) {
    buildWidget = BlocConsumer<ConfigCubit, ConfigState>(
        listener: (context, state) {
          if (state is ConfigUpdateState) {
            context.read<ConfigCubit>().checkFeaturesEnable(feature);
          }
        },
        builder: (context, state) => state is FeatureConfigState && state.isEnabled ? child : const SizedBox());
  }

  @override
  Widget build(BuildContext context) {
    return buildWidget ??
        BlocBuilder<ConfigCubit, ConfigState>(
            bloc: context.read<ConfigCubit>()..checkFeaturesEnable(feature),
            builder: (context, state) => state is FeatureConfigState && state.isEnabled ? child : const SizedBox());
  }
}
