import 'package:kids_app/src/features/Authentication/domain/entities/user.dart';

abstract class AuthRepository {
  Future<User> signIn(String email, String password);
  Future<User> signUp(String email, String password);
  Future<void> forgotPassword(String email);
}
