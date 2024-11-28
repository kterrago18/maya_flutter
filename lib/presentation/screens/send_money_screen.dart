import 'package:flutter/material.dart';

import '../../core/utils/text_input_filter.dart';
import '../../core/utils/ui_helper.dart';

class SendMoneyScreen extends StatelessWidget {
  SendMoneyScreen({super.key});

  final _amountTextEdittingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Send Money')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: UIHelper.paddingSpaceXSmall),
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
            ElevatedButton(
              child: const Text("Submit"),
              onPressed: () {
                //Oops! Something went wrong!
                ScaffoldMessenger.of(context).showSnackBar(
                    _showSnackbar('Success! Your money has been sent!'));
              },
            ),
          ],
        ),
      ),
    );
  }

  SnackBar _showSnackbar(String message) {
    return SnackBar(
      content: Text(message),
    );
  }
}
