import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savvy/components/input.dart';
import 'package:savvy/components/typo.dart';
import 'package:savvy/constants/static_string.dart';
import 'package:savvy/provider/transaction_provider/add_transaction_provider.dart';

class TransacScreen extends StatefulWidget {
  const TransacScreen({super.key});

  @override
  State<TransacScreen> createState() => _TransacScreenState();
}

class _TransacScreenState extends State<TransacScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController expenseTransactionController =
      TextEditingController();

  // Consider using a Money class or dedicated libraries for currency handling
  final Map<String, num> transactionData = {
    "Bus Service": 1000,
    "Lunch Service": 800,
    "Dinner Service": 5000,
  };

  final List<String> transactionTitles = [];

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
      itemCount: transactionTitles.length,
      itemBuilder: ((context, index) {
        final String title = transactionTitles[index];
        final num amount = transactionData[title]!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            tileColor: const Color.fromRGBO(158, 158, 158, 0.2),
            textColor: Theme.of(context).colorScheme.onSecondary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            title: Typo(
              label: title,
              variant: TypoVariant.title,
            ),
            subtitle: Typo(
              label: "${amount.toString()} kyats",
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
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Typo(
              label: "Transaction",
              variant: TypoVariant.title,
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Input(
                  securePassword: false,
                  placehodler: "Title",
                  controller: titleController,
                ),
                const SizedBox(height: 20),
                Input(
                  securePassword: false,
                  placehodler: "Transaction",
                  controller: expenseTransactionController,
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Typo(
                  label: StaticString.cancel!,
                  variant: TypoVariant.defaultVariant,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Pop circle progress indicator

                  // Error occur

                  // Add transaction

                  final title = titleController.text;
                  final amount = num.tryParse(
                    expenseTransactionController.text,
                  );
                  context.read<TransactionProvider>().addTransaction(
                        amount!,
                        title,
                      );
                  titleController.clear();
                  expenseTransactionController.clear();
                  Navigator.pop(context);
                },
                child: Typo(
                  label: StaticString.confirm!,
                  variant: TypoVariant.defaultVariant,
                ),
              ),
            ],
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
