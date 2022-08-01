part of 'otp_dialog.imports.dart';

class OtpDialogDate {
  Timer? myTimer;
  GenericCubit<Duration?>? timerCubit;

  formatOtpDuration(Duration? _duration) {
    if (_duration != null) {
      return _duration.toString().split('.').first.padLeft(8, '0');
    }
    return '';
  }

  startOtpTimer() {
    if (timerCubit?.state.data != null) {
      if (myTimer != null && myTimer!.isActive) {
        myTimer!.cancel();
      }
      myTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (timerCubit!.state.data!.inSeconds == 1) {
          myTimer!.cancel();
        }
        Duration _duration = timerCubit!.state.data! - const Duration(seconds: 1);
        timerCubit!.onUpdateData(_duration);
      });
    }
  }
}
