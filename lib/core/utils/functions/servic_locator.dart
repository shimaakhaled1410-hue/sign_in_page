

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:sign_in_page/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:sign_in_page/features/auth/data/repos/auth_repo_impl.dart';
import '../api_service.dart';

final getIt = GetIt.instance;

void serviceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(Dio()));

  getIt.registerSingleton<AuthRepoImpl>(
    AuthRepoImpl(
      authRemoteDataSource: AuthRemoteDataSourceImpl(getIt.get<ApiService>()),
    ),
  );
}
