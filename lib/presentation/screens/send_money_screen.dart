import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/text_input_filter.dart';
import '../../core/utils/ui_helper.dart';
import '../../data/models/transaction_log_model.dart';
import '../cubit/user/user_cubit.dart';

class SendMoneyScreen extends StatelessWidget {
  SendMoneyScreen({super.key});

  final _amountTextEdittingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Send Money')),
      body: BlocListener<UserCubit, UserState>(
        listener: (context, state) {
          if (state.appState == AppState.error) {
            ScaffoldMessenger.of(context).showSnackBar(
                _showSnackbar(state.errorMessage ?? '', Colors.deepOrange));
          }

          if (state.appState == AppState.loaded) {
            ScaffoldMessenger.of(context).showSnackBar(_showSnackbar(
                'Success! Your money has been sent!', Colors.green[700]));
          }
        },
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: UIHelper.paddingSpaceXSmall),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              UIHelper.verticalSpaceLarge(),
              TextField(
                controller: _amountTextEdittingController,
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter amount',
                ),
                inputFormatters: [
                  TextInputFilter.limitToAmountOnly(),
                ],
              ),
              UIHelper.verticalSpaceXSmall(),
              _buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return Builder(builder: (context) {
      var userCubit = context.watch<UserCubit>();
      return BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state.appState == AppState.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ElevatedButton(
            child: const Text("Submit"),
            onPressed: () {
              userCubit.sendMoney(
                TransactionLogModel(
                    amountValue: _amountTextEdittingController.text.isEmpty
                        ? 0
                        : double.parse(_amountTextEdittingController.text),
                    userCurrentBalance: state.availableBalance),
              );
            },
          );
        },
      );
    });
  }

  SnackBar _showSnackbar(String message, Color? backgroundColor) {
    return SnackBar(
      backgroundColor: backgroundColor,
      content: Text(message),
    );
  }
}
