import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';

class TransacScreen extends StatefulWidget {
  const TransacScreen({super.key});

  @override
  State<TransacScreen> createState() => _TransacScreenState();
}

class _TransacScreenState extends State<TransacScreen> {
  Map<String, dynamic> transactionData = {
    "Bus Service": 1000,
    "Lunch Service": 800,
    "Dinner Service": 5000,
  };

  List<String> transactionAmount = [
    "Bus Service",
    "Lunch Service",
    "Dinner Service",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _transactionListView(),
      floatingActionButton: addTransactionAmount(),
    );
  }

  ListView _transactionListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      scrollDirection: Axis.vertical,
      itemCount: transactionAmount.length,
      itemBuilder: ((context, index) {
        String key = transactionAmount[index];
        String value = transactionData[key].toString();

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            tileColor: const Color.fromRGBO(158, 158, 158, 0.2),
            textColor: Theme.of(context).colorScheme.onSecondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            onTap: () {},
            title: Typo(
              label: key,
              variant: TypoVariant.title,
            ),
            subtitle: Typo(
              label: "$value kyats",
              variant: TypoVariant.subtitle,
            ),
          ),
        );
      }),
    );
  }

  FloatingActionButton addTransactionAmount() {
    return FloatingActionButton(
      shape: const CircleBorder(),
      onPressed: () {
        ChangeNotifier();
      },
      child: const Icon(Icons.add),
    );
  }
}
