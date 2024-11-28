import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/get_available_balance_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final GetAvailableBalanceUseCase _getAvailableBalanceUseCase;
  UserCubit({required GetAvailableBalanceUseCase getAvailableBalanceUseCase})
      : _getAvailableBalanceUseCase = getAvailableBalanceUseCase,
        super(UserState.initial());

  Future<void> loadAvailableBalance() async {
    emit(state.copyWith(appState: AppState.loading));
    num availableBalance = 0;
    try {
      availableBalance = await _getAvailableBalanceUseCase.call();

      emit(state.copyWith(
          appState: AppState.loaded, availableBalance: availableBalance));
    } catch (e) {
      emit(state.copyWith(
          appState: AppState.error, availableBalance: availableBalance));
    }
  }
}
