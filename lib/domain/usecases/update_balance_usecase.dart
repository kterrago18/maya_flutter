import '../../data/repositories/user_repository.dart';

class UpdateBalanceUseCase {
 final UserRepository userRepository;

  UpdateBalanceUseCase({required this.userRepository});

  Future<void> call(double value) async {
    await userRepository.updateBalance(value);
  }
}