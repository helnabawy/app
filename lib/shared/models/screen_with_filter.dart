import 'package:qcb/shared/infrastructure/blocs/generic_cubit/generic_cubit.dart';

abstract class ScreenWithFilter {
  late GenericCubit<bool> showFilterSection;
  void toggleSearchCubitValue();
}
