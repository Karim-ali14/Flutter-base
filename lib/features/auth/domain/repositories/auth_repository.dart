import '../../../../core/utils/typedefs.dart';

abstract class AuthRepository {
  FutureResponseModel login({String? phoneNumber, String? password});

  FutureResponseModel signUp({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    String? password,
    String? generatedToken,
  });

}
