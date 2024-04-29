import 'package:flutter/material.dart';

class Typo extends StatelessWidget {
  const Typo({
    super.key,
    required this.label,
    required this.variant,
    this.color,
  });

  final String label;
  final TypoVariant variant;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    double size = _getSizeForVariant(variant);
    return Text(
      label,
      style: TextStyle(
        fontSize: size,
        fontFamily: 'Itim',
        color: color,
      ),
    );
  }

  double _getSizeForVariant(TypoVariant variant) {
    switch (variant) {
      case TypoVariant.title:
        return 24.0;
      case TypoVariant.header:
        return 40.0;
      case TypoVariant.label:
        return 12.0;
      case TypoVariant.subtitle:
        return 18.0;
      case TypoVariant.defaultVariant:
      default:
        return 16.0;
    }
  }
}

enum TypoVariant { title, header, label, subtitle, defaultVariant }
