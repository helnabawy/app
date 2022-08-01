part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  final UserModel? model;
  final bool changed;

  const UserState({this.model, required this.changed});
}

class UserInitial extends UserState {
  UserInitial() : super(changed: false);

  @override
  List<Object?> get props => [model, changed];
}

class UserUpdateState extends UserState {
  UserUpdateState({UserModel? model, required bool changed}) : super(model: model, changed: changed);

  @override
  List<Object?> get props => [model, changed];
}
