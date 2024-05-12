import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savvy/components/button.dart';
import 'package:savvy/components/input.dart';
import 'package:savvy/components/typo.dart';
import 'package:savvy/constants/static_size.dart';
import 'package:savvy/constants/static_string.dart';
import 'package:savvy/provider/authentication_provider/reisgter_provider.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _usernameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

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
                    context
                        .read<RegisterProvider>()
                        .register(
                          _emailController.text,
                          _passwordController.text,
                          context,
                        )
                        .onError((error, stackTrace) {
                      if (kDebugMode) {
                        print("Error ===> $error");
                      }
                    });

                    context.read<RegisterProvider>().saveUserData(
                        _emailController.text,
                        _usernameController.text,
                        DateTime.now());
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
