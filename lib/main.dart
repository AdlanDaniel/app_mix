import 'package:app_mix/app/modules/home/view/home_view.dart';
import 'package:app_mix/app/modules/login/view/login_view.dart';
import 'package:app_mix/app/modules/register_users/view/register_users_view.dart';
import 'package:app_mix/app/modules/splash_screen/view/splash_screen_view.dart';
import 'package:app_mix/app/routes/routes.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.initial,
      debugShowCheckedModeBanner: false,
      routes: {
        Routes.initial: (context) => SplashScreenView(),
        Routes.login: (context) => LoginView(),
        Routes.home: (context) => HomeView(),
        Routes.registerUsers: (context) => RegisterUsersView()
      },
    );
  }
}
