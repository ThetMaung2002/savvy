import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';
import 'package:savvy/screens/transaction/add_transaction_page.dart';

class TransacScreen extends StatelessWidget {
  const TransacScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Typo(label: "Great one", variant: TypoVariant.defaultVariant),
      ),
      floatingActionButton: addTransactionAmount(context),
    );
  }

  FloatingActionButton addTransactionAmount(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () => Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => AddTransactionPage())),
      child: const Icon(Icons.add),
    );
  }
}
