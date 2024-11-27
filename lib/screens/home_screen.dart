import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cubit/wallet_balance_cubit.dart';
import '../utils/ui_helper.dart';

import 'send_money_screen.dart';
import 'transaction_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _walletBalanceCubit = WalletBalanceCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: UIHelper.paddingSpaceXSmall),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              UIHelper.verticalSpaceLarge(),
              Row(
                children: [
                  Text(
                    'Wallet Balance',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  UIHelper.horizontalSpace(10),
                  BlocBuilder<WalletBalanceCubit, WalletBalanceState>(
                    bloc: _walletBalanceCubit,
                    builder: (context, state) {
                      if (state.toggleShowBalance) {
                        return _buildWalletToggleIcon(Icons.visibility,
                            onTap: _walletBalanceCubit.hideBalance);
                      } else {
                        return _buildWalletToggleIcon(Icons.visibility_off,
                            onTap: _walletBalanceCubit.showBalance);
                      }
                    },
                  )
                ],
              ),
              UIHelper.verticalSpace(5),
              BlocBuilder<WalletBalanceCubit, WalletBalanceState>(
                bloc: _walletBalanceCubit,
                builder: (context, state) {
                  return Text(
                    state.toggleShowBalance ? '₱ 14,000.00' : '₱ *****',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
              UIHelper.verticalSpaceXSmall(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: const Text("Send Money"),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => SendMoneyScreen()));
                      },
                    ),
                  ),
                  UIHelper.horizontalSpaceXSmall(),
                  Expanded(
                    child: OutlinedButton(
                      child: const Text("Transactions"),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const TransactionsScreen()));
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWalletToggleIcon(IconData icon, {required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        size: 20,
      ),
    );
  }
}
