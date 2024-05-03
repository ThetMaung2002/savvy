import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:savvy/components/typo.dart';
import 'package:savvy/constants/static_string.dart';
import 'package:savvy/screens/home/home_screen.dart';
import 'package:savvy/screens/notifications/notification_screen.dart';
import 'package:savvy/screens/profile/profile_screen.dart';
import 'package:savvy/screens/settings/main_settings.dart';
import 'package:savvy/screens/transaction/transaction_screen.dart';
import 'package:savvy/screens/wallet/wallet_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  List<Widget> body = const [
    HomeScreen(),
    TransacScreen(),
    WalletScreen(),
  ];

  List<Widget> title = [
    Typo(
      label: StaticString.home!,
      variant: TypoVariant.title,
    ),
    Typo(
      label: StaticString.transaction,
      variant: TypoVariant.title,
    ),
    Typo(
      label: StaticString.wallet!,
      variant: TypoVariant.title,
    ),
  ];

  MenuItem? indexItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title[_currentIndex],
        actions: <Widget>[
          IconButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationScreen(),
              ),
            ),
            icon: const Icon(
              Icons.notifications,
            ),
          ),
          menuIconButtonMethod(),
        ],
      ),
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.attach_money),
            label: "Transaction",
          ),
          NavigationDestination(
            icon: Icon(Icons.wallet),
            label: "Wallet",
          ),
        ],
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  PopupMenuButton<MenuItem> menuIconButtonMethod() {
    return PopupMenuButton<MenuItem>(
      initialValue: indexItem,
      onSelected: (MenuItem item) {
        setState(() {
          indexItem = item;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuItem>>[
        PopupMenuItem<MenuItem>(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainSettings(),
            ),
          ),
          value: MenuItem.setting,
          child: const Typo(
            label: "Setting",
            variant: TypoVariant.defaultVariant,
          ),
        ),
        PopupMenuItem<MenuItem>(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProfileScreen(),
            ),
          ),
          value: MenuItem.profile,
          child: const Typo(
            label: "Profile",
            variant: TypoVariant.defaultVariant,
          ),
        ),
        PopupMenuItem<MenuItem>(
          onTap: () async {
            logoutDialog(context);
          },
          value: MenuItem.logout,
          child: const Typo(
            label: "Logout",
            variant: TypoVariant.defaultVariant,
          ),
        ),
      ],
    );
  }

  Future<dynamic> logoutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Typo(
          label: "Logout",
          variant: TypoVariant.title,
        ),
        content: const Typo(
          label: "Do you want to log out?",
          variant: TypoVariant.subtitle,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Typo(
              label: "Cancel",
              variant: TypoVariant.defaultVariant,
            ),
          ),
          TextButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              // ignore: use_build_context_synchronously
              Navigator.pop(context);
            },
            child: const Typo(
              label: "Logout",
              variant: TypoVariant.defaultVariant,
            ),
          ),
        ],
      ),
    );
  }
}

enum MenuItem { setting, profile, logout }
