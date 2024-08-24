import 'package:ekilibra_spa/app/pages/profile/model/profile.dart';

abstract class LoginRepository {
  Future<bool> registerUser(Profile profile);
  Future<bool> loginUser(String phoneNumber, String password);
}
