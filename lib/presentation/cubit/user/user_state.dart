part of 'user_cubit.dart';

enum AppState { initital, loading, loaded, error }

class UserState extends Equatable {
  final AppState appState;
  final String? errorMessage;
  final num? availableBalance;
  final List<TransactionLogModel> transactions;
  const UserState(
      {this.errorMessage,
      this.availableBalance,
      required this.appState,
      required this.transactions});

  static UserState initial() => const UserState(
      appState: AppState.initital,
      availableBalance: 0,
      errorMessage: null,
      transactions: []);

  @override
  List<Object?> get props =>
      [appState, availableBalance, errorMessage, transactions];

  UserState copyWith({
    AppState? appState,
    num? availableBalance,
    String? errorMessage,
    List<TransactionLogModel>? transactions,
  }) {
    return UserState(
      appState: appState ?? this.appState,
      availableBalance: availableBalance ?? this.availableBalance,
      errorMessage: errorMessage ?? this.errorMessage,
      transactions: transactions ?? this.transactions,
    );
  }
}
