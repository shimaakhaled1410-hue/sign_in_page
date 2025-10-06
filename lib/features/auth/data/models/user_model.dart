import 'package:sign_in_page/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity{
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String accessToken;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.accessToken,
  }) : super(userId: id, userEmail: email);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      accessToken: json['accessToken'],
    );
  }
}
