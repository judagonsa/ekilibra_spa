import 'dart:convert';
import 'package:ekilibra_spa/app/config/exports/helpers/exports_helpers.dart';
import 'package:ekilibra_spa/app/pages/profile/model/profile.dart';
import 'package:ekilibra_spa/app/pages/profile/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<bool> deleteProfile(String profileId) async {
    return false;
  }

  @override
  Future<bool> registerProfile(Profile profile) async {
    final profileString = json.encode(profile);
    await SharedPreferencesHelper().saveKey('profile', profileString);
    return true;
  }

  @override
  Future<bool> updateProfile(Profile profile) async {
    final profileString = json.encode(profile);
    await SharedPreferencesHelper().saveKey('profile', profileString);
    return true;
  }

  @override
  Future<Profile?> getProfile() async {
    final String? profileString =
        await SharedPreferencesHelper().getValue('profile');
    if (profileString != null) {
      final data = json.decode(profileString);
      return Profile.fromJson(data);
    }
    return null;
  }
}
