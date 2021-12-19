// ignore: slash_for_doc_comments
/**
 * The sates:
  check out the enum
 */

part of 'passcode_bloc.dart';

class PasscodeState with EquatableMixin {
  final String? passcode;
  final String? confirmPasscode;
  final String? storedPasscode;
  final PasscodeStatus status;

  PasscodeState({
    this.passcode,
    this.confirmPasscode,
    this.storedPasscode,
    this.status = PasscodeStatus.initial,
  });

  @override
  List<Object?> get props => [
        passcode,
        confirmPasscode,
        storedPasscode,
        status,
      ];

  PasscodeState copyWith({
    String? passcode,
    String? confirmPasscode,
    String? storedPasscode,
    PasscodeStatus? status,
  }) {
    return PasscodeState(
      passcode: passcode ?? this.passcode,
      confirmPasscode: confirmPasscode ?? this.confirmPasscode,
      storedPasscode: storedPasscode ?? this.storedPasscode,
      status: status ?? this.status,
    );
  }
}

enum PasscodeStatus {
  initial,
  passcode,
  passcodeScreenDone,
  confirmPasscode,
  confirmPasscodeScreenDone,
  passcodeMismatch,
  passcodeMatch,
  passcodeFailure,
  passcodeSuccessConfirm,
  passcodeFailConfirm,
  passcodeNotSet,
}
