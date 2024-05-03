import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';

class TransacScreen extends StatefulWidget {
  const TransacScreen({super.key});

  @override
  State<TransacScreen> createState() => _TransacScreenState();
}

class _TransacScreenState extends State<TransacScreen> {
  List<String> transactionAmount = [
    "1000£ for Golden Burger",
    "1000£ for Golden Burger",
    "1000£ for Golden Burger",
    "1000£ for Golden Burger",
    "1000£ for Golden Burger",
    "1000£ for Golden Burger",
    "1000£ for Golden Burger",
    "1000£ for Golden Burger",
    "1000£ for Golden Burger",
    "1000£ for Golden Burger",
    "1000£ for Golden Burger",
    "1000£ for Golden Burger",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        scrollDirection: Axis.vertical,
        itemCount: transactionAmount.length,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              tileColor: Theme.of(context).colorScheme.secondary,
              textColor: Theme.of(context).colorScheme.onSecondary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              onTap: () {},
              title: Typo(
                label: transactionAmount[index],
                variant: TypoVariant.defaultVariant,
              ),
            ),
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
