part of 'otp_dialog.imports.dart';

class OtpDialog extends StatefulWidget {
  final Function(String) successCallBack;
  final Function resendCallBack;
  final Duration otpValidationDuration;
  final int inputsCount;
  final String? dialogTitle;
  final String? headerMessage;
  final String? activeTimerMessage;
  final String? errorInputsMessage;
  final String? errorTimerMessage;
  final String? submitButtonLabel;
  final String? resendButtonLabel;

  OtpDialog(
      {super.key,
      required this.successCallBack,
      required this.resendCallBack,
      required this.otpValidationDuration,
      required this.inputsCount,
      this.dialogTitle,
      this.headerMessage,
      this.submitButtonLabel,
      this.resendButtonLabel,
      this.activeTimerMessage,
      this.errorTimerMessage,
      this.errorInputsMessage});

  @override
  State<OtpDialog> createState() => _OtpDialogState();
}

class _OtpDialogState extends State<OtpDialog> {
  final TextEditingController verifyTextFieldController = TextEditingController();

  final GlobalKey<CustomButtonState> verifyBtnKey = GlobalKey<CustomButtonState>();

  final _formKey = GlobalKey<FormState>();

  final OtpDialogDate _otpDialogDate = OtpDialogDate();

  @override
  initState() {
    if (!widget.otpValidationDuration.isNegative) {
      _otpDialogDate.timerCubit = GenericCubit(widget.otpValidationDuration);
      _otpDialogDate.startOtpTimer();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<GenericCubit<Duration?>, GenericCubitState<Duration?>>(
        bloc: _otpDialogDate.timerCubit,
        builder: (context, state) {
          if (state.data!.inSeconds == 0) {
            FocusScope.of(context).unfocus();
          }
          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: AppText.large(widget.dialogTitle ?? ''),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  alignment: Alignment.center,
                  width: width,
                  color: AppColors.primary,
                  child: state.data!.inSeconds == 0
                      ? AppText(
                          title: widget.errorTimerMessage ?? translate('otp_message_time_out'),
                          align: TextAlign.center,
                          size: 10,
                          color: AppColors.red,
                        )
                      : AppText.small(
                          '${widget.activeTimerMessage ?? translate('otp_dialog_timeout_msg')}: ${_otpDialogDate.formatOtpDuration(state.data!)}'),
                ),
                General.sizeBoxVertical(20.0),
                AppText.normal(translate('otp_dialog_input_label')),
                General.sizeBoxVertical(10.0),
                AppFormBuilder.number(
                  enabled: state.data!.inSeconds != 0,
                  maxLength: widget.inputsCount,
                  controller: verifyTextFieldController,
                  name: 'otp',
                  onChanged: (value) {},
                  hintText: '',
                  validator: (val) {
                    if (!Validators.validateNumber(val!) || val.length < widget.inputsCount) {
                      return widget.errorInputsMessage ?? translate('otp_validator_error');
                    }
                    return null;
                  },
                ),
                General.sizeBoxVertical(10.0),
                Column(
                  children: [
                    if (state.data!.inSeconds == 0)
                      InkWell(
                        onTap: () {
                          widget.resendCallBack();
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 20),
                          child: Text(
                            widget.resendButtonLabel ?? translate('otp_resend'),
                            style: const TextStyle(decoration: TextDecoration.underline, color: AppColors.grey),
                          ),
                        ),
                      ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              AutoRouter.of(context).pop();
                            },
                            child: Center(child: AppText.normal(translate('otp_dialog_back_label'))),
                          ),
                        ),
                        Expanded(
                          child: Opacity(
                            opacity: state.data!.inSeconds != 0 &&
                                    verifyTextFieldController.text.length == widget.inputsCount
                                ? 1
                                : 0.4,
                            child: LoadingButton(
                              title: widget.submitButtonLabel ?? translate('verify'),
                              onTap: () {
                                if (_formKey.currentState!.validate() && state.data!.inSeconds != 0) {
                                  Navigator.pop(context);
                                  widget.successCallBack(verifyTextFieldController.text);
                                }
                              },
                              fontWeight: FontWeight.bold,
                              btnKey: verifyBtnKey,
                              color: AppColors.green,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          );
        });
  }
}
