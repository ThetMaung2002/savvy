import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addTransaction(double amount, String description) async {
    try {
      //* Get current user's email
      String userEmail = FirebaseAuth.instance.currentUser!.email!;

      //* Get a reference to the Users collection
      CollectionReference usersRef = _db.collection('users');

      //* Query for the document with the email matching the current user's email
      QuerySnapshot userQuerySnapshot =
          await usersRef.where('email', isEqualTo: userEmail).get();

      //* Check if the query returned any documents
      if (userQuerySnapshot.docs.isNotEmpty) {
        //* Get the username from the first document found
        Map<String, dynamic>? userData =
            userQuerySnapshot.docs.first.data() as Map<String, dynamic>?;
        if (userData != null && userData.containsKey('username')) {
          String? username = userData['username'];
          //* Add expense to the User Expenses collection
          CollectionReference expensesRef = _db.collection(
              "user_expenses_$userEmail"); //* Assuming each user has their expense collection
          await expensesRef.add({
            'amount': amount,
            'description': description,
            'timestamp': DateTime.now(),
            'username': username,
          });
          notifyListeners();
        } else {
          //* Handle the case when the username field is missing or null
          debugPrint("Username field missing or null in user document");
        }
      } else {
        //* Handle the case when no user document is found for the current user's email
        debugPrint("No user document found for email: $userEmail");
      }
    } catch (error) {
      //* Handle any errors that occur during the process
      debugPrint("Error adding expense: $error");
    }
  }
}
