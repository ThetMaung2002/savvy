import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';
import 'package:savvy/provider/transaction_provider/get_user_transaction_provider.dart';
import 'package:savvy/screens/transaction/add_transaction_page.dart';

class TransacScreen extends StatelessWidget {
  const TransacScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Transaction>>(
        future: GetUserTransactionProvider()
            .getTransaction(), // Pass the name of the user
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }
          final transactions = snapshot.data!;
          return ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return Card(
                elevation: 1,
                color: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Typo(
                      label: transaction.description,
                      variant: TypoVariant.title,
                    ),
                    const SizedBox(height: 20),
                    Typo(
                      label: "${transaction.amount}",
                      variant: TypoVariant.subtitle,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddTransactionPage()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
