import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';
import 'package:savvy/constants/static_string.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Typo(
                      label: "${StaticString.total!}:",
                      variant: TypoVariant.title,
                    ),
                    const Typo(label: "100,000", variant: TypoVariant.subtitle),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
