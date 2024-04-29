import 'package:flutter/material.dart';
import 'package:savvy/components/button.dart';
import 'package:savvy/components/input.dart';
import 'package:savvy/components/typo.dart';
import 'package:savvy/constants/static_size.dart';
import 'package:savvy/constants/static_string.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Typo(
          label: StaticString.forgetPassword,
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
            children: [
              Typo(
                label: StaticString.resetpassword,
                variant: TypoVariant.title,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 8.0),
              Typo(
                label: StaticString.fogetdescription,
                variant: TypoVariant.defaultVariant,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 20.0),
              const Input(
                placehodler: "Enter your email",
                securePassword: false,
              ),
              const SizedBox(height: 40.0),
              Align(
                alignment: Alignment.center,
                child: Button(
                  onPressed: () {},
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
