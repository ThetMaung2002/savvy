import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GetUserTransactionProvider extends ChangeNotifier {
  Future<List<Transaction>> getTransaction() async {
    String user = FirebaseAuth.instance.currentUser!.email!;

    CollectionReference usersRef =
        FirebaseFirestore.instance.collection('users');

    QuerySnapshot userQuerySnapshot =
        await usersRef.where('email', isEqualTo: user).get();

    if (userQuerySnapshot.docs.isNotEmpty) {
      CollectionReference transactionsRef = usersRef
          .doc(userQuerySnapshot.docs.first.id)
          .collection('user_expenses')
          .doc() as CollectionReference<Object?>;

      QuerySnapshot transactionQuerySnapshot = await transactionsRef.get();

      List<Transaction> transactions = [];
      for (var transactionDoc in transactionQuerySnapshot.docs) {
        Object? data = transactionDoc.data();
        Transaction transaction =
            Transaction.fromMap(data as Map<String, dynamic>);
        transactions.add(transaction);
      }

      notifyListeners();

      dispose();

      return transactions;
    } else {
      return [];
    }
  }
}

class Transaction {
  final double amount;
  final String description;
  final Timestamp timestamp;

  Transaction({
    required this.amount,
    required this.description,
    required this.timestamp,
  });

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      amount: map['amount'],
      description: map['description'],
      timestamp: map['timestamp'],
    );
  }
}
