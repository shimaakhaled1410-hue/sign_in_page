import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:sign_in_page/core/errors/failure.dart';
import 'package:sign_in_page/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:sign_in_page/features/auth/domain/entities/user_entity.dart';
import 'package:sign_in_page/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, UserEntity>> signIn(
    String email,
    String password,
  ) async {
    try {
      final userModel = await authRemoteDataSource.signIn(email, password);
      final userEntity = UserEntity(userId: userModel.id, userEmail: userModel.email);
      return right(userEntity);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }
}
