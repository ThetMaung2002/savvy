import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';
import 'package:savvy/constants/static_string.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  ///Current logged in user
  final User? _currentUser = FirebaseAuth.instance.currentUser;

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
    return await FirebaseFirestore.instance
        .collection('Users')
        .doc(_currentUser!.email)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Typo(
          label: StaticString.profile,
          variant: TypoVariant.title,
        ),
      ),
      body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        future: getUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            );
          }

          if (snapshot.hasError) {
            return Center(
              child: Typo(
                label: "Error occur! No data found? ${snapshot.error}",
                variant: TypoVariant.defaultVariant,
              ),
            );
          }

          Map<String, dynamic>? user = snapshot.data!.data();

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  profileUI(user),
                  const SizedBox(height: 20.0),
                  const Divider(
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Column profileUI(Map<String, dynamic>? user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        CircleAvatar(
          radius: 48,
          backgroundColor: const Color(0xFF889fe4),
          foregroundColor: const Color(0xFF04060b),
          child: Typo(
              label: user!['username'], variant: TypoVariant.defaultVariant),
        ),
        const SizedBox(height: 20.0),
        Typo(label: user['username'], variant: TypoVariant.title),
        Typo(label: user['email'], variant: TypoVariant.subtitle),
      ],
    );
  }
}
