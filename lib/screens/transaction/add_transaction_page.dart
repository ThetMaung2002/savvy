import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savvy/components/button.dart';
import 'package:savvy/components/typo.dart';
import 'package:savvy/constants/static_string.dart';
import 'package:savvy/provider/authentication_provider/reisgter_provider.dart';
import 'package:savvy/provider/transaction_provider/add_transaction_provider.dart';

class AddTransactionPage extends StatelessWidget {
  AddTransactionPage({super.key});

  final TextEditingController _amountController = TextEditingController();

  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            const Typo(label: addTransactionPage, variant: TypoVariant.title),
      ),
      body: FutureBuilder(
        future: getUserData(context),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error fetching user data'),
            );
          } else {
            String username = snapshot.data ?? '';
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _amountController,
                    decoration: const InputDecoration(
                      labelText: 'Amount',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Description',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Button(
                      minWidth: double.minPositive,
                      onPressed: () =>
                          context.read<TransactionProvider>().addTransaction(
                                double.parse(_amountController.text),
                                _descriptionController.text,
                              ),
                      label: "Add Transaction",
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Future<String> getUserData(BuildContext? context) async {
    try {
      String userEmail = FirebaseAuth.instance.currentUser!.email!;

      DocumentSnapshot? userSnapshot =
          await context!.watch<RegisterProvider>().getUserDocument(userEmail);

      if (userSnapshot!.exists) {
        String username = userSnapshot['username'];
        return username;
      } else {
        return 'Unknown';
      }
    } catch (error) {
      return 'Error';
    }
  }
}
