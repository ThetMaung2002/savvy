import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Typo(
          label: "Report",
          variant: TypoVariant.title,
        ),
      ),
    );
  }
}
