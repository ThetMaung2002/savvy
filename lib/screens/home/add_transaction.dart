import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';

class AddTransaction extends StatelessWidget {
  const AddTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Typo(label: "Add Transaction", variant: TypoVariant.title),
      ),
      body: const Center(
        child: Typo(label: "Add Transaction", variant: TypoVariant.header),
      ),
    );
  }
}
