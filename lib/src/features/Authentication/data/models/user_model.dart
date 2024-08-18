import 'package:kids_app/src/features/Authentication/domain/entities/user.dart';

class UserModel {
  final String id;
  final String email;
  final String name;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
  });

  // Convert UserModel to User entity
  User toEntity() {
    return User(
      id: id,
      email: email,
      name: name,
    );
  }

  // You might also have a method to create a UserModel from JSON, for example
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
    );
  }
}
