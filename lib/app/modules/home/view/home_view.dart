import 'package:app_mix/app/core/rest_client/firebase.dart';
import 'package:app_mix/app/modules/home/controller/home_controller.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository_impl.dart';
import 'package:app_mix/app/routes/routes.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  SessionRepository repository = SessionRepositoryImpl(
      auth: FirebaseClient.auth(), db: FirebaseClient.db());
  late HomeController homeController = HomeController(repository: repository);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                homeController.signOutUser(context);
                
                Navigator.pushNamed(context, Routes.login);
              },
              icon: Icon(Icons.logout))
        ],
        title: const Text('Home'),
      ),
      body: Container(),
    );
  }
}
