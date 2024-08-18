// class AuthRepositoryImpl implements AuthRepository {
//   final AuthRemoteDataSource remoteDataSource;
//   final AuthLocalDataSource localDataSource;

//   AuthRepositoryImpl(
//       {required this.remoteDataSource, required this.localDataSource});

//   @override
//   Future<User> signIn(String email, String password) async {
//     final userModel = await remoteDataSource.signIn(email, password);
//     return userModel.toEntity();
//   }

//   @override
//   Future<User> signUp(String email, String password) async {
//     final userModel = await remoteDataSource.signUp(email, password);
//     return userModel.toEntity();
//   }

//   @override
//   Future<void> forgotPassword(String email) async {
//     return remoteDataSource.forgotPassword(email);
//   }
// }
