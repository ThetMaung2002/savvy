import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';
import 'package:savvy/screens/home/expense_category.dart';
import 'package:savvy/screens/home/spending_category.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, this.totalAmount});

  final num? totalAmount;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();

  Map<String, dynamic> userBalance = {
    "Total Amount": "100,000£",
    "Remaining Amount": "1,000£",
    "Spent Amount": "98,000£",
    "Saving Amount": "1,000£"
  };

  List<String> balanceKeys = [
    "Total Amount",
    "Remaining Amount",
    "Spent Amount",
    "Saving Amount",
  ];

  List<Color> colorCard = [
    const Color.fromRGBO(244, 67, 54, 0.6),
    const Color.fromRGBO(33, 150, 243, 0.6),
    const Color.fromRGBO(76, 175, 80, 0.6),
    const Color.fromRGBO(233, 30, 99, 0.6)
  ];

  List<String> demoTitle = [
    "Number: 1",
    "Number: 2",
    "Number: 3",
    "Number: 4",
    "Number: 5",
    "Number: 6",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 100,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: userBalance.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return buildCard(index);
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              expenseCategory(),
              const SizedBox(height: 20.0),
              spendingCategory(),
            ],
          ),
        ),
      ),
    );
  }

  Container spendingCategory() {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Typo(
                label: "Spending",
                variant: TypoVariant.title,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SpendingCategory(),
                    ),
                  );
                },
                child: const Typo(
                  label: "show",
                  variant: TypoVariant.defaultVariant,
                  color: Colors.purpleAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: demoTitle.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Typo(
                          label: demoTitle[index],
                          variant: TypoVariant.defaultVariant),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container expenseCategory() {
    return Container(
      decoration: const BoxDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Typo(
                label: "Expenses",
                variant: TypoVariant.title,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExpenseCategory(),
                    ),
                  );
                },
                child: const Typo(
                  label: "show",
                  variant: TypoVariant.defaultVariant,
                  color: Colors.redAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          SizedBox(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: demoTitle.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Typo(
                          label: demoTitle[index],
                          variant: TypoVariant.defaultVariant),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCard(int index) {
    String key = balanceKeys[index];
    String value = userBalance[key].toString();
    Color colors = colorCard[index];
    return Card(
      color: colors,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              key,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
