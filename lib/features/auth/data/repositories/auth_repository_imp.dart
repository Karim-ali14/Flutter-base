import '../../../../core/utils/typedefs.dart';
import '../../data/data_sources/data_sources.dart';

import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/http_operation.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImp extends AuthRepository{

  final AuthRemoteDataSource _dataSource;

  AuthRepositoryImp(this._dataSource);

  @override
  FutureResponseModel login({String? phone}) {
    return _dataSource.login(phone);
  }

}