import '../../../../core/models/StateModel.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/providers/auth_repository_provider.dart';
import '../../domain/use_cases/login_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final loginStateNotifierProvider =
    StateNotifierProvider.autoDispose<LoginUseCase, StateModel<User>>(
        (ref) => LoginUseCase(ref, ref.read(authRepoProvider)));
