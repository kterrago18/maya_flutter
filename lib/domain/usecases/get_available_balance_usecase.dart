import 'package:maya_flutter/data/repositories/user_repository.dart';

class GetAvailableBalanceUseCase {
  final UserRepository userRepository;

  GetAvailableBalanceUseCase({required this.userRepository});

  Future<num> call() async {
    return await userRepository.getAvailableBalance();
  }
}
