import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';

class HelpDialog extends StatelessWidget {
  const HelpDialog({super.key, this.title, this.content, this.actions});

  final Typo? title;
  final Typo? content;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title,
      content: content,
      actions: actions,
    );
  }
}
