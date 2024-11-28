import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maya_flutter/presentation/cubit/user/user_cubit.dart';
import 'package:maya_flutter/domain/usecases/get_available_balance_usecase.dart';

import 'presentation/cubit/wallet_balance/wallet_balance_cubit.dart';
import 'data/repositories/user_repository.dart';
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
                      userRepository: context.read<UserRepository>()))),
          BlocProvider(
            create: (_) => WalletBalanceCubit(),
          ),
        ],
        child: MaterialApp(
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
