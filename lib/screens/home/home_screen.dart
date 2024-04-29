import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:savvy/components/dashboard.dart';
import 'package:savvy/components/typo.dart';
import 'package:savvy/constants/static_string.dart';
import 'package:savvy/screens/home/add_report.dart';
import 'package:savvy/screens/home/add_transaction.dart';
import 'package:savvy/screens/home/categories.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.totalSalary});

  final Float? totalSalary;
  final String? totalSalaryString = "100,000";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Typo(label: "Total", variant: TypoVariant.header),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(71, 105, 207, 1),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Typo(
                  label: totalSalaryString!,
                  variant: TypoVariant.subtitle,
                  color: const Color(0xFFf7f9fd),
                ),
              ),
              const SizedBox(height: 20.0),
              const Dashboard(),
            ],
          ),
        ),
      ),
      floatingActionButton: quickBtn(context),
    );
  }

  FloatingActionButton quickBtn(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        quckAccess(context);
      },
      label: Typo(
        label: StaticString.quickAccess!,
        variant: TypoVariant.defaultVariant,
        color: const Color(0xFFf7f9fd),
      ),
      icon: const Icon(Icons.add_chart),
    );
  }

  Future<dynamic> quckAccess(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => Dialog(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          height: 380,
          child: ListView(
            children: <Widget>[
              Typo(
                label: StaticString.quickAccessSetting!,
                variant: TypoVariant.title,
              ),
              const SizedBox(height: 20),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddTransaction(),
                    ),
                  );
                },
                leading: const Icon(Icons.money_rounded),
                title: Typo(
                  label: StaticString.addTransaction!,
                  variant: TypoVariant.subtitle,
                ),
              ),
              const SizedBox(height: 8),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddReport(),
                    ),
                  );
                },
                leading: const Icon(Icons.report),
                title: Typo(
                  label: StaticString.report,
                  variant: TypoVariant.subtitle,
                ),
              ),
              const SizedBox(height: 8),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Categories(),
                    ),
                  );
                },
                leading: const Icon(Icons.category),
                title: Typo(
                  label: StaticString.categories!,
                  variant: TypoVariant.subtitle,
                ),
              ),
              const SizedBox(height: 20.0),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Typo(
                  label: StaticString.close!,
                  variant: TypoVariant.defaultVariant,
                  color: const Color(0xFFf7f9fd),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum Types { cart, box, carryingshit }
