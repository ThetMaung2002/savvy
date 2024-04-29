import 'package:flutter/material.dart';
import 'package:savvy/components/button.dart';
import 'package:savvy/components/input.dart';
import 'package:savvy/components/typo.dart';
import 'package:savvy/constants/static_size.dart';
import 'package:savvy/constants/static_string.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: loginBodyView(context),
    );
  }

  Container loginBodyView(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Typo(
            label: StaticString.title,
            variant: TypoVariant.header,
            color: Colors.white,
          ),
          const SizedBox(height: 32),
          Container(
            width: double.infinity,
            height: 660,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 32.0, left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Typo(
                    label: StaticString.welcome,
                    variant: TypoVariant.title,
                    color: const Color(0xFF4769cf),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Typo(
                        label: StaticString.intro,
                        variant: TypoVariant.defaultVariant,
                        color: const Color(0xFF4769cf),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Input(
                          securePassword: false,
                          controller: _emailController,
                          placehodler: StaticString.emailHolder,
                        ),
                        const SizedBox(height: 32),
                        Input(
                          securePassword: true,
                          controller: _passwordController,
                          placehodler: StaticString.passwordHolder,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const Typo(
                                label: "Forgot your password?",
                                variant: TypoVariant.label,
                                color: Color(0xFF4769cf),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
                        Button(
                          minWidth: StaticSize.loginButton,
                          onPressed: () {},
                          label: "Login",
                        ),
                        const SizedBox(height: 16),
                        customDivider(),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton.filled(
                              onPressed: () {},
                              icon: const Icon(Icons.facebook),
                              iconSize: 32,
                            ),
                            const SizedBox(width: 40),
                            IconButton.filled(
                              onPressed: () {},
                              icon: const Icon(Icons.apple),
                              iconSize: 32,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Typo(
                              label: "Create a new account?",
                              variant: TypoVariant.defaultVariant,
                            ),
                            const SizedBox(width: 8),
                            GestureDetector(
                              onTap: () {},
                              child: const Typo(
                                label: "New",
                                variant: TypoVariant.defaultVariant,
                                color: Color(0xFF4769cf),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Expanded customDivider() {
    return const Expanded(
      flex: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Divider(
            thickness: 1,
          ),
          Typo(
            label: "Or",
            variant: TypoVariant.label,
          ),
          Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
