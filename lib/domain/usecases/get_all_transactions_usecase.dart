import '../../data/models/transaction_log_model.dart';
import '../../data/repositories/user_repository.dart';

class GetAllTransactionsUseCase {
  final UserRepository userRepository;

  GetAllTransactionsUseCase({required this.userRepository});

  Future<List<TransactionLogModel>> call() async {
    return await userRepository.loadTransactions();
  }
}
