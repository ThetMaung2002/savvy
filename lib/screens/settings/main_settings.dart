import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';

class MainSettings extends StatelessWidget {
  const MainSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Typo(
          label: "Settings",
          variant: TypoVariant.title,
        ),
      ),
    );
  }
}
