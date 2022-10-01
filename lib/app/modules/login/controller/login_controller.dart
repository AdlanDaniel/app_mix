import 'package:app_mix/app/modules/repositories/Models/User_model.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository.dart';
import 'package:app_mix/app/modules/repositories/Session/session_repository_impl.dart';
import 'package:app_mix/app/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController {
  SessionRepository repository;

  LoginController({required this.repository});

  isUserLoad() async {
    final a = await repository.isUserLoaded();
    return  a;
  }

  login(UserModel userModel, context) async {
    dialogLoading(context);

    try {
      await repository.loginUser(userModel);
      Navigator.pop(context);
      dialogSucess(context);
      Navigator.pushNamedAndRemoveUntil(context, Routes.home, (route) => false);
    } on UserNotFoundError {
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Usuario nao encontrado')));
    } on InvalidEmail {
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Email Inválido')));
    } on UserDiseable {
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Usuario Desablitado')));
    } on WrongPassword {
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Senha Incorreta')));
    } on GenericError {
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Erro ao logar')));
    }
  }

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
  }

  dialogSucess(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Center(
                child: Icon(
              Icons.check,
              color: Colors.green,
            )),
            content: Text(
              'Login Efetuado com sucesso',
            ),
          );
        });
    // Navigator.pop(context);
  }

  TextEditingController emailEC = TextEditingController();
  TextEditingController passwordEC = TextEditingController();

  loginUser(context) {
    UserModel user = UserModel();
    user.email = emailEC.text;
    user.password = passwordEC.text;

    login(user, context);
  }
}
