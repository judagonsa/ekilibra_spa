import 'package:ekilibra_spa/app/pages/profile/model/profile.dart';
import 'package:ekilibra_spa/app/pages/profile/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<bool> deleteProfile(String profileId) async {
    return false;
  }

  @override
  Future<bool> registerProfile(Profile profile) async {
    return false;
  }

  @override
  Future<bool> updateProfile(Profile profile) async {
    return false;
  }
}
