import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'wallet_balance_state.dart';

class WalletBalanceCubit extends Cubit<WalletBalanceState> {
  WalletBalanceCubit()
      : super(const WalletBalanceState(toggleShowBalance: true));

  void showBalance() {
    emit(state.copyWith(toggleShowBalance: true));
  }

  void hideBalance() {
    emit(state.copyWith(toggleShowBalance: false));
  }
}
