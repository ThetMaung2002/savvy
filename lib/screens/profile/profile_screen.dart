import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';
import 'package:savvy/constants/static_string.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Typo(
          label: StaticString.profile,
          variant: TypoVariant.title,
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('Users').snapshots(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return const Typo(
              label: "label",
              variant: TypoVariant.defaultVariant,
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final users = snapshot.data!.docs;

          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];

              return ListTile(
                onTap: () {},
                leading: const CircleAvatar(
                  radius: 40,
                  child: Icon(
                    Icons.person_3,
                  ),
                ),
                title: Typo(
                  label: "${user['username']}",
                  variant: TypoVariant.title,
                ),
                subtitle: Typo(
                  label: "${user['email']}",
                  variant: TypoVariant.subtitle,
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
