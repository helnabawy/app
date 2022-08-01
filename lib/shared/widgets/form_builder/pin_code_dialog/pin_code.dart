part of 'pincode.imports.dart';

class PinCodeWidget extends StatefulWidget {
  final String? Function(String?) onCompleted;
  final VoidCallback onResend;
  final GenericCubit<Duration> timerCubit;

  PinCodeWidget({required this.onCompleted, required this.onResend, required this.timerCubit});

  @override
  State<PinCodeWidget> createState() => _PinCodeWidgetState();
}

class _PinCodeWidgetState extends State<PinCodeWidget> {
  final PincodeData _pincodeData = PincodeData();
  final FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _pincodeData.startOtpTimer(timerCubit: widget.timerCubit);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<PinCodeCubit, PinCodeState>(
      listener: (context, state) {
        if (state is ResetInputState) {
          _pincodeData.pinCodeController.clear();
        } else if (state is FireKeyboardState) {
          FocusScope.of(context).requestFocus();
          focusNode.nextFocus();
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                title: translate('auth_hint'),
                fontWeight: FontWeight.bold,
                size: 14.0,
              ),
              General.sizeBoxVertical(20.0),
              AppText(
                title: translate('absher_otp_dialog_label'),
                align: TextAlign.center,
              ),
              General.sizeBoxVertical(20.0),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.8,
                child: PinCodeTextField(
                  appContext: context,
                  length: 4,
                  obscureText: false,
                  obscuringCharacter: '*',
                  autoFocus: true,
                  focusNode: focusNode,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  errorAnimationController: _pincodeData.errorController,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 50,
                    fieldWidth: 60,
                    activeFillColor: Colors.white,
                  ),
                  validator: (val) {
                    return null;
                  },
                  animationDuration: const Duration(milliseconds: 300),
                  controller: _pincodeData.pinCodeController,
                  onCompleted: widget.onCompleted,
                  onChanged: (value) {},
                  beforeTextPaste: (text) {
                    return true;
                  },
                ),
              ),
              BlocBuilder<GenericCubit<Duration>, GenericCubitState<Duration>>(
                bloc: widget.timerCubit,
                builder: (context, state) {
                  return Column(
                    children: [
                      Center(
                        child: AppText.normal(
                          '${translate('otp_dialog_timeout_msg')}: ${_pincodeData.formatOtpDuration(state.data)}',
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: state.data.inSeconds == 0
                            ? AppButton.blockPrimary(
                                translate('resend'),
                                widget.onResend,
                                width: width,
                              )
                            : AppButton.blockDisabled(
                                translate('resend'),
                                () {},
                                width: width,
                              ),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                      )
                    ],
                  );
                },
              )
            ],
          ),
        );
      },
    );
  }
}
