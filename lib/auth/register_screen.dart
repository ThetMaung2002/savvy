import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:savvy/components/button.dart';
import 'package:savvy/components/input.dart';
import 'package:savvy/components/typo.dart';
import 'package:savvy/constants/static_size.dart';
import 'package:savvy/constants/static_string.dart';
import 'package:savvy/helper/help_dialog.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  void register() async {
    showDialog(
      context: context,
      builder: ((context) => const Center(
            child: CircularProgressIndicator(),
          )),
    );

    try {
      UserCredential userDoc =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      createUserDoc(userDoc);

      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showDialog(
        context: context,
        builder: (context) => HelpDialog(
          title: const Typo(
            label: "Error Alert",
            variant: TypoVariant.title,
          ),
          content: Typo(label: e.code, variant: TypoVariant.subtitle),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Typo(
                label: "Close",
                variant: TypoVariant.defaultVariant,
              ),
            )
          ],
        ),
      );
    }
  }

  Future<void> createUserDoc(UserCredential? userCredential) async {
    if (userCredential != null && userCredential.user != null) {
      await FirebaseFirestore.instance
          .collection("Users")
          .doc(userCredential.user!.email)
          .set({
        'email': userCredential.user!.email,
        'username': _usernameController.text
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Typo(
          label: StaticString.registration,
          variant: TypoVariant.title,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Typo(
                label: "Welcome to Savvy",
                variant: TypoVariant.title,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 8),
              Typo(
                label: "Become a Savvy Member, Please Create Your Profile",
                variant: TypoVariant.defaultVariant,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 16.0),
              Input(
                securePassword: false,
                placehodler: StaticString.username,
                controller: _usernameController,
              ),
              const SizedBox(height: 16.0),
              Input(
                securePassword: false,
                placehodler: StaticString.emailHolder,
                controller: _emailController,
              ),
              const SizedBox(height: 16.0),
              Input(
                securePassword: true,
                placehodler: StaticString.passwordHolder,
                controller: _passwordController,
              ),
              const SizedBox(height: 32.0),
              Align(
                alignment: Alignment.center,
                child: Button(
                  onPressed: () {
                    register();
                  },
                  label: "Submit",
                  minWidth: StaticSize.confirmButton,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
