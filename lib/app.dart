import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/repositories/user_repository.dart';
import 'domain/usecases/get_all_transactions_usecase.dart';
import 'domain/usecases/get_available_balance_usecase.dart';
import 'domain/usecases/send_money_usecase.dart';
import 'domain/usecases/update_balance_usecase.dart';
import 'presentation/cubit/user/user_cubit.dart';
import 'presentation/cubit/wallet_balance/wallet_balance_cubit.dart';
import 'presentation/screens/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => UserRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => UserCubit(
                    getAvailableBalanceUseCase: GetAvailableBalanceUseCase(
                        userRepository: context.read<UserRepository>()),
                    sendMoneyUseCase: SendMoneyUseCase(
                        userRepository: context.read<UserRepository>()),
                    updateBalanceUseCase: UpdateBalanceUseCase(
                        userRepository: context.read<UserRepository>()),
                    getAllTransactionsUseCase: GetAllTransactionsUseCase(
                        userRepository: context.read<UserRepository>()),
                  )),
          BlocProvider(
            create: (_) => WalletBalanceCubit(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: HomeScreen(),
        ),
      ),
    );
  }
}
