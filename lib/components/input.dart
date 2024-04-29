import 'package:flutter/material.dart';
import 'package:savvy/constants/google_string.dart';

class Input extends StatelessWidget {
  const Input(
      {super.key,
      this.controller,
      this.placehodler,
      required this.securePassword});

  final TextEditingController? controller;
  final String? placehodler;
  final bool securePassword;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: const Color.fromARGB(200, 167, 167, 167),
          width: 1.0,
        ),
      ),
      child: TextField(
        obscureText: securePassword,
        controller: controller,
        cursorColor: Theme.of(context).colorScheme.onSecondary,
        style: TextStyle(
          color: Theme.of(context).colorScheme.onSecondary,
          fontFamily: GoogleString.itim,
        ),
        decoration: InputDecoration.collapsed(
          hintText: placehodler,
          hintStyle: TextStyle(
            color: const Color(0xC67B7B7B),
            fontFamily: GoogleString.itim,
          ),
        ),
      ),
    );
  }
}
