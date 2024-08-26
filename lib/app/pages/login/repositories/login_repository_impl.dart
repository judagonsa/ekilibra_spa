import 'package:ekilibra_spa/app/pages/login/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl();

  @override
  Future<bool> loginUser(String phoneNumber, String password) async {
    return false;
  }
}
