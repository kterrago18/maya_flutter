import '../../data/models/transaction_log_model.dart';

abstract class IUserRepository {
  Future<num> getAvailableBalance();
  Future<void> addTransaction(TransactionLogModel transactionModel);
  Future<void> sendMoney(TransactionLogModel transactionModel);
  Future<void> updateBalance(double value);
  Future<List<TransactionLogModel>> loadTransactions();
}
