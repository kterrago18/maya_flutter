import 'package:flutter/material.dart';
import 'package:maya_flutter/screens/send_money_screen.dart';
import 'package:maya_flutter/screens/transaction_screen.dart';

import '../utils/ui_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  const Icon(Icons.visibility, size: 20,)
                ],
              ),
              UIHelper.verticalSpace(5),
              Text(
                '₱ 14,000.00',
                style: Theme.of(context).textTheme.headlineMedium,
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
}
