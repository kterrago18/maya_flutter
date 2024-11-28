import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maya_flutter/data/models/transaction_log_model.dart';
import 'package:maya_flutter/data/repositories/user_repository.dart';
import 'package:maya_flutter/domain/usecases/get_all_transactions_usecase.dart';
import 'package:maya_flutter/domain/usecases/get_available_balance_usecase.dart';
import 'package:maya_flutter/domain/usecases/send_money_usecase.dart';
import 'package:maya_flutter/domain/usecases/update_balance_usecase.dart';
import 'package:maya_flutter/presentation/cubit/user/user_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_cubit_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  group('UserCubit', () {
    late UserCubit userCubit;
    late UpdateBalanceUseCase updateBalanceUseCase;
    late GetAvailableBalanceUseCase getAvailableBalanceUseCase;
    late GetAllTransactionsUseCase getAllTransactionsUseCase;
    late SendMoneyUseCase sendMoneyUseCase;

    setUp(() {
      final userRepository = MockUserRepository();
      getAllTransactionsUseCase =
          GetAllTransactionsUseCase(userRepository: userRepository);
      getAvailableBalanceUseCase =
          GetAvailableBalanceUseCase(userRepository: userRepository);
      sendMoneyUseCase = SendMoneyUseCase(userRepository: userRepository);
      updateBalanceUseCase =
          UpdateBalanceUseCase(userRepository: userRepository);

      userCubit = UserCubit(
          getAvailableBalanceUseCase: getAvailableBalanceUseCase,
          sendMoneyUseCase: sendMoneyUseCase,
          updateBalanceUseCase: updateBalanceUseCase,
          getAllTransactionsUseCase: getAllTransactionsUseCase);
    });

    tearDown(() {
      userCubit.close();
    });

    test(
        'initial state is UserState(appState: AppState.initital, errorMessage: null, availableBalance: 0, transactions: []))',
        () {
      expect(
        userCubit.state,
        const UserState(
          appState: AppState.initital,
          errorMessage: null,
          availableBalance: 0,
          transactions: [],
        ),
      );
    });

    blocTest<UserCubit, UserState>(
      'emits [] when nothing is called',
      build: () => userCubit,
      expect: () => const <UserState>[],
    );

    blocTest<UserCubit, UserState>(
      'emits [UserState(AppState.loading, null, 0, []), UserState(AppState.initital,null,1000.0,[])] when refreshBalance is called',
      build: () {
        when(getAvailableBalanceUseCase.call()).thenAnswer((_) async => 1000.0);
        return userCubit;
      },
      act: (bloc) => bloc.refreshBalance(),
      expect: () => [
        const UserState(
            appState: AppState.loading,
            errorMessage: null,
            availableBalance: 0,
            transactions: []),
        const UserState(
            appState: AppState.initital,
            errorMessage: null,
            availableBalance: 1000.0,
            transactions: [])
      ],
    );

    List<TransactionLogModel> generateTransactionLogModel(int count) {
      return List<TransactionLogModel>.generate(count, (index) {
        return TransactionLogModel(
          amountValue: index * 100,
          dateAndTimeCreated: DateTime.now().toIso8601String(),
          userCurrentBalance: index * 100,
        );
      });
    }

    test('should generate a fake list of transactions', () {
      final List<TransactionLogModel> users = generateTransactionLogModel(5);

      expect(users.length, 5);
      expect(users[0].amountValue, 0);
      expect(users[1].dateAndTimeCreated, isNotEmpty);
      expect(users[2].userCurrentBalance, 200);
    });

    late List<TransactionLogModel> users;

    blocTest<UserCubit, UserState>(
      'emits [UserState(AppState.initital,null,0,users)] when loadTransactions is called',
      build: () {
        users = generateTransactionLogModel(3);
        when(getAllTransactionsUseCase.call()).thenAnswer((_) async => users);
        return userCubit;
      },
      act: (bloc) => bloc.loadTransactions(),
      expect: () => [
        UserState(
            appState: AppState.initital,
            errorMessage: null,
            availableBalance: 0,
            transactions: users)
      ],
    );

    blocTest<UserCubit, UserState>(
      'emits 3 states when sendMoney is called',
      build: () {
        users = generateTransactionLogModel(1);
        when(sendMoneyUseCase.call(users[0])).thenAnswer((_) async => {});
        return userCubit;
      },
      act: (bloc) => bloc.sendMoney(users[0]),
      expect: () => [
        const UserState(
            appState: AppState.loading,
            errorMessage: null,
            availableBalance: 0,
            transactions: []),
        const UserState(
            appState: AppState.error,
            errorMessage: 'Oops! Something went wrong.',
            availableBalance: 0,
            transactions: []),
        const UserState(
            appState: AppState.error,
            errorMessage: 'Please enter your desire amount.',
            availableBalance: 0,
            transactions: [])
      ],
    );
  });
}
