import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maya_flutter/presentation/cubit/wallet_balance/wallet_balance_cubit.dart';

void main() {
  group('WalletBalanceCubit', () {
    late WalletBalanceCubit walletBalanceCubit;

    setUp(() {
      walletBalanceCubit = WalletBalanceCubit();
    });

    tearDown(() {
      walletBalanceCubit.close();
    });

    test(
        'initial state is WalletBalanceState(toggleShowBalance: true)',
        () {
      expect(
        walletBalanceCubit.state,
        const WalletBalanceState(toggleShowBalance: true),
      );
    });

    blocTest<WalletBalanceCubit, WalletBalanceState>(
      'emits [] when nothing is called',
      build: () => walletBalanceCubit,
      expect: () => const <WalletBalanceState>[],
    );

    blocTest<WalletBalanceCubit, WalletBalanceState>(
      'emits [WalletBalanceState(toggleShowBalance: false)] when hideBalance is called',
      build: () => walletBalanceCubit,
      act: (bloc) => bloc.hideBalance(),
      expect: () => [
        const WalletBalanceState(toggleShowBalance: false)
      ],
    );

    blocTest<WalletBalanceCubit, WalletBalanceState>(
      'emits [WalletBalanceState(toggleShowBalance: true)] when showBalance is called',
      build: () => walletBalanceCubit,
      act: (bloc) => bloc.showBalance(),
      expect: () => [
        const WalletBalanceState(toggleShowBalance: true)
      ],
    );
  });
}
