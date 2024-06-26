import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:savvy/constants/static_string.dart';
import 'package:savvy/firebase_options.dart';
import 'package:savvy/provider/authentication_provider/auth_provider.dart';
import 'package:savvy/provider/authentication_provider/login_provider.dart';
import 'package:savvy/provider/authentication_provider/reisgter_provider.dart';
import 'package:savvy/provider/color_provider/theme_provider.dart';
import 'package:savvy/provider/transaction_provider/add_transaction_provider.dart';
import 'package:savvy/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return multiProviderMethod(context);
  }

  MultiProvider multiProviderMethod(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ThemeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RegisterProvider(),
        ),
      ],
      child: MaterialApp(
        title: StaticString.title,
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).themeData,
        darkTheme: darkTheme,
        home: const AuthProvider(),
      ),
    );
  }
}
