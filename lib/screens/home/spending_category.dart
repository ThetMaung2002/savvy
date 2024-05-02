import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';

class SpendingCategory extends StatelessWidget {
  const SpendingCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Typo(label: "Spending", variant: TypoVariant.title),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Typo(
              label: "Spending Category",
              variant: TypoVariant.defaultVariant,
            ),
          ],
        ),
      ),
    );
  }
}
