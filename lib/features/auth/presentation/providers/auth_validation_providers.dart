import 'package:flutter_riverpod/flutter_riverpod.dart';

class ValidationStateNotifier extends StateNotifier<bool>{
  ValidationStateNotifier() : super(false);

  void updateStatue(bool newState) async {
    state = newState;
  }

}

final otpProvider = StateNotifierProvider<ValidationStateNotifier, bool>((ref) {
  return ValidationStateNotifier();
});

final loginProvider = StateNotifierProvider<ValidationStateNotifier, bool>((ref) {
  return ValidationStateNotifier();
});

final forgetPasswordProvider = StateNotifierProvider<ValidationStateNotifier, bool>((ref) {
  return ValidationStateNotifier();
});

final changePasswordProvider = StateNotifierProvider<ValidationStateNotifier, bool>((ref) {
  return ValidationStateNotifier();
});
