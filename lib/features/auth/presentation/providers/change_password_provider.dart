import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangePasswordProvider extends StateNotifier<bool> {
  ChangePasswordProvider() : super(false);

  void updateStatue(bool newState) async {
    state = newState;
  }
}

final changePasswordProvider =
    StateNotifierProvider<ChangePasswordProvider, bool>((ref) {
  return ChangePasswordProvider();
});
