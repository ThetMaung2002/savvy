import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:savvy/models/transaction_models/get_transaction_model.dart';

class GetUserTransactionProvider extends ChangeNotifier {
  Future<List<GetTransacionModel>> getTransaction() async {
    String userEmail = FirebaseAuth.instance.currentUser!.email!;

    // Reference to the user's transactions directly using their email
    CollectionReference transactionsRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userEmail)
        .collection('user_expenses');

    QuerySnapshot transactionQuerySnapshot = await transactionsRef.get();

    List<GetTransacionModel> transactions = [];
    for (var transactionDoc in transactionQuerySnapshot.docs) {
      Object? data = transactionDoc.data();
      GetTransacionModel transaction =
          GetTransacionModel.fromMap(data as Map<String, dynamic>);
      transactions.add(transaction);
    }

    return transactions;
  }
}
