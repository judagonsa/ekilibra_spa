import 'dart:convert';

import 'package:ekilibra_spa/app/pages/profile/model/profile.dart';
import 'package:ekilibra_spa/app/pages/profile/repositories/profile_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  @override
  Future<bool> deleteProfile(String profileId) async {
    return false;
  }

  @override
  Future<bool> registerProfile(Profile profile) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final profileString = json.encode(profile);
    await prefs.setString('profile', profileString);
    return true;
  }

  @override
  Future<bool> updateProfile(Profile profile) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final profileString = json.encode(profile);
    await prefs.setString('profile', profileString);
    return true;
  }

  @override
  Future<Profile?> getProfile(String phoneNumber) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? profileString = prefs.getString('profile');
    if (profileString != null) {
      final data = json.decode(profileString);
      return Profile.fromJson(data);
    }
    return null;
  }
}
