import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Typo(
          label: "Wallet",
          variant: TypoVariant.defaultVariant,
        ),
      ),
    );
  }
}
