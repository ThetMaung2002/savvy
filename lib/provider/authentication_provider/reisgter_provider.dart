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
      notifyListeners();
    } on FirebaseAuthException catch (error) {
      if (kDebugMode) {
        print("Error: ${error.code}");
      }
    }

    if (context.mounted) Navigator.pop(context);
  }
}
