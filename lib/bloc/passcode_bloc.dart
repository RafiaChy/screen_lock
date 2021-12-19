// Package imports:
// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'passcode_state.dart';

class PasscodeBloc extends Cubit<PasscodeState> {
  PasscodeBloc() : super(PasscodeState());
  void passcodeScreenValidation(String passcode) {
    // save the passcode to state.passcode

    emit(
      state.copyWith(
        passcode: passcode,
        status: PasscodeStatus.passcodeScreenDone,
      ),
    );
  }

  void confirmPasscodeScreenValidation(
      String? passcode, String? confirmPasscode) {
    if (passcode == confirmPasscode) {
      emit(PasscodeState(status: PasscodeStatus.passcodeSuccessConfirm));
    } else {
      emit(PasscodeState(status: PasscodeStatus.passcodeFailConfirm));
    }
  }

  void authenticatePasscode(String? storedPasscode, String? passcode) {
    if (passcode == storedPasscode) {
      emit(PasscodeState(status: PasscodeStatus.passcodeMatch));
    } else {
      emit(PasscodeState(status: PasscodeStatus.passcodeMismatch));
    }
  }
}
