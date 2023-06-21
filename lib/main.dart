import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nepaltop/firebase_options.dart';
import 'package:nepaltop/items/theme_page.dart';
import 'package:nepaltop/pages/auth_page.dart';
import 'package:provider/provider.dart';
// import 'package:nepaltop/register_page.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(),
    child: MyApp(),
  ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, themeNotifier, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeNotifier.isDarkMode? ThemeData.dark() : ThemeData.light(),
          home: const  AuthPage(),
        );
      },
    );
  }
}
