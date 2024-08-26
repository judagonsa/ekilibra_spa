import 'package:dartz/dartz.dart';
import 'package:ekilibra_spa/app/pages/profile/model/profile.dart';
import 'package:ekilibra_spa/app/pages/profile/repositories/profile_repository.dart';

class RegisterProfileUseCase {
  final ProfileRepository _profileRepository;

  RegisterProfileUseCase(this._profileRepository);

  Future<Either<bool, bool>> invoke(Profile profile) async {
    try {
      final success = await _profileRepository.registerProfile(profile);
      return success ? Right(success) : Left(success);
    } catch (e) {
      //manejo de logs
      return const Left(false);
    }
  }
}
