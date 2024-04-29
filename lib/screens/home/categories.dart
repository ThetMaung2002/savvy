import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Typo(
          label: "Category",
          variant: TypoVariant.title,
        ),
      ),
      body: const Center(
        child: Typo(label: "Category", variant: TypoVariant.title),
      ),
    );
  }
}
