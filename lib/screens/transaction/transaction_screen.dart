import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';

class TransactionScreen extends StatelessWidget {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Typo(label: "Transaction", variant: TypoVariant.title),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(Icons.attach_money),
      ),
    );
  }
}
