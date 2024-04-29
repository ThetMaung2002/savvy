import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:savvy/constants/static_string.dart';
import 'package:savvy/firebase_options.dart';
// import 'package:savvy/firebase_options.dart';
// import 'package:savvy/layouts/desktop_scaffold.dart';
// import 'package:savvy/layouts/mobile_scaffold.dart';
// import 'package:savvy/layouts/tablet_scaffold.dart';
import 'package:savvy/provider/auth_provider.dart';
import 'package:savvy/provider/theme_provider.dart';
// import 'package:savvy/responsive_layouts.dart';
import 'package:savvy/utils/theme.dart';

void main() async {
  GoogleFonts.config.allowRuntimeFetching = false;
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
    return MaterialApp(
      title: StaticString.title,
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      darkTheme: darkTheme,
      home: const AuthProvider(),
      // home: const ResponsiveLayouts(
      //   mobileScaffold: MobileScaffold(),
      //   tabletScaffold: TabletScaffold(),
      //   desktopScaffold: DesktopScaffold(),
      // ),
    );
  }
}
