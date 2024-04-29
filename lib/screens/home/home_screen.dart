import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.dolla});

  final int? dolla;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Typo(
                      label: "Total:",
                      variant: TypoVariant.title,
                    ),
                  ],
                ),
              ),
            ),
            Typo(
              label: "Home",
              variant: TypoVariant.title,
            ),
          ],
        ),
      ),
    );
  }
}
