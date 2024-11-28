import '../../data/models/transaction_log_model.dart';
import '../../data/repositories/user_repository.dart';

class SendMoneyUseCase {
  final UserRepository userRepository;

  SendMoneyUseCase({required this.userRepository});

  Future<void> call(TransactionLogModel transactionModel) async {
    await userRepository.sendMoney(transactionModel);
  }
}
