import 'package:qcb/shared/models/ionic_micro_app.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'micro_apps_state.dart';

class MicroAppCubit extends Cubit<MicroAppState> {
  MicroAppCubit() : super(MicroAppInitial());

  onUpdateState(List<IonicMicroApp>? ionicMicroApps) {
    emit(MicroAppUpdateState(ionicMicroApps: ionicMicroApps));
  }
}
