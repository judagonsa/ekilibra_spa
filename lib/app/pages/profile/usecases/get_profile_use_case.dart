import 'package:dartz/dartz.dart';
import 'package:ekilibra_spa/app/pages/profile/model/profile.dart';
import 'package:ekilibra_spa/app/pages/profile/repositories/profile_repository.dart';

class GetProfileUseCase {
  final ProfileRepository _profileRepository;

  GetProfileUseCase(this._profileRepository);

  Future<Either<bool, Profile>> invoke(String phoneNumber) async {
    try {
      final success = await _profileRepository.getProfile(phoneNumber);
      return success != null ? Right(success) : const Left(false);
    } catch (e) {
      //manejo de logs
      return const Left(false);
    }
  }
}
