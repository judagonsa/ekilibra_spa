import 'package:ekilibra_spa/app/pages/profile/model/profile.dart';

abstract class ProfileRepository {
  Future<bool> registerProfile(Profile profile);
  Future<bool> updateProfile(Profile profile);
  Future<bool> deleteProfile(String profileId);
}
