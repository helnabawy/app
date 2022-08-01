part of 'config_cubit.dart';

abstract class ConfigState extends Equatable {
  AppConfig? appConfig;
  final bool changed;
  ConfigState({this.appConfig, required this.changed});
}

class ConfigInitial extends ConfigState {
  ConfigInitial() : super(appConfig: null, changed: false);

  @override
  List<Object> get props => [];
}

class ConfigUpdateState extends ConfigState {
  final AppConfig appConfig;
  ConfigUpdateState({required this.appConfig, required bool changed}) : super(appConfig: appConfig, changed: changed);

  @override
  List<Object> get props => [appConfig];
}

class FeatureConfigState extends ConfigState {
  final bool isEnabled;
  FeatureConfigState({required AppConfig appConfig, required this.isEnabled, required bool changed})
      : super(appConfig: appConfig, changed: changed);

  @override
  List<Object> get props => [isEnabled];
}
