import 'package:app_mix/app/core/rest_client/firebase.dart';
import 'package:app_mix/app/modules/register_users/controller/register_user_controller.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository_impl.dart';
import 'package:flutter/material.dart';

import '../../repositories/Models/User_model.dart';

class RegisterUsersView extends StatefulWidget {
  const RegisterUsersView({Key? key}) : super(key: key);

  @override
  State<RegisterUsersView> createState() => _RegisterUsersViewState();
}

class _RegisterUsersViewState extends State<RegisterUsersView> {
  SessionRepository sessionRepository = SessionRepositoryImpl(
      auth: FirebaseClient.auth(), db: FirebaseClient.db());
  late RegisterUserController registerUserController =
      RegisterUserController(repository: sessionRepository);
  xx() {
    registerUserController.registerUser(UserModel(
        name: 'enio',
        cpf: '23',
        adress: 'sss',
        password: '123456',
        email: 'enio@gmail.com',
        birth: '456'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuarios'),
      ),
      body: ElevatedButton(
          onPressed: () {
            xx();
          },
          child: Text('clicar')),
    );
  }
}
