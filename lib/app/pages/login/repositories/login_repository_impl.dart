import 'package:ekilibra_spa/app/pages/login/repositories/login_repository.dart';
import 'package:ekilibra_spa/app/pages/profile/model/profile.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl();

  @override
  Future<bool> loginUser(String phoneNumber, String password) async {
    return false;
  }

  @override
  Future<bool> registerUser(Profile profile) async {
    return false;
  }
}
