import 'package:flutter_riverpod/flutter_riverpod.dart';

class OTPNotifier extends StateNotifier<bool>{
  OTPNotifier() : super(false);

  void updateStatue(bool newState) async {
    state = newState;
  }

}

final otpProvider = StateNotifierProvider<OTPNotifier, bool>((ref) {
  return OTPNotifier();
});
