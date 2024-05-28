import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  User? get user => _user;

  Future<void> register(
    String email,
    String password,
    BuildContext context,
  ) async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // After successfully creating the user, you can retrieve the user document
      // and perform any additional actions if needed.
      DocumentSnapshot? userDocument = await getUserDocument(email);

      // Example usage of user document:
      if (userDocument != null) {
        if (kDebugMode) {
          print("User document data: ${userDocument.data()}");
        }
      }
      if (context.mounted) Navigator.of(context).pop();
      notifyListeners();
    } on FirebaseAuthException catch (error) {
      if (kDebugMode) {
        print("Error: ${error.code}");
      }
    }

    if (context.mounted) Navigator.pop(context);
  }

  Future<DocumentSnapshot?> getUserDocument(String email) async {
    try {
      // Get a reference to the "User" collection
      CollectionReference usersRef =
          FirebaseFirestore.instance.collection('User');

      // Query for the document with the email matching the provided email
      QuerySnapshot querySnapshot =
          await usersRef.where('email', isEqualTo: email).get();

      // Check if the query returned any documents
      if (querySnapshot.docs.isNotEmpty) {
        // Return the first document found (assuming there's only one)
        return querySnapshot.docs.first;
      } else {
        // If no document is found with the specified email, return null
        return null;
      }
    } catch (error) {
      // Handle any errors that occur during the process
      return null;
    }
  }

  Future<void> saveUserData(
    String email,
    String username,
    DateTime creationTime,
  ) async {
    try {
      // Get a reference to the "User" collection
      CollectionReference usersRef =
          FirebaseFirestore.instance.collection('users');

      // Add user data to Firestore with email as document ID
      await usersRef.doc(email).set({
        'email': email,
        'username': username,
        'creation_time': creationTime,
      });
    } catch (error) {
      // Handle any errors that occur during the process
      if (kDebugMode) {
        print("Error saving user data: $error");
      }
    }
    notifyListeners();
  }
}
