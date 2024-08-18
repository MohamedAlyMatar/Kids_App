import 'package:kids_app/src/features/Authentication/domain/entities/user.dart';
import 'package:kids_app/src/features/Authentication/domain/repositories/auth_repo.dart';

class SignInUseCase {
  final AuthRepository repository;

  SignInUseCase(this.repository);

  Future<User> call(String email, String password) {
    return repository.signIn(email, password);
  }
}
