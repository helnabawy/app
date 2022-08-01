part of 'privacy_and_terms_cubit.dart';

abstract class PrivacyAndTermsState extends Equatable {
  final PrivacyAndTermsModel? privacyAndTermsModel;
  final bool changed;
  final ErrorResponse? responseError;
  PrivacyAndTermsState(
      {required this.privacyAndTermsModel,
      required this.changed,
      this.responseError});
}

class PrivacyAndTermsInitial extends PrivacyAndTermsState {
  PrivacyAndTermsInitial()
      : super(privacyAndTermsModel: null, changed: false, responseError: null);

  @override
  List<Object> get props => [privacyAndTermsModel!, changed];
}

class PrivacyAndTermUpdateState extends PrivacyAndTermsState {
  PrivacyAndTermUpdateState(
      {PrivacyAndTermsModel? privacyAndTermsModel, required bool changed})
      : super(privacyAndTermsModel: privacyAndTermsModel, changed: changed);

  @override
  List<Object> get props => [privacyAndTermsModel!, changed];
}

class PrivacyAndTermsErrorState extends PrivacyAndTermsState {
  PrivacyAndTermsErrorState(
      {required PrivacyAndTermsModel? privacyAndTermsModel,
      required ErrorResponse responseError,
      required bool changed})
      : super(
            privacyAndTermsModel: privacyAndTermsModel,
            changed: changed,
            responseError: responseError);
  @override
  List<Object> get props => [changed];
}
