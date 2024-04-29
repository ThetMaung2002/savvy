import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';
import 'package:savvy/constants/static_string.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Typo(label: StaticString.notification, variant: TypoVariant.title),
      ),
      body: const Center(
        child: Typo(
          label: "Notification Screen",
          variant: TypoVariant.defaultVariant,
        ),
      ),
    );
  }
}
