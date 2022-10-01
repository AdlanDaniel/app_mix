import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository_impl.dart';
import 'package:flutter/material.dart';

class HomeController {
  SessionRepository repository;

  HomeController({required this.repository});

  signOutUser(context) async {
    try {
      // if (repository.isUserLoaded() != null) {
      //   print('Usuario logado');
      // } else {
      //   print('Usuario deslogado');
      // }
      await repository.signOutUser();
      // if (repository.isUserLoaded() == null) {
      //   print('usuario deslogado');
      // } else {
      //   print('Usuario continua logado');
      // }
    } on SignOutError {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Erro ao deslogar')));
    }
  }
}
