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
        backgroundColor: Color(0xFF7C4DFF),
        actions: [
          IconButton(
              onPressed: () async {
                await homeController.signOutUser(context);
              },
              icon: Icon(Icons.logout))
        ],
        title: const Text('Home'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.registerClients);
                  },
                  child: Text('Cadastrar Clientes'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                    Color(0xFF7C4DFF),
                  ))),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.listClients);
                  },
                  child: Text('Listar Clientes'),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                    Color(0xFF7C4DFF),
                  ))),
            ],
          ),
        ),
      ),
    );
  }
}
