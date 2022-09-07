import 'package:flutter/material.dart';

class RegisterUsersView extends StatefulWidget {
  const RegisterUsersView({Key? key}) : super(key: key);

  @override
  State<RegisterUsersView> createState() => _RegisterUsersViewState();
}

class _RegisterUsersViewState extends State<RegisterUsersView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Usuarios'),
      ),
      body: Container(),
    );
  }
}
