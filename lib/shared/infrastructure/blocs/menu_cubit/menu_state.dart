part of 'menu_cubit.dart';

abstract class MenuState extends Equatable {
  final MenuTypesModel? menus;
  final bool changed;
  final ErrorResponse? responseError;
  MenuState({required this.menus, required this.changed, this.responseError});
}

class MenuInitial extends MenuState {
  MenuInitial()
      : super(menus: MenuTypesModel(), changed: false, responseError: null);

  @override
  List<Object> get props => [menus!, changed];
}

class MenuUpdateState extends MenuState {
  MenuUpdateState({required MenuTypesModel menus, required bool changed})
      : super(menus: menus, changed: changed);

  @override
  List<Object> get props => [menus!, changed];
}

class MenuErrorState extends MenuState {
  MenuErrorState(
      {required MenuTypesModel? menus,
      required ErrorResponse responseError,
      required bool changed})
      : super(menus: menus, changed: changed, responseError: responseError);
  @override
  List<Object> get props => [changed];
}
