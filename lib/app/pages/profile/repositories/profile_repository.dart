import 'package:ekilibra_spa/app/pages/profile/model/profile.dart';

abstract class ProfileRepository {
  ProfileRepository(ProfileRepository profileRepository);

  Future<bool> registerProfile(Profile profile);
  Future<bool> updateProfile(Profile profile);
  Future<bool> deleteProfile(String profileId);
  Future<Profile?> getProfile(String profileId);
}
