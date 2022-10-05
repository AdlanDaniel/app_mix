import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository_impl.dart';
import 'package:app_mix/app/routes/routes.dart';
import 'package:flutter/material.dart';

class HomeController {
  SessionRepository repository;

  HomeController({required this.repository});

  dialogLoading(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
              child: CircularProgressIndicator(
                color: Color(0xFF7C4DFF),
              ),
            ),
          );
        });
    Navigator.pop(context);
  }

  signOutUser(context) async {
    dialogLoading(context);

    try {
      await repository.signOutUser();
      Navigator.pushNamed(context, Routes.login);
    } on SignOutError {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Erro ao deslogar')));
    }
  }
}
