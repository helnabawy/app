import 'package:qcb/landing/src/screens/home/models/home_types_model.dart';
import 'package:qcb/shared/models/error_response.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit() : super(MenuInitial());

  onUpdateState(MenuTypesModel menuModel) {
    emit(MenuUpdateState(menus: menuModel, changed: !state.changed));
  }

  onErrorState(ErrorResponse responseError) {
    emit(MenuErrorState(
      menus: null,
      responseError: responseError,
      changed: !state.changed,
    ));
  }
}
