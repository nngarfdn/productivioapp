import 'package:productivioapp/features/auth/data/remote_data_source.dart';

import '../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<String> login(String email, String password) async {
    // Use the RemoteDataSource for the login process
    return remoteDataSource.authenticate(email, password);
  }
}
