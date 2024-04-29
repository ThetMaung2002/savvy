import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';

class AddReport extends StatelessWidget {
  const AddReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Typo(label: "Report", variant: TypoVariant.title),
      ),
      body: const Center(
        child: Typo(label: "Report", variant: TypoVariant.title),
      ),
    );
  }
}
