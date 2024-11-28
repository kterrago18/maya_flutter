import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../cubit/user/user_cubit.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              return Flexible(
                child: ListView.builder(
                  itemCount: state.transactions.length,
                  itemBuilder: (_, index) {
                    if (state.appState == AppState.loading) {
                      return const Align(
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      );
                    } else if (state.appState == AppState.loaded) {
                      if (state.transactions.isNotEmpty) {
                        var item = state.transactions[index];
                        return _buildListItem(
                          item.dateAndTimeCreated,
                          item.amountValue,
                          item.userCurrentBalance
                        );
                      } else {
                        return const Text(
                          'No available records',
                          textAlign: TextAlign.center,
                        );
                      }
                    }

                    return const Text('Something went wrong');
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(
      String? dateAndTimeCreated, num? amountValue, num? currentBalance) {
    var amountString = NumberFormat.currency(decimalDigits: 2, symbol: '₱')
        .format(amountValue);

    var currentBalanceString =
        NumberFormat.currency(decimalDigits: 2, symbol: '₱')
            .format(currentBalance! - amountValue!);

    var timeagoString =
        timeago.format(DateTime.parse(dateAndTimeCreated ?? ''));
    return Builder(builder: (context) {
      return ListTile(
        title: const Text('Sent'),
        subtitle: Text(timeagoString),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '-$amountString',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              currentBalanceString,
              style: Theme.of(context).textTheme.labelSmall,
            ),
          ],
        ),
      );
    });
  }
}
