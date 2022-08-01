import 'package:qcb/landing/src/shared/models/privacy_and_terms_model.dart';
import 'package:qcb/shared/models/error_response.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'privacy_and_terms_state.dart';

class PrivacyAndTermsCubit extends Cubit<PrivacyAndTermsState> {
  PrivacyAndTermsCubit() : super(PrivacyAndTermsInitial());

  onUpdateState(PrivacyAndTermsModel? privacyAndTermsModel) {
    emit(PrivacyAndTermUpdateState(privacyAndTermsModel: privacyAndTermsModel, changed: !state.changed));
  }

  onErrorState(ErrorResponse responseError) {
    emit(PrivacyAndTermsErrorState(
      privacyAndTermsModel: null,
      responseError: responseError,
      changed: !state.changed,
    ));
  }
}
