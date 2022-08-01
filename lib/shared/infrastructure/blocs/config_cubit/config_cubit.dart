import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:qcb/shared/enums/features.enum.dart';
import 'package:qcb/shared/models/app_config/app_config.dart';

part 'config_state.dart';

class ConfigCubit extends Cubit<ConfigState> {
  ConfigCubit() : super(ConfigInitial());

  onUpdateConfig(AppConfig appConfig) {
    emit(ConfigUpdateState(appConfig: appConfig, changed: !state.changed));
  }

  checkFeaturesEnable(FeaturesEnum featuresEnum) {
    var feature = state.appConfig!.applicationOptions.features!.toJson().entries.firstWhere(
          (element) => element.key.toLowerCase() == featuresEnum.name.toLowerCase(),
          orElse: () => const MapEntry('', false),
        );
    emit(FeatureConfigState(appConfig: state.appConfig!, changed: !state.changed, isEnabled: feature.value));
  }
}
