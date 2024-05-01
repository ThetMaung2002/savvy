import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';
import 'package:savvy/constants/static_string.dart';
// import 'package:savvy/components/typo.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.dolla});

  final int? dolla;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              //Main Dashboard which will show total balance left for this month
              const Dashboard(),

              const SizedBox(height: 20.0),

              //Title bar
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Typo(
                      label: "Today Spendings",
                      variant: TypoVariant.title,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Typo(
                        label: "show",
                        variant: TypoVariant.subtitle,
                        color: Color(0xFF4769cf),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      color: Theme.of(context).colorScheme.primary,
      surfaceTintColor: Theme.of(context).colorScheme.onPrimary,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Typo(
              label: "${StaticString.total!} :",
              variant: TypoVariant.title,
            ),
            const SizedBox(height: 8.0),
            Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Typo(
                label: "100,000",
                variant: TypoVariant.subtitle,
                color: Color(0xFF04060b),
              ),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
