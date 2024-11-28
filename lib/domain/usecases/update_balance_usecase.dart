import '../../data/repositories/user_repository.dart';

class UpdateBalanceUseCase {
 final UserRepository userRepository;

  UpdateBalanceUseCase({required this.userRepository});

  Future<void> call(num value) async {
    await userRepository.updateBalance(value);
  }
}