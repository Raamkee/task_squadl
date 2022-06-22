import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_squadl/constants/string_constants.dart';
import 'package:task_squadl/providers/app_provider.dart';
import 'package:task_squadl/providers/home_page_provider.dart';
import 'package:task_squadl/providers/login_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task_squadl/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => AppProvider()),
        ChangeNotifierProvider(create: (context) => HomePageProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: sAppName,
        theme: ThemeData.light().copyWith(
          primaryColor: const Color(0xff7262E3),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
