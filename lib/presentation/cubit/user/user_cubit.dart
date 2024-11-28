import 'package:flutter/foundation.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/transaction_log_model.dart';
import '../../../domain/usecases/get_available_balance_usecase.dart';
import '../../../domain/usecases/send_money_usecase.dart';
import '../../../domain/usecases/update_balance_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetAvailableBalanceUseCase _getAvailableBalanceUseCase;
  final SendMoneyUseCase _sendMoneyUseCase;
  final UpdateBalanceUseCase _updateBalanceUseCase;
  UserCubit({
    required GetAvailableBalanceUseCase getAvailableBalanceUseCase,
    required SendMoneyUseCase sendMoneyUseCase,
    required UpdateBalanceUseCase updateBalanceUseCase,
  })  : _getAvailableBalanceUseCase = getAvailableBalanceUseCase,
        _sendMoneyUseCase = sendMoneyUseCase,
        _updateBalanceUseCase = updateBalanceUseCase,
        super(UserState.initial());

  Future<void> loadAvailableBalance() async {
    emit(state.copyWith(appState: AppState.loading, errorMessage: null));
    num availableBalance = 0;
    try {
      availableBalance = await _getAvailableBalanceUseCase.call();

      emit(state.copyWith(
          appState: AppState.loaded,
          availableBalance: availableBalance,
          errorMessage: null));
    } catch (e) {
      debugPrint('## $e');

      emit(state.copyWith(
          appState: AppState.error,
          availableBalance: availableBalance,
          errorMessage: 'Oops! Something went wrong.'));
    }
  }

  Future<void> refreshBalance() async {
    emit(state.copyWith(appState: AppState.loading, errorMessage: null));

    num availableBalance = 0;
    try {
      availableBalance = await _getAvailableBalanceUseCase.call();

      emit(state.copyWith(appState: AppState.initital, errorMessage: null));
    } catch (e) {
      debugPrint('## $e');

      emit(state.copyWith(
          appState: AppState.error,
          availableBalance: availableBalance,
          errorMessage: 'Oops! Something went wrong.'));
    }
  }

  Future<void> sendMoney(TransactionLogModel transactionLogModel) async {
    emit(state.copyWith(appState: AppState.loading, errorMessage: null));

    try {
      await refreshBalance();

      if ((transactionLogModel.amountValue ?? 0) == 0) {
        emit(state.copyWith(
            appState: AppState.error,
            errorMessage: 'Please enter your desire amount.'));
        return;
      } else if ((state.availableBalance ?? 0) <
          (transactionLogModel.amountValue ?? 0)) {
        emit(state.copyWith(
            appState: AppState.error,
            errorMessage: 'Oops! Your balance is insufficient.'));
        return;
      } else {
        var updatedBalance =
            state.availableBalance! - transactionLogModel.amountValue!;

        await _sendMoneyUseCase.call(transactionLogModel);

        await _updateBalanceUseCase.call(updatedBalance);

        await loadAvailableBalance();
      }
    } catch (e) {
      debugPrint('## $e');
      emit(state.copyWith(
          appState: AppState.error,
          errorMessage: 'Oops! Something went wrong.'));
    }
  }
}