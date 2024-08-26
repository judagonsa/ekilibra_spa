import 'package:dartz/dartz.dart';
import 'package:ekilibra_spa/app/pages/profile/repositories/profile_repository.dart';

class DeleteProfileUseCase {
  final ProfileRepository _profileRepository;

  DeleteProfileUseCase(this._profileRepository);

  Future<Either<bool, bool>> invoke(String profileId) async {
    try {
      final success = await _profileRepository.deleteProfile(profileId);
      return success ? Right(success) : Left(success);
    } catch (e) {
      //manejo de logs
      return const Left(false);
    }
  }
}
