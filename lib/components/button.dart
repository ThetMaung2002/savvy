import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';

class Button extends StatelessWidget {
  const Button({super.key, this.onPressed, this.label, this.minWidth});

  final void Function()? onPressed;
  final String? label;
  final double? minWidth;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      minWidth: minWidth,
      onPressed: onPressed,
      color: Theme.of(context).colorScheme.primary,
      highlightElevation: 0.0,
      padding: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Typo(
        label: label!,
        variant: TypoVariant.defaultVariant,
        color: const Color(0xFFf7f9fd),
      ),
    );
  }
}
