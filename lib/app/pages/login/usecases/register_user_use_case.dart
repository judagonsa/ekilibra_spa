import 'package:dartz/dartz.dart';
import 'package:ekilibra_spa/app/pages/login/repositories/login_repository.dart';
import 'package:ekilibra_spa/app/pages/profile/model/profile.dart';

class RegisterUserUseCase {
  final LoginRepository _loginRepository;

  RegisterUserUseCase(this._loginRepository);

  Future<Either<bool, bool>> invoke(Profile profile) async {
    try {
      final success = await _loginRepository.registerUser(profile);
      return success ? Right(success) : Left(success);
    } catch (e) {
      //manejo de logs
      return const Left(false);
    }
  }
}
