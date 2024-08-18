import 'package:kids_app/src/features/Authentication/domain/repositories/auth_repo.dart';

class ForgotPasswordUseCase {
  final AuthRepository repository;

  ForgotPasswordUseCase(this.repository);

  Future<void> call(String email) {
    return repository.forgotPassword(email);
  }
}
