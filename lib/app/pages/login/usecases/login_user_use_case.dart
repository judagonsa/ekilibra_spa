import 'package:dartz/dartz.dart';
import 'package:ekilibra_spa/app/pages/login/repositories/login_repository.dart';

class LoginUserUseCase {
  final LoginRepository _loginRepository;

  LoginUserUseCase(this._loginRepository);

  Future<Either<bool, bool>> invoke(String phoneNumber, String password) async {
    try {
      final success = await _loginRepository.loginUser(phoneNumber, password);
      return success ? Right(success) : Left(success);
    } catch (e) {
      //manejo de logs
      return const Left(false);
    }
  }
}
