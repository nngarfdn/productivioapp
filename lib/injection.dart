import 'package:get_it/get_it.dart';

import 'features/auth/data/auth_repository_impl.dart';
import 'features/auth/data/remote_data_source.dart';
import 'features/auth/domain/repositories/auth_repository.dart';
import 'features/auth/domain/usecases/login_use_case.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton(() => RemoteDataSource());
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl<RemoteDataSource>()));
  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));
  sl.registerFactory(() => AuthBloc(sl<LoginUseCase>()));
}
