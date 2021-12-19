// Package imports:
// ignore_for_file: depend_on_referenced_packages

/*
1. Cubit for housing all the required function for the logic
2. Opens and Closes Hive box
3. Function enable to store Pin in Hive 
4. Function enable to get Pin from Hive to match it with pin entered in Authenticate Screen
*/

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:rafia_cake_tech/models/user.dart';

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
      savePincodeToHive(passcode!);
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

  Future savePincodeToHive(String tobeStored) async {
    // save the passcode to state.passcode
    final passcode = User(tobeStored);

    // save the passcode to hive
    await Hive.openBox('passcode');
    await Hive.box('passcode').put('passcode', passcode);
    Hive.close();
  }

  // make a method to get the passcode from hive
  Future<String?> getPincodeFromHive() async {
    // save the passcode to state.storedPasscode
    String? storedPasscode;
    await Hive.openBox('passcode');
    final storedPasscodeFromHive = await Hive.box('passcode').get('passcode');
    // close the box
    Hive.close();
    // if passcode is null then return null
    if (storedPasscodeFromHive == null) {
      // emit the state.status to PasscodeStatus.passcodeNotSet
      emit(PasscodeState(status: PasscodeStatus.passcodeNotSet));
      return null;
    }
    storedPasscode = storedPasscodeFromHive.storedPin;
    return storedPasscode;
  }
}
