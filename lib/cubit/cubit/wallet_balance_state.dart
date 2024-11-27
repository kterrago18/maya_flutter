part of 'wallet_balance_cubit.dart';

@immutable
class WalletBalanceState extends Equatable {
  final bool toggleShowBalance;

  const WalletBalanceState({required this.toggleShowBalance});
  @override
  List<Object?> get props => [toggleShowBalance];

  WalletBalanceState copyWith({
    bool? toggleShowBalance,
  }) {
    return WalletBalanceState(
      toggleShowBalance: toggleShowBalance ?? this.toggleShowBalance,
    );
  }
}
