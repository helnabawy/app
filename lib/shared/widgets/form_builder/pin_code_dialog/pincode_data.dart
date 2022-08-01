part of 'pincode.imports.dart';

class PincodeData {
  StreamController<ErrorAnimationType> errorController = StreamController<ErrorAnimationType>();
  final TextEditingController pinCodeController = TextEditingController();
  Timer? myTimer;

  formatOtpDuration(Duration? _duration) {
    if (_duration != null) {
      return _duration.toString().split('.').first.padLeft(8, '0');
    }
    return '';
  }

  startOtpTimer({required GenericCubit timerCubit}) {
    if (myTimer != null && myTimer!.isActive) {
      myTimer!.cancel();
    }
    myTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timerCubit.state.data.inSeconds == 1) {
        myTimer!.cancel();
      }
      Duration _duration = timerCubit.state.data - const Duration(seconds: 1);
      timerCubit.onUpdateData(_duration);
    });
  }
}
