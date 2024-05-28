import 'package:flutter/material.dart';
import 'package:savvy/models/transaction_models/get_transaction_model.dart';
import 'package:savvy/provider/transaction_provider/get_user_transaction_provider.dart';
import 'package:savvy/screens/transaction/add_transaction_page.dart';

class TransacScreen extends StatelessWidget {
  const TransacScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<GetTransacionModel>>(
        future: GetUserTransactionProvider().getTransaction(),
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
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text('No transactions found.'),
            );
          }

          final transactions = snapshot.data!;
          return ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ListTile(
                  leading: Icon(
                    transaction.amount < 0
                        ? Icons.arrow_downward
                        : Icons.arrow_upward,
                    color: transaction.amount < 0 ? Colors.red : Colors.green,
                  ),
                  title: Text(transaction.description),
                  subtitle: Text(
                      'Amount: \$${transaction.amount.toStringAsFixed(2)}\nDate: $transaction'),
                  trailing: Text('Category: $transaction'),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => AddTransactionPage()),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
