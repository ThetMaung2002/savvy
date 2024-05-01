import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';

class TrackingScreen extends StatelessWidget {
  const TrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Typo(
            label: "Tracking the expenses",
            variant: TypoVariant.defaultVariant),
      ),
    );
  }
}
