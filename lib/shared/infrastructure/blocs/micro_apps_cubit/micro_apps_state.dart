part of 'micro_apps_cubit.dart';

abstract class MicroAppState extends Equatable {
  final List<IonicMicroApp>? ionicMicroApps;
  final bool? changed;
  MicroAppState(this.ionicMicroApps, this.changed);
}

class MicroAppInitial extends MicroAppState {
  MicroAppInitial() : super([], false);

  @override
  List<Object> get props => [ionicMicroApps!, changed!];
}

class MicroAppUpdateState extends MicroAppState {
  MicroAppUpdateState({List<IonicMicroApp>? ionicMicroApps, bool? changed}) : super(ionicMicroApps, changed);

  @override
  List<Object> get props => [ionicMicroApps!, changed!];
}
