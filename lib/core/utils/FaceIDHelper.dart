
import 'package:local_auth/local_auth.dart';

class FaceIDHelper {
  static final LocalAuthentication auth = LocalAuthentication();

  /// Check if the device supports Face ID or face recognition
  static Future<bool> isFaceAvailable() async {
    try {
      bool canAuthenticate = await auth.canCheckBiometrics;
      List<BiometricType> availableBiometrics = await auth.getAvailableBiometrics();

      print(canAuthenticate);
      return canAuthenticate && (availableBiometrics.contains(BiometricType.face) || availableBiometrics.contains(BiometricType.weak));
    } catch (e) {
      print("Error checking Face/Face Recognition availability: $e");
      return false;
    }
  }

  /// Authenticate using Face ID
  static Future<bool> authenticateWithFaceID() async {
    try {
      bool isAvailable = await isFaceAvailable();
      if (!isAvailable) {
        print("Face ID not available");
        return false;
      }

      return await auth.authenticate(
        localizedReason: "Use Face ID to login",
        options: const AuthenticationOptions(
          biometricOnly: true, // Ensure only biometrics are used (no PIN)
          stickyAuth: true,// Keeps the authentication active if the app is in the background
        ),
      );
    } catch (e) {
      print("Face ID authentication failed: $e");
      return false;
    }
  }
}
