import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Transactions')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) {
          return const ListTile(
            title: Text('Sent'),
            subtitle: Text('a moment ago'),
            trailing: Text('-₱ 500.00'),
          );
        },
      ),
    );
  }
}
