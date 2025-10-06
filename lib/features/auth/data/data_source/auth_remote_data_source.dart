import 'package:sign_in_page/core/utils/api_service.dart';
import 'package:sign_in_page/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signIn(String email, String password);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiService apiService;

  AuthRemoteDataSourceImpl(this.apiService);

  @override
  Future<UserModel> signIn(String email, String password) async {
    // API (POST request)
    final data = await apiService.post(
      endPoint: 'https://dummyjson.com/users',
      data: {
        'email': email ,
        'password': password,
      },
    );

    final user = UserModel.fromJson(data);

    return user;
  }
}
