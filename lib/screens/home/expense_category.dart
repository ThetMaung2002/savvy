import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';

class ExpenseCategory extends StatelessWidget {
  const ExpenseCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Typo(label: "Expense", variant: TypoVariant.title),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Typo(
              label: "Expense Category",
              variant: TypoVariant.defaultVariant,
            ),
          ],
        ),
      ),
    );
  }
}
